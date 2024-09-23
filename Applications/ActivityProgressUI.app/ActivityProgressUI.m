uint64_t sub_1000048D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_10004ECC8);
  v1 = sub_100008930(v0, (uint64_t)qword_10004ECC8);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

unint64_t sub_1000049A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  sub_1000088F0((uint64_t *)&unk_10004EF30);
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
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_unknownObjectRetain(v9);
    result = sub_100027FC8(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v6 += 3;
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

unint64_t sub_100004AC0(uint64_t a1)
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
  sub_1000088F0((uint64_t *)&unk_10004FF40);
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
    result = sub_100027FC8(v7, v8);
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

unint64_t sub_100004BE0(uint64_t a1)
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

  v2 = sub_1000088F0(&qword_10004EF18);
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
  sub_1000088F0((uint64_t *)&unk_10004EF20);
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
    sub_100009050(v13, (uint64_t)v5, &qword_10004EF18);
    result = sub_1000280CC((uint64_t)v5);
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

unint64_t sub_100004D74(uint64_t a1)
{
  return sub_100004D8C(a1, &qword_10004EF10);
}

unint64_t sub_100004D80(uint64_t a1)
{
  return sub_100004D8C(a1, (uint64_t *)&unk_10004FF50);
}

unint64_t sub_100004D8C(uint64_t a1, uint64_t *a2)
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
  sub_1000088F0(a2);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
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
    swift_retain(v10);
    result = sub_100027FC8(v8, v9);
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

unint64_t sub_100004EA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000088F0(&qword_10004F030);
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
    sub_100009050(v7, (uint64_t)&v16, &qword_10004F038);
    v8 = v16;
    v9 = v17;
    result = sub_100027FC8(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100009094(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

uint64_t sub_100004FD4()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

id sub_10000525C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SessionSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of APUISystemApertureElement._state()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for APUISystemApertureLayoutState(0);
  v1 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  return EnvironmentObject.init()(v0, v1);
}

uint64_t variable initialization expression of APUIRemoteAlertPresentationHandle.isDismissing()
{
  return 0;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.preferredLayoutMode()
{
  return 4;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.elementIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.associatedAppBundleIdentifier()
{
  return 0;
}

void *variable initialization expression of APUISystemApertureElementHostingController.backgroundActivitiesToSuppress()
{
  return &_swiftEmptySetSingleton;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.contentRole()
{
  return 2;
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding()
{
  return 1;
}

id variable initialization expression of APUISystemApertureElementHostingController.expandedUITransitionCoordinator()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator()), "init");
}

uint64_t variable initialization expression of APUISystemApertureElementHostingController.expandedUIHostingControllerLayoutState()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v0 = type metadata accessor for APUISystemApertureLayoutState(0);
  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  v8 = 0;
  v9 = 0;
  __asm { FMOV            V0.2D, #20.0 }
  v10 = _Q0;
  v11 = _Q0;
  Published.init(initialValue:)(&v8, &type metadata for APUISystemApertureLayoutState.Metrics);
  v8 = 0;
  v9 = 0;
  LOBYTE(v10) = 0;
  Published.init(initialValue:)(&v8, &type metadata for APUISystemApertureLayoutState.Context);
  return v1;
}

char *sub_1000053F8(uint64_t a1)
{
  _BYTE *v1;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  objc_class *v31;
  id v32;
  objc_class *v33;
  char *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  char *result;
  char *v40;
  char *v41;
  uint64_t v42;
  id v43;
  id v44;
  char *v45;
  id v46;
  void *v47;
  char *v48;
  void *v49;
  void **v50;
  void *v51;
  id v52;
  char *v53;
  char *v54;
  uint64_t v55;
  id v56;
  id v57;
  char *v58;
  id v59;
  void *v60;
  char *v61;
  void *v62;
  void **v63;
  void *v64;
  id v65;
  char *v66;
  char *v67;
  uint64_t v68;
  id v69;
  char *v70;
  id v71;
  void *v72;
  char *v73;
  void *v74;
  void **v75;
  void *v76;
  id v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  void *v84;
  void **v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  void *v111;
  char v112[24];
  char v113[24];
  char v114[24];
  char v115[24];
  char v116[24];
  char v117[24];
  char v118[24];
  objc_super v119;
  char v120[24];
  objc_super v121;
  objc_super v122;
  objc_super v123;
  _OWORD v124[9];
  objc_super v125;
  uint64_t v126[2];
  __int128 v127;
  __int128 v128;
  char v129;
  char v130;
  uint64_t v131;
  __int128 v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  __int16 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;

  *(_QWORD *)&v1[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode] = 0;
  *(_QWORD *)&v1[direct field offset for APUISystemApertureElementHostingController.contentRole] = 2;
  *(_QWORD *)&v1[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode] = 4;
  *(_QWORD *)&v1[direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode] = 4;
  v3 = &v1[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  *v3 = 0;
  v3[1] = 0;
  *(_QWORD *)&v1[direct field offset for APUISystemApertureElementHostingController.elementIdentifier] = 0;
  v1[direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding] = 1;
  *(_QWORD *)&v1[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress] = &_swiftEmptySetSingleton;
  v4 = qword_10004F3E0;
  v5 = objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator());
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, "init");
  *(_QWORD *)&v6[qword_10004F3E8] = 0;
  v7 = qword_10004F3F0;
  v8 = type metadata accessor for APUISystemApertureLayoutState(0);
  v9 = swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v137 = 0uLL;
  __asm { FMOV            V0.2D, #20.0 }
  v138 = _Q0;
  v139 = _Q0;
  Published.init(initialValue:)(&v137, &type metadata for APUISystemApertureLayoutState.Metrics);
  v137 = 0uLL;
  LOBYTE(v138) = 0;
  Published.init(initialValue:)(&v137, &type metadata for APUISystemApertureLayoutState.Context);
  *(_QWORD *)&v6[v7] = v9;
  *(_QWORD *)&v6[direct field offset for APUISystemApertureElementHostingController.leadingView] = 0;
  *(_QWORD *)&v6[qword_10004F3F8] = 0;
  *(_QWORD *)&v6[direct field offset for APUISystemApertureElementHostingController.trailingView] = 0;
  *(_QWORD *)&v6[qword_10004F400] = 0;
  *(_QWORD *)&v6[direct field offset for APUISystemApertureElementHostingController.minimalView] = 0;
  *(_QWORD *)&v6[qword_10004F408] = 0;
  *(_QWORD *)&v6[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors] = 1;

  v125.receiver = v6;
  v125.super_class = (Class)sub_1000088F0(&qword_10004EF40);
  v15 = (char *)objc_msgSendSuper2(&v125, "initWithNibName:bundle:", 0, 0);
  v105 = a1;
  sub_10000A59C(a1, (uint64_t)v126);
  v17 = v126[0];
  v16 = v126[1];
  v18 = v129;
  v19 = v130;
  v110 = v132;
  v20 = v131;
  v108 = v134;
  v109 = v133;
  v21 = *(_QWORD *)&v15[qword_10004F3F0];
  v22 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  swift_retain(v21);
  v106 = v128;
  v107 = v127;
  v23 = static ObservableObject.environmentStore.getter(v8, v22);
  KeyPath = swift_getKeyPath(&unk_100035068);
  v25 = swift_getKeyPath(&unk_100035098);
  v26 = *(void **)&v15[qword_10004F3E0];
  *(_QWORD *)&v137 = v17;
  *((_QWORD *)&v137 + 1) = v16;
  v138 = v107;
  v139 = v106;
  LOBYTE(v140) = v18;
  BYTE1(v140) = v19;
  *(_DWORD *)((char *)&v140 + 2) = v135;
  WORD3(v140) = v136;
  *((_QWORD *)&v140 + 1) = v20;
  v141 = v110;
  *(_QWORD *)&v142 = v109;
  *((_QWORD *)&v142 + 1) = v108;
  *(_QWORD *)&v143 = v23;
  *((_QWORD *)&v143 + 1) = v21;
  *(_QWORD *)&v144 = KeyPath;
  BYTE8(v144) = 1;
  *(_QWORD *)&v145 = v25;
  *((_QWORD *)&v145 + 1) = v26;
  v124[6] = v143;
  v124[7] = v144;
  v124[8] = v145;
  v124[2] = v106;
  v124[3] = v140;
  v124[4] = v110;
  v124[5] = v142;
  v124[0] = v137;
  v124[1] = v107;
  v27 = v26;
  sub_1000089A8(v126);
  sub_100008A30((uint64_t *)&v137);
  v28 = sub_1000088F0(&qword_10004EF50);
  v29 = sub_100008B00();
  v30 = AnyView.init<A>(_:)(v124, v28, v29);
  v31 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryViewController();
  v32 = objc_allocWithZone(v31);
  v33 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryView();
  objc_allocWithZone(v33);
  v34 = (char *)v32;
  v35 = swift_retain(v30);
  *(_QWORD *)&v34[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v35);

  v123.receiver = v34;
  v123.super_class = v31;
  v36 = objc_msgSendSuper2(&v123, "initWithNibName:bundle:", 0, 0);
  swift_release(v30);
  v37 = *(void **)&v15[qword_10004F3E8];
  *(_QWORD *)&v15[qword_10004F3E8] = v36;
  v38 = v36;

  objc_msgSend(v15, "addChildViewController:", v38);
  result = (char *)objc_msgSend(v15, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_39;
  }
  v40 = result;
  result = (char *)objc_msgSend(v38, "view");
  if (!result)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v41 = result;
  objc_msgSend(v40, "addSubview:", result);

  objc_msgSend(v38, "didMoveToParentViewController:", v15);
  v42 = *((_QWORD *)&v127 + 1);
  v43 = objc_allocWithZone(v31);
  v44 = objc_allocWithZone(v33);
  swift_retain_n(v42, 2);
  v45 = (char *)v43;
  *(_QWORD *)&v45[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v42);

  v122.receiver = v45;
  v122.super_class = v31;
  v46 = objc_msgSendSuper2(&v122, "initWithNibName:bundle:", 0, 0);
  swift_release(v42);
  v47 = *(void **)&v15[qword_10004F3F8];
  *(_QWORD *)&v15[qword_10004F3F8] = v46;
  v48 = (char *)v46;

  v49 = *(void **)&v48[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v50 = (void **)&v15[direct field offset for APUISystemApertureElementHostingController.leadingView];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.leadingView], v124, 1, 0);
  v51 = *v50;
  *v50 = v49;
  v52 = v49;

  objc_msgSend(v15, "addChildViewController:", v48);
  result = (char *)objc_msgSend(v15, "view");
  if (!result)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v53 = result;
  v111 = v38;
  result = (char *)objc_msgSend(v48, "view");
  if (!result)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v54 = result;
  objc_msgSend(v53, "addSubview:", result);

  objc_msgSend(v48, "didMoveToParentViewController:", v15);
  v55 = v128;
  v56 = objc_allocWithZone(v31);
  v57 = objc_allocWithZone(v33);
  swift_retain_n(v55, 2);
  v58 = (char *)v56;
  *(_QWORD *)&v58[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v55);

  v121.receiver = v58;
  v121.super_class = v31;
  v59 = objc_msgSendSuper2(&v121, "initWithNibName:bundle:", 0, 0);
  swift_release(v55);
  v60 = *(void **)&v15[qword_10004F400];
  *(_QWORD *)&v15[qword_10004F400] = v59;
  v61 = (char *)v59;

  v62 = *(void **)&v61[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v63 = (void **)&v15[direct field offset for APUISystemApertureElementHostingController.trailingView];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.trailingView], v120, 1, 0);
  v64 = *v63;
  *v63 = v62;
  v65 = v62;

  objc_msgSend(v15, "addChildViewController:", v61);
  result = (char *)objc_msgSend(v15, "view");
  if (!result)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v66 = result;
  result = (char *)objc_msgSend(v61, "view");
  if (!result)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v67 = result;
  objc_msgSend(v66, "addSubview:", result);

  objc_msgSend(v61, "didMoveToParentViewController:", v15);
  v68 = *((_QWORD *)&v128 + 1);
  v69 = objc_allocWithZone(v31);
  objc_allocWithZone(v33);
  swift_retain_n(v68, 2);
  v70 = (char *)v69;
  *(_QWORD *)&v70[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v68);

  v119.receiver = v70;
  v119.super_class = v31;
  v71 = objc_msgSendSuper2(&v119, "initWithNibName:bundle:", 0, 0);
  swift_release(v68);
  v72 = *(void **)&v15[qword_10004F408];
  *(_QWORD *)&v15[qword_10004F408] = v71;
  v73 = (char *)v71;

  v74 = *(void **)&v73[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v75 = (void **)&v15[direct field offset for APUISystemApertureElementHostingController.minimalView];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.minimalView], v118, 1, 0);
  v76 = *v75;
  *v75 = v74;
  v77 = v74;

  objc_msgSend(v15, "addChildViewController:", v73);
  result = (char *)objc_msgSend(v15, "view");
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v78 = result;
  result = (char *)objc_msgSend(v73, "view");
  if (!result)
  {
LABEL_45:
    __break(1u);
    return result;
  }
  v79 = result;
  objc_msgSend(v78, "addSubview:", result);

  objc_msgSend(v73, "didMoveToParentViewController:", v15);
  if ((v129 & 1) != 0)
  {
    v80 = &v15[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors], v112, 1, 0);
    if ((*(_QWORD *)v80 & 8) == 0)
      *(_QWORD *)v80 |= 8uLL;
  }
  if ((v130 & 1) != 0)
  {
    v81 = &v15[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors], v113, 1, 0);
    if ((*(_QWORD *)v81 & 0x40) == 0)
      *(_QWORD *)v81 |= 0x40uLL;
  }
  v82 = v131;
  v83 = &v15[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode], v117, 1, 0);
  if (v82 != *(_QWORD *)v83)
    *(_QWORD *)v83 = v82;
  v84 = (void *)v132;
  v85 = (void **)&v15[direct field offset for APUISystemApertureElementHostingController.elementIdentifier];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.elementIdentifier], v116, 1, 0);
  v86 = *v85;
  if (!v84)
  {
    v87 = v105;
    if (!v86)
      goto LABEL_27;
LABEL_26:
    *v85 = v84;
    v95 = v84;

    goto LABEL_27;
  }
  v87 = v105;
  if (!v86)
    goto LABEL_26;
  v88 = static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
  v90 = v89;
  v92 = static String._unconditionallyBridgeFromObjectiveC(_:)(v86);
  v93 = v91;
  if (v88 == v92 && v90 == v91)
  {
    swift_bridgeObjectRelease_n(v90, 2);
    goto LABEL_27;
  }
  v94 = _stringCompareWithSmolCheck(_:_:expecting:)(v88, v90, v92, v91, 0);
  swift_bridgeObjectRelease(v90);
  swift_bridgeObjectRelease(v93);
  if ((v94 & 1) == 0)
  {
    v86 = *v85;
    goto LABEL_26;
  }
LABEL_27:
  v96 = *((_QWORD *)&v132 + 1);
  v97 = v133;
  v98 = &v15[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier], v115, 1, 0);
  v99 = *((_QWORD *)v98 + 1);
  if (v97)
  {
    if (v99)
    {
      if (v96 == *(_QWORD *)v98 && v97 == v99
        || (_stringCompareWithSmolCheck(_:_:expecting:)(v96, v97, *(_QWORD *)v98, *((_QWORD *)v98 + 1), 0) & 1) != 0)
      {
        goto LABEL_35;
      }
      v99 = *((_QWORD *)v98 + 1);
    }
    goto LABEL_34;
  }
  if (v99)
  {
LABEL_34:
    *(_QWORD *)v98 = v96;
    *((_QWORD *)v98 + 1) = v97;
    swift_bridgeObjectRetain(v97);
    swift_bridgeObjectRelease(v99);
  }
LABEL_35:
  v100 = v134;
  v101 = (uint64_t *)&v15[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress];
  swift_beginAccess(&v15[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress], v114, 1, 0);
  v102 = *v101;
  swift_bridgeObjectRetain(*v101);
  v103 = sub_10000F898(v100, v102);

  swift_bridgeObjectRelease(v102);
  sub_100008D14((uint64_t *)&v137);
  swift_release(v87);
  if ((v103 & 1) == 0)
  {
    v104 = *v101;
    *v101 = v100;
    swift_bridgeObjectRetain(v100);
    swift_bridgeObjectRelease(v104);
  }
  sub_100008DE8(v126);
  return v15;
}

uint64_t variable initialization expression of APUIRemoteAlertPresentationRequest.id()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = type metadata accessor for UUID(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = UUID.init()(v2);
  v6 = UUID.uuidString.getter(v5);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v6;
}

unint64_t variable initialization expression of APUIRemoteAlertPresentationManager.remoteAlertPresentationHandlesByID()
{
  return sub_100004D8C((uint64_t)&_swiftEmptyArrayStorage, (uint64_t *)&unk_10004FF50);
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.delegate@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.systemApertureLayoutModeCustomFrameInScreen()
{
  return 0.0;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.screenWidth()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v0, "bounds");
  v2 = v1;

  return v2;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.animationPositionTransformYOffset()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v0, "bounds");
  v2 = v1;

  return v2 / 3.0;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.cornerRadius()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend((id)objc_opt_self(SBUISystemApertureLayoutMetrics), "sharedInstanceForEmbeddedDisplay");
  objc_msgSend(v0, "maximumContinuousCornerRadius");
  v2 = v1;

  return v2;
}

double variable initialization expression of APUISystemApertureElementTransitionCoordinator.systemApertureEdgeInset()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend((id)objc_opt_self(SBUISystemApertureLayoutMetrics), "sharedInstanceForEmbeddedDisplay");
  objc_msgSend(v0, "minimumScreenEdgeInsets");
  v2 = v1;

  return v2;
}

uint64_t type metadata accessor for SessionSceneDelegate()
{
  return objc_opt_self(_TtC18ActivityProgressUI20SessionSceneDelegate);
}

uint64_t initializeBufferWithCopyOfBuffer for APUISystemApertureElement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 initializeWithTake for BackgroundActivityProgressView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000061D8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000061F8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE68, (uint64_t)&unk_100045400);
}

void type metadata accessor for UIInterfaceOrientationMask(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE70, (uint64_t)&unk_100045428);
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE78, (uint64_t)&unk_100045450);
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE80, (uint64_t)&unk_100045478);
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE88, (uint64_t)&unk_100045498);
}

void type metadata accessor for STBackgroundActivityIdentifier(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE90, (uint64_t)&unk_1000454B8);
}

ValueMetadata *type metadata accessor for BackgroundActivityViewControllerFactory()
{
  return &type metadata for BackgroundActivityViewControllerFactory;
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004EE98, (uint64_t)&unk_100045500);
}

uint64_t sub_1000062C0(uint64_t a1, uint64_t a2)
{
  return sub_10000696C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_1000062E4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1000062EC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100006300(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100006330(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100006344(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_100006358@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_100006368(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000637C(uint64_t a1, uint64_t a2)
{
  return sub_10000696C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006388(uint64_t a1, id *a2)
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

uint64_t sub_1000063FC(uint64_t a1, id *a2)
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

uint64_t sub_100006478@<X0>(_QWORD *a1@<X8>)
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

void sub_1000064B8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000064C4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_QWORD *sub_1000064EC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_1000064F8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_10000650C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_100006520@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10000654C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_100006570(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_100006584@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100006598(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1000065AC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1000065C0(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1000065D4()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1000065E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_1000065FC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_100006614(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_10000669C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000067D0(&qword_10004EEF0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034D30);
  v3 = sub_1000067D0(&qword_10004EEF8, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034CD8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006720(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000067D0(&qword_10004EF00, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100034BF0);
  v3 = sub_1000067D0(&qword_10004EF08, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100034B98);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000067A4()
{
  return sub_1000067D0(&qword_10004EEA0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100034B60);
}

uint64_t sub_1000067D0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006810()
{
  return sub_1000067D0(&qword_10004EEA8, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100034B38);
}

uint64_t sub_10000683C()
{
  return sub_1000067D0(&qword_10004EEB0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100034BC8);
}

uint64_t sub_100006868@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_1000088B8(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_1000068A4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000068E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000067D0(&qword_10004F040, (uint64_t (*)(uint64_t))type metadata accessor for ProgressUserInfoKey, (uint64_t)&unk_100035220);
  v3 = sub_1000067D0(&qword_10004F048, (uint64_t (*)(uint64_t))type metadata accessor for ProgressUserInfoKey, (uint64_t)&unk_100035174);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000696C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_1000069A8(uint64_t a1)
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

Swift::Int sub_1000069E8(uint64_t a1)
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

uint64_t sub_100006A58()
{
  return sub_1000067D0(&qword_10004EEB8, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034CA0);
}

uint64_t sub_100006A84()
{
  return sub_1000067D0(&qword_10004EEC0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034C78);
}

uint64_t sub_100006AB0()
{
  return sub_1000067D0(&qword_10004EEC8, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034D08);
}

uint64_t sub_100006ADC()
{
  return sub_1000067D0(&qword_10004EED0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100034E48);
}

uint64_t sub_100006B08()
{
  return sub_1000067D0(&qword_10004EED8, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100034E18);
}

uint64_t sub_100006B34()
{
  return sub_1000067D0(&qword_10004EEE0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100034E70);
}

uint64_t sub_100006B60()
{
  return sub_1000067D0(&qword_10004EEE8, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100034EA8);
}

char *sub_100006B8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_10004ECC0 != -1)
    swift_once(&qword_10004ECC0, sub_1000048D4);
  v2 = type metadata accessor for Logger(0);
  sub_100008930(v2, (uint64_t)qword_10004ECC8);
  v3 = swift_retain_n(a1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    *(_DWORD *)v6 = 136315138;
    v17 = v7;
    v8 = type metadata accessor for UUID(0);
    v9 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v10 = dispatch thunk of CustomStringConvertible.description.getter(v8, v9);
    v12 = v11;
    v16 = sub_10002785C(v10, v11, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Creating system aperture view controller for background activity with ID: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release_n(a1, 2);
  }
  v13 = objc_allocWithZone((Class)sub_1000088F0(&qword_10004EF40));
  v14 = swift_retain(a1);
  return sub_1000053F8(v14);
}

char *sub_100006D8C(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  objc_class *v19;
  char *v20;
  char *result;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  void *v26;
  id v27;
  char *v28;
  id v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  char *v35;
  id v36;
  id v37;
  char *v38;
  id v39;
  char *v40;
  id v41;
  id v42;
  char *v43;
  id v44;
  char *v45;
  id v46;
  id v47;
  char *v48;
  id v49;
  char *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  Class isa;
  uint64_t v56;
  objc_super v57;
  _QWORD v58[2];
  char v59;

  v7 = type metadata accessor for UIHostingControllerSizingOptions(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone((Class)sub_1000088F0(&qword_10004EFC0));
  v58[0] = a1;
  v58[1] = a2;
  v59 = a3 & 1;
  v11 = v3;
  sub_100008E74(a1, a2);
  v12 = (void *)UIHostingController.init(rootView:)(v58);
  v13 = sub_1000088F0(&qword_10004EFC8);
  v14 = swift_allocObject(v13, ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72), *(unsigned __int8 *)(v8 + 80) | 7);
  *(_OWORD *)(v14 + 16) = xmmword_1000349A0;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  v58[0] = v14;
  v15 = sub_1000067D0((unint64_t *)&qword_10004EFD0, (uint64_t (*)(uint64_t))&type metadata accessor for UIHostingControllerSizingOptions, (uint64_t)&protocol conformance descriptor for UIHostingControllerSizingOptions);
  v16 = sub_1000088F0(&qword_10004EFD8);
  v17 = sub_100008E7C((unint64_t *)&qword_10004EFE0, &qword_10004EFD8, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(v58, v16, v17, v7, v15);
  dispatch thunk of UIHostingController.sizingOptions.setter(v10);
  *(_QWORD *)&v11[qword_100050900] = v12;
  v18 = v12;

  v19 = (objc_class *)sub_1000088F0(&qword_10004EFB8);
  v57.receiver = v11;
  v57.super_class = v19;
  v20 = (char *)objc_msgSendSuper2(&v57, "initWithNibName:bundle:", 0, 0);
  result = (char *)objc_msgSend(v20, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v22 = result;
  v23 = qword_100050900;
  result = (char *)objc_msgSend(*(id *)&v20[qword_100050900], "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v24 = result;
  objc_msgSend(v22, "addSubview:", result);

  objc_msgSend(v20, "addChildViewController:", *(_QWORD *)&v20[v23]);
  result = (char *)objc_msgSend(v20, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v25 = result;
  v26 = (void *)objc_opt_self(UIColor);
  v27 = objc_msgSend(v26, "clearColor");
  objc_msgSend(v25, "setBackgroundColor:", v27);

  result = (char *)objc_msgSend(v18, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v28 = result;
  v29 = objc_msgSend(v26, "clearColor");
  objc_msgSend(v28, "setBackgroundColor:", v29);

  result = (char *)objc_msgSend(v18, "view");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v30 = result;
  objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v31 = sub_1000088F0(&qword_10004FDA0);
  v32 = swift_allocObject(v31, 64, 7);
  *(_OWORD *)(v32 + 16) = xmmword_1000349B0;
  result = (char *)objc_msgSend(v18, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v33 = result;
  v34 = objc_msgSend(result, "topAnchor");

  result = (char *)objc_msgSend(v20, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v35 = result;
  v36 = objc_msgSend(result, "topAnchor");

  v37 = objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  *(_QWORD *)(v32 + 32) = v37;
  result = (char *)objc_msgSend(v18, "view");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v38 = result;
  v39 = objc_msgSend(result, "leadingAnchor");

  result = (char *)objc_msgSend(v20, "view");
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v40 = result;
  v41 = objc_msgSend(result, "leadingAnchor");

  v42 = objc_msgSend(v39, "constraintEqualToAnchor:", v41);
  *(_QWORD *)(v32 + 40) = v42;
  result = (char *)objc_msgSend(v18, "view");
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v43 = result;
  v44 = objc_msgSend(result, "trailingAnchor");

  result = (char *)objc_msgSend(v20, "view");
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v45 = result;
  v46 = objc_msgSend(result, "trailingAnchor");

  v47 = objc_msgSend(v44, "constraintEqualToAnchor:", v46);
  *(_QWORD *)(v32 + 48) = v47;
  result = (char *)objc_msgSend(v18, "view");
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v48 = result;
  v49 = objc_msgSend(result, "bottomAnchor");

  result = (char *)objc_msgSend(v20, "view");
  if (result)
  {
    v50 = result;
    v51 = (void *)objc_opt_self(NSLayoutConstraint);
    v52 = objc_msgSend(v50, "bottomAnchor");

    v53 = objc_msgSend(v49, "constraintEqualToAnchor:", v52);
    *(_QWORD *)(v32 + 56) = v53;
    v58[0] = v32;
    specialized Array._endMutation()();
    v54 = v58[0];
    sub_100008EBC();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v54);
    objc_msgSend(v51, "activateConstraints:", isa);

    return v20;
  }
LABEL_27:
  __break(1u);
  return result;
}

char *sub_1000073C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_10004ECC0 != -1)
    swift_once(&qword_10004ECC0, sub_1000048D4);
  v2 = type metadata accessor for Logger(0);
  sub_100008930(v2, (uint64_t)qword_10004ECC8);
  v3 = swift_retain_n(a1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    *(_DWORD *)v6 = 136315138;
    v17 = v7;
    v8 = type metadata accessor for UUID(0);
    v9 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v10 = dispatch thunk of CustomStringConvertible.description.getter(v8, v9);
    v12 = v11;
    v16 = sub_10002785C(v10, v11, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17);
    swift_release_n(a1, 2);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Creating live activities view controller for background activity with ID: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release_n(a1, 2);
  }
  v13 = objc_allocWithZone((Class)sub_1000088F0(&qword_10004EFB8));
  swift_retain(a1);
  v14 = sub_100006D8C((uint64_t)sub_100008E6C, a1, 0);
  swift_release(a1);
  return v14;
}

void sub_1000075E0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  unint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
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
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v64;
  id v65;
  int v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  void *v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  char *v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char *v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint8_t *v91;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v93;
  uint64_t v94;
  id v95;
  os_log_type_t v96;
  uint8_t *v97;
  _QWORD *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint8_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  _QWORD v112[2];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004ECC0 != -1)
LABEL_54:
    swift_once(&qword_10004ECC0, sub_1000048D4);
  v8 = sub_100008930(v4, (uint64_t)qword_10004ECC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a2;
  v10 = a1;
  v11 = v9;
  v12 = v10;
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    LODWORD(v106) = v14;
    v107 = (uint8_t *)v5;
    v105 = v8;
    v15 = swift_slowAlloc(22, -1);
    v104 = (id)swift_slowAlloc(64, -1);
    v109 = (uint64_t)v104;
    *(_DWORD *)v15 = 136315394;
    v16 = objc_msgSend(v11, "role");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v19 = v18;

    v111 = sub_10002785C(v17, v19, &v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, v112);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v15 + 12) = 2080;
    v20 = type metadata accessor for ActivityScene(0);
    if (swift_dynamicCastClass(v12, v20)
      && (KeyPath = swift_getKeyPath(&unk_100034FA8),
          dispatch thunk of ActivityScene.subscript.getter(&v111, KeyPath, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey), swift_release(KeyPath), (v22 = v112[0]) != 0))
    {
      v23 = v111;
    }
    else
    {
      swift_bridgeObjectRelease(0);
      v22 = 0xE500000000000000;
      v23 = 0x3E6C696E3CLL;
    }
    v24 = v107;
    v111 = sub_10002785C(v23, v22, &v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, v112);

    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v106, "SessionSceneDelegate: Scene will connect called with role: %s, activity identifier: %s", (uint8_t *)v15, 0x16u);
    v25 = v104;
    swift_arrayDestroy(v104, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*((void (**)(char *, uint64_t))v24 + 1))(v7, v4);
    v8 = v105;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v26 = type metadata accessor for ActivityScene(0);
  v27 = swift_dynamicCastClass(v12, v26);
  if (!v27)
  {
    v42 = Logger.logObject.getter(0);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "SessionSceneDelegate: Received a UIScene that is not of type SessionScene.", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }
    goto LABEL_62;
  }
  v28 = (id)v27;
  v29 = v12;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.default.getter();
  v32 = os_log_type_enabled(v30, v31);
  v104 = v28;
  if (v32)
  {
    v33 = (uint8_t *)swift_slowAlloc(12, -1);
    v34 = swift_slowAlloc(32, -1);
    v111 = v34;
    *(_DWORD *)v33 = 136315138;
    v107 = v33 + 4;
    v35 = v29;
    v36 = v8;
    v37 = objc_msgSend(v28, "description");
    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
    v40 = v39;

    v8 = v36;
    v29 = v35;
    v109 = sub_10002785C(v38, v40, (uint64_t *)&v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v109, &v110);

    v41 = v40;
    v28 = v104;
    swift_bridgeObjectRelease(v41);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "SessionSceneDelegate: Connecting session scene: %s", v33, 0xCu);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v33, -1, -1);

  }
  else
  {

  }
  v45 = swift_getKeyPath(&unk_100034FA8);
  dispatch thunk of ActivityScene.subscript.getter(&v111, v45, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey);
  swift_release(v45);
  if (!v112[0])
  {
LABEL_60:
    v95 = v29;
    v42 = Logger.logObject.getter(v95);
    v96 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v42, v96))
    {

      return;
    }
    v97 = (uint8_t *)swift_slowAlloc(12, -1);
    v98 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v97 = 138412290;
    v111 = (unint64_t)v28;
    v99 = v95;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v111, v112);
    *v98 = v28;

    _os_log_impl((void *)&_mh_execute_header, v42, v96, "Unable to find a background activity to represent with session scene: %@", v97, 0xCu);
    v100 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v98, 1, v100);
    swift_slowDealloc(v98, -1, -1);
    swift_slowDealloc(v97, -1, -1);

LABEL_62:
    return;
  }
  v107 = (uint8_t *)v112[0];
  v106 = v111;
  if (qword_10004ED08 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  v46 = qword_100050B18;
  v47 = swift_getKeyPath(&unk_100034FD8);
  v48 = swift_getKeyPath(&unk_100035000);
  static Published.subscript.getter(&v111, v46, v47, v48);
  swift_release(v47);
  swift_release(v48);
  v49 = v111;
  v5 = sub_100021BF8(v111);
  swift_bridgeObjectRelease(v49);
  v50 = swift_getKeyPath(&unk_100035020);
  v51 = swift_getKeyPath(&unk_100035048);
  static Published.subscript.getter(&v111, v46, v50, v51);
  swift_release(v50);
  swift_release(v51);
  v52 = v111;
  v53 = sub_100021BF8(v111);
  swift_bridgeObjectRelease(v52);
  v111 = v5;
  sub_10001F6A8(v53);
  v54 = v111;
  v102 = v29;
  if (v111 >> 62)
  {
    if ((v111 & 0x8000000000000000) != 0)
      v94 = v111;
    else
      v94 = v111 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v111);
    a1 = (void *)_CocoaArrayWrapper.endIndex.getter(v94);
    swift_bridgeObjectRelease(v54);
    if (a1)
      goto LABEL_20;
    goto LABEL_59;
  }
  a1 = *(void **)((v111 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!a1)
  {
LABEL_59:
    swift_bridgeObjectRelease(v107);
    swift_bridgeObjectRelease(v54);
    v29 = v102;
    v28 = v104;
    goto LABEL_60;
  }
LABEL_20:
  v105 = v8;
  v7 = (char *)(v54 & 0xC000000000000001);
  v55 = 4;
  while (1)
  {
    a2 = (void *)(v55 - 4);
    if (v7)
    {
      v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(v55 - 4, v54);
      v56 = (void *)(v55 - 3);
      if (__OFADD__(a2, 1))
        goto LABEL_53;
    }
    else
    {
      v4 = *(_QWORD *)(v54 + 8 * v55);
      swift_retain(v4);
      v56 = (void *)(v55 - 3);
      if (__OFADD__(a2, 1))
      {
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
    }
    v57 = *(_QWORD *)(v4 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity);
    if (v57)
      break;
LABEL_21:
    swift_release(v4);
    ++v55;
    if (v56 == a1)
      goto LABEL_59;
  }
  v58 = v4;
  v59 = swift_retain(*(_QWORD *)(v4 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity));
  v60 = Activity.id.getter(v59);
  v62 = v61;
  swift_release(v57);
  if (v60 != v106 || v107 != (uint8_t *)v62)
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v60, v62, v106, v107, 0);
    swift_bridgeObjectRelease(v62);
    v4 = v58;
    if ((v5 & 1) != 0)
    {
      swift_bridgeObjectRelease(v107);
      v62 = v54;
      goto LABEL_36;
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRelease(v107);
  swift_bridgeObjectRelease(v54);
  v4 = v58;
LABEL_36:
  swift_bridgeObjectRelease(v62);
  v64 = v104;
  v65 = objc_msgSend(v104, "SBUI_isHostedBySystemAperture");
  v66 = (int)v65;
  v67 = Logger.logObject.getter(v65);
  v68 = static os_log_type_t.default.getter();
  v69 = os_log_type_enabled(v67, v68);
  v70 = v102;
  if (v66)
  {
    if (v69)
    {
      v71 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "SessionSceneDelegate: Received ActivityKit scene hosted by system aperture", v71, 2u);
      swift_slowDealloc(v71, -1, -1);
    }

    v72 = swift_getKeyPath(&unk_100034FA8);
    dispatch thunk of ActivityScene.subscript.getter(&v111, v72, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey);
    swift_release(v72);
    v73 = v112[0];
    if (v112[0])
    {
      v74 = v111;
    }
    else
    {
      v79 = objc_msgSend(v64, "session");
      v80 = objc_msgSend(v79, "persistentIdentifier");

      v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v80);
      v73 = v81;

    }
    v82 = (_QWORD *)(v103 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_systemApertureElementProvidersByID);
    swift_beginAccess(v103 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_systemApertureElementProvidersByID, &v111, 0, 0);
    v83 = *v82;
    if (*(_QWORD *)(*v82 + 16))
    {
      swift_bridgeObjectRetain(v73);
      swift_bridgeObjectRetain(v83);
      v84 = sub_100027FC8(v74, v73);
      if ((v85 & 1) != 0)
      {
        v86 = *(char **)(*(_QWORD *)(v83 + 56) + 8 * v84);
        swift_unknownObjectRetain_n(v86, 2);
        swift_bridgeObjectRelease(v73);
        v87 = swift_bridgeObjectRelease(v83);
        v88 = Logger.logObject.getter(v87);
        v89 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v88, v89))
        {
          v90 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v90 = 0;
          _os_log_impl((void *)&_mh_execute_header, v88, v89, "SessionSceneDelegate: using cachedSystemApertureElementProvider", v90, 2u);
          v91 = v90;
          v4 = v58;
          swift_slowDealloc(v91, -1, -1);
          swift_unknownObjectRelease(v86);

        }
        else
        {

          swift_unknownObjectRelease(v86);
        }
        goto LABEL_51;
      }
      swift_bridgeObjectRelease(v73);
      swift_bridgeObjectRelease(v83);
    }
    v86 = sub_100006B8C(v4);
LABEL_51:
    objc_msgSend(v64, "setSystemApertureElementViewControllerProvider:", v86);
    swift_beginAccess(v82, &v109, 33, 0);
    swift_unknownObjectRetain(v86);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v82);
    v108 = *v82;
    *v82 = 0x8000000000000000;
    sub_10001F05C((uint64_t)v86, v74, v73, isUniquelyReferenced_nonNull_native);
    v93 = *v82;
    *v82 = v108;
    swift_bridgeObjectRelease(v73);
    swift_bridgeObjectRelease(v93);
    swift_endAccess(&v109);
    swift_release(v4);

    swift_unknownObjectRelease(v86);
    return;
  }
  if (v69)
  {
    v75 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v67, v68, "SessionSceneDelegate: Received ActivityKit scene not hosted in system aperture", v75, 2u);
    swift_slowDealloc(v75, -1, -1);
  }

  v76 = sub_1000073C0(v4);
  v77 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for APUISecureWindow()), "initWithWindowScene:", v64);
  objc_msgSend(v77, "setRootViewController:", v76);
  objc_msgSend(v77, "makeKeyAndVisible");
  v78 = *(void **)(v103 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window);
  *(_QWORD *)(v103 + OBJC_IVAR____TtC18ActivityProgressUI20SessionSceneDelegate_window) = v77;

  swift_release(v4);
}

id sub_100008244(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  unint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  id result;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004ECC0 != -1)
    swift_once(&qword_10004ECC0, sub_1000048D4);
  v6 = sub_100008930(v2, (uint64_t)qword_10004ECC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, (os_log_type_t)v9))
  {
    v25 = v9;
    v10 = swift_slowAlloc(22, -1);
    v26 = swift_slowAlloc(64, -1);
    v29 = v26;
    *(_DWORD *)v10 = 136315394;
    v11 = objc_msgSend(v7, "session");
    v12 = objc_msgSend(v11, "role");

    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v15 = v14;

    v27 = sub_10002785C(v13, v15, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);

    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v10 + 12) = 2080;
    v16 = type metadata accessor for ActivityScene(0);
    if (swift_dynamicCastClass(v7, v16)
      && (KeyPath = swift_getKeyPath(&unk_100034FA8),
          dispatch thunk of ActivityScene.subscript.getter(&v27, KeyPath, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey), swift_release(KeyPath), (v18 = v28) != 0))
    {
      v19 = v27;
    }
    else
    {
      swift_bridgeObjectRelease(0);
      v18 = 0xE500000000000000;
      v19 = 0x3E6C696E3CLL;
    }
    v20 = v25;
    v27 = sub_10002785C(v19, v18, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);

    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v20, "SessionSceneDelegate: sceneDidBecomeActive with role: %s, activity identifier: %s", (uint8_t *)v10, 0x16u);
    v21 = v26;
    swift_arrayDestroy(v26, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

  }
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_10004ED08 != -1)
    result = (id)swift_once(&qword_10004ED08, sub_100018C5C);
  v23 = qword_100050B18;
  if (*(_BYTE *)(qword_100050B18
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation) == 1)
  {
    *(_BYTE *)(qword_100050B18
             + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation) = 0;
    return objc_msgSend(*(id *)(v23 + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator), "notificationOccurred:", 0);
  }
  return result;
}

uint64_t sub_1000085B0(void *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  unint64_t v20;
  uint64_t v21;
  const char *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004ECC0 != -1)
    swift_once(&qword_10004ECC0, sub_1000048D4);
  v8 = sub_100008930(v4, (uint64_t)qword_10004ECC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    HIDWORD(v26) = v11;
    v27 = a2;
    v12 = swift_slowAlloc(22, -1);
    v28 = swift_slowAlloc(64, -1);
    v31 = v28;
    *(_DWORD *)v12 = 136315394;
    v13 = objc_msgSend(v9, "session");
    v14 = objc_msgSend(v13, "role");

    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v17 = v16;

    v29 = sub_10002785C(v15, v17, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);

    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v12 + 12) = 2080;
    v18 = type metadata accessor for ActivityScene(0);
    if (swift_dynamicCastClass(v9, v18)
      && (KeyPath = swift_getKeyPath(&unk_100034FA8),
          dispatch thunk of ActivityScene.subscript.getter(&v29, KeyPath, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey), swift_release(KeyPath), (v20 = v30) != 0))
    {
      v21 = v29;
    }
    else
    {
      swift_bridgeObjectRelease(0);
      v20 = 0xE500000000000000;
      v21 = 0x3E6C696E3CLL;
    }
    v22 = v27;
    v23 = BYTE4(v26);
    v29 = sub_10002785C(v21, v20, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);

    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v10, v23, v22, (uint8_t *)v12, 0x16u);
    v24 = v28;
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000088B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1000088F0(uint64_t *a1)
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

uint64_t sub_100008930(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100008948(uint64_t a1, uint64_t *a2)
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

uint64_t *sub_1000089A8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = (void *)a1[8];
  v8 = a1[11];
  swift_bridgeObjectRetain(a1[10]);
  swift_bridgeObjectRetain(v8);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  v9 = v7;
  return a1;
}

uint64_t *sub_100008A30(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = (void *)a1[8];
  v8 = a1[10];
  v9 = a1[11];
  v10 = a1[12];
  v13 = a1[13];
  v14 = a1[14];
  v15 = a1[16];
  swift_unknownObjectRetain(a1[17]);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  v11 = v7;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  swift_retain(v13);
  swift_retain(v14);
  swift_retain(v15);
  return a1;
}

unint64_t sub_100008B00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EF58;
  if (!qword_10004EF58)
  {
    v1 = sub_100008B84(&qword_10004EF50);
    sub_100008BC8();
    sub_100008E7C(&qword_10004EFA8, &qword_10004EFB0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10004EF58);
  }
  return result;
}

uint64_t sub_100008B84(uint64_t *a1)
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

unint64_t sub_100008BC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EF60;
  if (!qword_10004EF60)
  {
    v1 = sub_100008B84(&qword_10004EF68);
    sub_100008C4C();
    sub_100008E7C(&qword_10004EF98, &qword_10004EFA0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10004EF60);
  }
  return result;
}

unint64_t sub_100008C4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EF70;
  if (!qword_10004EF70)
  {
    v1 = sub_100008B84(&qword_10004EF78);
    sub_100008CD0();
    sub_100008E7C(&qword_10004EF88, &qword_10004EF90, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10004EF70);
  }
  return result;
}

unint64_t sub_100008CD0()
{
  unint64_t result;

  result = qword_10004EF80;
  if (!qword_10004EF80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for APUISystemApertureElement, &type metadata for APUISystemApertureElement);
    atomic_store(result, (unint64_t *)&qword_10004EF80);
  }
  return result;
}

uint64_t *sub_100008D14(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = (void *)a1[8];
  v8 = a1[11];
  v9 = a1[12];
  v12 = a1[10];
  v13 = a1[13];
  v10 = a1[14];
  v14 = a1[17];
  swift_release(a1[16]);
  swift_release(v10);
  swift_release(v9);
  swift_bridgeObjectRelease(v8);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_release(v2);

  swift_bridgeObjectRelease(v12);
  swift_release(v13);
  swift_unknownObjectRelease(v14);
  return a1;
}

uint64_t *sub_100008DE8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = (void *)a1[8];
  v8 = a1[10];
  swift_bridgeObjectRelease(a1[11]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_release(v2);

  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t sub_100008E6C()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_100008E74(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_100008E7C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100008B84(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008EBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EFF0;
  if (!qword_10004EFF0)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004EFF0);
  }
  return result;
}

void type metadata accessor for ProgressUserInfoKey(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004F000, (uint64_t)&unk_100045528);
}

__n128 sub_100008F0C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100008F88(a1, &qword_10004F008, (uint64_t)&unk_1000455A8);
}

uint64_t sub_100008F2C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100008F4C(uint64_t result, int a2, int a3)
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
  sub_100008F88(a1, &qword_10004F010, (uint64_t)&unk_100045628);
}

void sub_100008F88(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100008FCC()
{
  return sub_1000067D0(&qword_10004F018, (uint64_t (*)(uint64_t))type metadata accessor for ProgressUserInfoKey, (uint64_t)&unk_100035138);
}

uint64_t sub_100008FF8()
{
  return sub_1000067D0(&qword_10004F020, (uint64_t (*)(uint64_t))type metadata accessor for ProgressUserInfoKey, (uint64_t)&unk_10003510C);
}

uint64_t sub_100009024()
{
  return sub_1000067D0(&qword_10004F028, (uint64_t (*)(uint64_t))type metadata accessor for ProgressUserInfoKey, (uint64_t)&unk_1000351A8);
}

uint64_t sub_100009050(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000088F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100009094(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void APUISystemApertureElementHostingController.expandedUITransitionCoordinator.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1000090EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_10004F110);
  v1 = sub_100008930(v0, (uint64_t)qword_10004F110);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10000917C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for PillActor();
  v1 = swift_allocObject(v0, 112, 15);
  result = swift_defaultActor_initialize();
  qword_100050AD8 = v1;
  return result;
}

uint64_t sub_1000091B4()
{
  uint64_t v0;

  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for PillActor()
{
  return objc_opt_self(_TtC18ActivityProgressUI9PillActor);
}

uint64_t sub_1000091F0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000091FC()
{
  if (qword_10004ECE8 != -1)
    swift_once(&qword_10004ECE8, sub_10000917C);
  return swift_retain(qword_100050AD8);
}

uint64_t sub_10000923C()
{
  uint64_t v0;

  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

uint64_t sub_100009244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = sub_1000088F0(&qword_10004F288);
  __chkstk_darwin(v1);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004ED08 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  v4 = qword_100050B18;
  KeyPath = swift_getKeyPath(&unk_100035350);
  v6 = swift_getKeyPath(&unk_100035378);
  static Published.subscript.getter(&v17, v4, KeyPath, v6);
  swift_release(KeyPath);
  swift_release(v6);
  v7 = *(_QWORD *)(v17 + 16);
  result = swift_bridgeObjectRelease(v17);
  if (v7)
  {
    v9 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
    v10 = swift_allocObject(&unk_100045800, 24, 7);
    swift_weakInit(v10 + 16, v0);
    v11 = qword_10004ECE8;
    swift_retain(v10);
    if (v11 != -1)
      swift_once(&qword_10004ECE8, sub_10000917C);
    v12 = qword_100050AD8;
    v13 = sub_10000A218();
    v14 = (_QWORD *)swift_allocObject(&unk_100045918, 40, 7);
    v14[2] = v12;
    v14[3] = v13;
    v14[4] = v10;
    swift_retain(v12);
    swift_release(v10);
    v15 = sub_100017918((uint64_t)v3, (uint64_t)&unk_10004F2A8, (uint64_t)v14);
    return swift_release(v15);
  }
  return result;
}

uint64_t sub_100009400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a4;
  if (qword_10004ECE8 != -1)
    swift_once(&qword_10004ECE8, sub_10000917C);
  return swift_task_switch(sub_100009464, qword_100050AD8, 0);
}

uint64_t sub_100009464()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *Strong;
  _QWORD *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = (_QWORD *)swift_weakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    if (!Strong[5])
    {
      v4 = objc_msgSend(objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution), "initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:", Strong[2], Strong[3], 1);
      sub_100009504(v4);

    }
    swift_release(v3);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009504(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  void **v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  os_log_type_t v13;
  _QWORD *v14;
  id v15;
  void **v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void **v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void **v29;
  uint64_t result;
  void **aBlock;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  v2 = v1;
  if (qword_10004ECE0 != -1)
    swift_once(&qword_10004ECE0, sub_1000090EC);
  v4 = type metadata accessor for Logger(0);
  sub_100008930(v4, (uint64_t)qword_10004F110);
  v5 = a1;
  swift_retain_n(v1, 2);
  v6 = (void **)v5;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(16, -1);
    v11 = (_QWORD *)v10;
    *(_DWORD *)v9 = 138412546;
    v12 = *(void **)(v2 + 40);
    if (v12)
    {
      aBlock = *(void ***)(v2 + 40);
      v13 = v8;
      v14 = (_QWORD *)v10;
      v15 = v12;
      v11 = v14;
      v8 = v13;
    }
    else
    {
      aBlock = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v32);
    *v11 = v12;
    swift_release_n(v2, 2);
    *(_WORD *)(v9 + 12) = 2112;
    if (a1)
    {
      aBlock = v6;
      v16 = v6;
    }
    else
    {
      aBlock = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v32);
    v11[1] = a1;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Updating status pill attribution from %@ to %@", (uint8_t *)v9, 0x16u);
    v17 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v11, 2, v17);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_release_n(v2, 2);
  }
  v18 = *(void **)(v2 + 32);
  v19 = swift_allocObject(&unk_100045800, 24, 7);
  swift_weakInit(v19 + 16, v2);
  v20 = swift_allocObject(&unk_100045850, 32, 7);
  *(_QWORD *)(v20 + 16) = v19;
  *(_QWORD *)(v20 + 24) = a1;
  v21 = swift_allocObject(&unk_100045878, 32, 7);
  *(_QWORD *)(v21 + 16) = sub_10000A344;
  *(_QWORD *)(v21 + 24) = v20;
  v35 = sub_10000A35C;
  v36 = v21;
  aBlock = _NSConcreteStackBlock;
  v32 = 1107296256;
  v33 = sub_100009C68;
  v34 = &unk_100045890;
  v22 = _Block_copy(&aBlock);
  v23 = v36;
  v24 = v6;
  swift_retain(v21);
  swift_release(v23);
  v25 = swift_allocObject(&unk_100045800, 24, 7);
  swift_weakInit(v25 + 16, v2);
  v26 = swift_allocObject(&unk_1000458C8, 32, 7);
  *(_QWORD *)(v26 + 16) = v25;
  *(_QWORD *)(v26 + 24) = a1;
  v35 = sub_10000A3C4;
  v36 = v26;
  aBlock = _NSConcreteStackBlock;
  v32 = 1107296256;
  v33 = sub_1000134A0;
  v34 = &unk_1000458E0;
  v27 = _Block_copy(&aBlock);
  v28 = v36;
  v29 = v24;
  swift_release(v28);
  objc_msgSend(v18, "updateData:completion:", v22, v27);
  _Block_release(v27);
  _Block_release(v22);
  LOBYTE(v27) = swift_isEscapingClosureAtFileLocation(v21, "", 115, 54, 30, 1);
  swift_release(v20);
  result = swift_release(v21);
  if ((v27 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_100009934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = sub_1000088F0(&qword_10004F288);
  __chkstk_darwin(v1);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004ED08 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  v4 = qword_100050B18;
  KeyPath = swift_getKeyPath(&unk_100035350);
  v6 = swift_getKeyPath(&unk_100035378);
  static Published.subscript.getter(&v17, v4, KeyPath, v6);
  swift_release(KeyPath);
  swift_release(v6);
  v7 = *(_QWORD *)(v17 + 16);
  result = swift_bridgeObjectRelease(v17);
  if (!v7)
  {
    v9 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
    v10 = swift_allocObject(&unk_100045800, 24, 7);
    swift_weakInit(v10 + 16, v0);
    v11 = qword_10004ECE8;
    swift_retain(v10);
    if (v11 != -1)
      swift_once(&qword_10004ECE8, sub_10000917C);
    v12 = qword_100050AD8;
    v13 = sub_10000A218();
    v14 = (_QWORD *)swift_allocObject(&unk_100045828, 40, 7);
    v14[2] = v12;
    v14[3] = v13;
    v14[4] = v10;
    swift_retain(v12);
    swift_release(v10);
    v15 = sub_100017918((uint64_t)v3, (uint64_t)&unk_10004F298, (uint64_t)v14);
    return swift_release(v15);
  }
  return result;
}

uint64_t sub_100009AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a4;
  if (qword_10004ECE8 != -1)
    swift_once(&qword_10004ECE8, sub_10000917C);
  return swift_task_switch(sub_100009B54, qword_100050AD8, 0);
}

uint64_t sub_100009B54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    if (*(_QWORD *)(Strong + 40))
      sub_100009504(0);
    swift_release(v3);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009BC0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _BYTE v10[24];

  v7 = a3 + 16;
  swift_beginAccess(a3 + 16, v10, 0, 0);
  result = swift_weakLoadStrong(v7);
  if (result)
  {
    v9 = result;
    if (*(_QWORD *)(result + 40))
      objc_msgSend(a1, "removeAttribution:");
    if (a4)
      objc_msgSend(a1, "addAttribution:", a4);
    objc_msgSend(a2, "setUserInitiated:", 1);
    return swift_release(v9);
  }
  return result;
}

void sub_100009C68(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

void sub_100009CBC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _BYTE v13[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v13, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    v6 = *(void **)(Strong + 40);
    *(_QWORD *)(Strong + 40) = a2;
    v7 = a2;

    if (qword_10004ECE0 != -1)
      swift_once(&qword_10004ECE0, sub_1000090EC);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_100008930(v8, (uint64_t)qword_10004F110);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Updated status pill attribution", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
      swift_release(v5);

    }
    else
    {

      swift_release(v5);
    }
  }
}

uint64_t sub_100009DE4()
{
  uint64_t v0;
  id *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void **v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void **v10;
  uint64_t v11;
  id (*v12)(void *);
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void **v18;
  void *v19;
  uint64_t result;
  _QWORD *v21;
  void **aBlock;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v1 = (id *)v0;
  v2 = *(void **)(v0 + 40);
  if (!v2)
  {
    v12 = 0;
    v13 = 0;
LABEL_9:

    sub_10000A468((uint64_t)v12, v13);
    return (uint64_t)v1;
  }
  v3 = qword_10004ECE0;
  v4 = v2;
  if (v3 != -1)
    swift_once(&qword_10004ECE0, sub_1000090EC);
  v5 = type metadata accessor for Logger(0);
  sub_100008930(v5, (uint64_t)qword_10004F110);
  v6 = (void **)v4;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = (_QWORD *)swift_slowAlloc(8, -1);
    aBlock = v6;
    *(_DWORD *)v9 = 138412290;
    v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v23);
    *v21 = v2;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Status pill controller deinitialized with non-nil attribution: %@, removing...", v9, 0xCu);
    v11 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v21, 1, v11);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

  }
  v14 = v1[4];
  v13 = swift_allocObject(&unk_100045940, 24, 7);
  *(_QWORD *)(v13 + 16) = v6;
  v15 = swift_allocObject(&unk_100045968, 32, 7);
  v12 = sub_10000A49C;
  *(_QWORD *)(v15 + 16) = sub_10000A49C;
  *(_QWORD *)(v15 + 24) = v13;
  v26 = sub_10000A4D8;
  v27 = v15;
  aBlock = _NSConcreteStackBlock;
  v23 = 1107296256;
  v24 = sub_100009C68;
  v25 = &unk_100045980;
  v16 = _Block_copy(&aBlock);
  v17 = v27;
  v18 = v6;
  swift_retain(v15);
  swift_release(v17);
  v26 = sub_10000A108;
  v27 = 0;
  aBlock = _NSConcreteStackBlock;
  v23 = 1107296256;
  v24 = sub_1000134A0;
  v25 = &unk_1000459A8;
  v19 = _Block_copy(&aBlock);
  objc_msgSend(v14, "updateData:completion:", v16, v19);

  _Block_release(v19);
  _Block_release(v16);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation(v15, "", 115, 74, 34, 1);
  result = swift_release(v15);
  if ((v18 & 1) == 0)
    goto LABEL_9;
  __break(1u);
  return result;
}

void sub_10000A108()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (qword_10004ECE0 != -1)
    swift_once(&qword_10004ECE0, sub_1000090EC);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100008930(v0, (uint64_t)qword_10004F110);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Status pill attribution removed", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

}

uint64_t sub_10000A1D4()
{
  uint64_t v0;

  sub_100009DE4();
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for BackgroundActivitySystemPillController()
{
  return objc_opt_self(_TtC18ActivityProgressUI38BackgroundActivitySystemPillController);
}

unint64_t sub_10000A218()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004F280;
  if (!qword_10004F280)
  {
    v1 = type metadata accessor for PillActor();
    result = swift_getWitnessTable(&unk_100035328, v1);
    atomic_store(result, (unint64_t *)&qword_10004F280);
  }
  return result;
}

uint64_t sub_10000A264()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A28C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10004F294);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000A2F8;
  return sub_100009AF0(a1, v4, v5, v6);
}

uint64_t sub_10000A2F8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000A344(void *a1, void *a2)
{
  uint64_t v2;

  return sub_100009BC0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_10000A34C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A35C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A37C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A38C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000A398()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000A3C4()
{
  uint64_t v0;

  sub_100009CBC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000A3D0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000A3FC(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10004F2A4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000A4BC;
  return sub_100009400(a1, v4, v5, v6);
}

uint64_t sub_10000A468(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000A478()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10000A49C(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, "removeAttribution:", *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000A4AC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

ValueMetadata *type metadata accessor for TestAppView()
{
  return &type metadata for TestAppView;
}

uint64_t sub_10000A4EC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003B76C, 1);
}

uint64_t sub_10000A504()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10000A51C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000010, 0x80000001000399F0);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

void *sub_10000A590()
{
  return &protocol witness table for Text;
}

uint64_t sub_10000A59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t (*v12)();
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t inited;
  void *v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[40];
  uint64_t (*v36)();
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  char v48;
  __int128 v49;

  v4 = type metadata accessor for APUISystemApertureLayoutState(0);
  v5 = sub_10000A928();
  v6 = EnvironmentObject.init()(v4, v5);
  v33 = v7;
  v34 = v6;
  v36 = sub_100008E6C;
  v37 = a1;
  LOBYTE(v38) = 0;
  v8 = sub_10000A970();
  swift_retain(a1);
  v9 = AnyView.init<A>(_:)(&v36, &type metadata for BackgroundActivityView, v8);
  KeyPath = swift_getKeyPath(&unk_100035420);
  v11 = swift_getKeyPath(&unk_100035448);
  static Published.subscript.getter(&v36, a1, KeyPath, v11);
  swift_release(KeyPath);
  swift_release(v11);
  v12 = v36;
  if (qword_10004ED68 != -1)
    swift_once(&qword_10004ED68, sub_10002A3B8);
  v13 = qword_100050BC8;
  if (qword_10004ED70 != -1)
    swift_once(&qword_10004ED70, sub_10002A3C8);
  v36 = v12;
  v37 = v13;
  v38 = qword_100050BD0;
  v14 = sub_10000AA04();
  v15 = AnyView.init<A>(_:)(&v36, &type metadata for BackgroundActivityAppIcon, v14);
  sub_10000AA48();
  v16 = qword_10004ED90;
  swift_retain(a1);
  if (v16 != -1)
    swift_once(&qword_10004ED90, sub_10002A5E0);
  v17 = swift_retain(qword_100050BF0);
  v18 = UIColor.init(_:)(v17);
  if (qword_10004ED38 != -1)
    swift_once(&qword_10004ED38, sub_10002A344);
  v19 = qword_100050B60;
  v20 = static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)(&v45, v19, 0, v19, 0, v20, v21);
  v36 = sub_100008E6C;
  v37 = a1;
  LOWORD(v38) = 0;
  v39 = v18;
  v40 = v45;
  v41 = v46;
  v42 = v47;
  v43 = v48;
  v44 = v49;
  v22 = sub_1000088F0(&qword_10004F2C8);
  v23 = sub_10000AA84();
  v24 = AnyView.init<A>(_:)(&v36, v22, v23);
  v25 = swift_getKeyPath(&unk_100035420);
  v26 = swift_getKeyPath(&unk_100035448);
  static Published.subscript.getter(&v36, a1, v25, v26);
  swift_release(v25);
  swift_release(v26);
  v37 = qword_100050BC8;
  v38 = qword_100050BD0;
  v27 = AnyView.init<A>(_:)(&v36, &type metadata for BackgroundActivityAppIcon, v14);
  v28 = sub_1000088F0(&qword_10004F2E0);
  inited = swift_initStackObject(v28, v35);
  *(_OWORD *)(inited + 16) = xmmword_1000349A0;
  *(_QWORD *)(inited + 32) = String._bridgeToObjectiveC()();
  v30 = sub_10000AB34(inited);
  swift_setDeallocating(inited);
  type metadata accessor for STBackgroundActivityIdentifier(0);
  result = swift_arrayDestroy(inited + 32, 1, v31);
  *(_QWORD *)a2 = v34;
  *(_QWORD *)(a2 + 8) = v33;
  *(_QWORD *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)(a2 + 32) = v24;
  *(_QWORD *)(a2 + 40) = v27;
  *(_WORD *)(a2 + 48) = 1;
  *(_QWORD *)(a2 + 56) = 4;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = v30;
  return result;
}

unint64_t sub_10000A928()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004F360;
  if (!qword_10004F360)
  {
    v1 = type metadata accessor for APUISystemApertureLayoutState(255);
    result = swift_getWitnessTable(&unk_1000366D4, v1);
    atomic_store(result, (unint64_t *)&qword_10004F360);
  }
  return result;
}

unint64_t sub_10000A970()
{
  unint64_t result;

  result = qword_10004F2B0;
  if (!qword_10004F2B0)
  {
    result = swift_getWitnessTable(&unk_100036E58, &type metadata for BackgroundActivityView);
    atomic_store(result, (unint64_t *)&qword_10004F2B0);
  }
  return result;
}

double sub_10000A9B4@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  __int128 v3;
  __int128 v4;
  double result;
  __int128 v6;
  _OWORD v7[6];

  sub_10000A59C(*v1, (uint64_t)v7);
  v3 = v7[3];
  a1[2] = v7[2];
  a1[3] = v3;
  v4 = v7[5];
  a1[4] = v7[4];
  a1[5] = v4;
  result = *(double *)v7;
  v6 = v7[1];
  *a1 = v7[0];
  a1[1] = v6;
  return result;
}

unint64_t sub_10000AA04()
{
  unint64_t result;

  result = qword_10004F2B8;
  if (!qword_10004F2B8)
  {
    result = swift_getWitnessTable(&unk_100036E08, &type metadata for BackgroundActivityAppIcon);
    atomic_store(result, (unint64_t *)&qword_10004F2B8);
  }
  return result;
}

unint64_t sub_10000AA48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004F2C0;
  if (!qword_10004F2C0)
  {
    v1 = objc_opt_self(UIColor);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004F2C0);
  }
  return result;
}

unint64_t sub_10000AA84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004F2D0;
  if (!qword_10004F2D0)
  {
    v1 = sub_100008B84(&qword_10004F2C8);
    sub_10000AAF0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10004F2D0);
  }
  return result;
}

unint64_t sub_10000AAF0()
{
  unint64_t result;

  result = qword_10004F2D8;
  if (!qword_10004F2D8)
  {
    result = swift_getWitnessTable(&unk_100036030, &type metadata for BackgroundActivityProgressView);
    atomic_store(result, (unint64_t *)&qword_10004F2D8);
  }
  return result;
}

void *sub_10000AB34(uint64_t a1)
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
    sub_1000088F0(&qword_10004F2E8);
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

ValueMetadata *type metadata accessor for BackgroundActivitySystemApertureElement()
{
  return &type metadata for BackgroundActivitySystemApertureElement;
}

unint64_t sub_10000AD74(uint64_t a1)
{
  unint64_t result;

  result = sub_10000AD98();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000AD98()
{
  unint64_t result;

  result = qword_10004F2F0;
  if (!qword_10004F2F0)
  {
    result = swift_getWitnessTable(&unk_1000354B8, &type metadata for BackgroundActivitySystemApertureElement);
    atomic_store(result, (unint64_t *)&qword_10004F2F0);
  }
  return result;
}

void sub_10000ADDC()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  void *v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "publishedObjectWithName:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v11, v3);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_10000BF10((uint64_t)v11, (uint64_t)v12);
  if (v13)
  {
    v4 = sub_10000BF98(0, &qword_10004F350, CAShapeLayer_ptr);
    if ((swift_dynamicCast(&v10, v12, (char *)&type metadata for Any + 8, v4, 6) & 1) != 0)
    {
      v5 = v10;
      objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress), "fractionCompleted");
      v7 = 0.999 - v6 * 0.999 / 0.999;
      v8 = v6 < 0.01;
      v9 = 0.989;
      if (!v8)
        v9 = v7;
      objc_msgSend(v5, "setStrokeStart:", v9);

    }
  }
  else
  {
    sub_10000BF58((uint64_t)v12);
  }
  sub_10000B9C4();
}

void sub_10000AF3C(id a1)
{
  uint64_t v1;
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  if (a1)
  {
    v3 = objc_msgSend(a1, "identifier");
    v4 = (id *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    if (!v5)
    {
      if (!v3)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = (id *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    v5 = *(void **)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
    if (!v5)
      return;
    v3 = 0;
  }
  v6 = objc_msgSend(v5, "identifier");
  v7 = v6;
  if (!v3)
  {
    if (!v6)
      return;
    goto LABEL_17;
  }
  if (!v6)
  {
LABEL_15:
    v7 = v3;
LABEL_17:

LABEL_18:
    if (*v4)
    {
      v16 = *(void **)(v1
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
      v17 = *v4;
      objc_msgSend(v16, "addAction:forControlEvents:", v17, 0x2000);
      objc_msgSend(v16, "setHidden:", 0);

    }
    if (a1)
    {
      v18 = *(void **)(v1
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
      v19 = a1;
      objc_msgSend(v18, "removeAction:forControlEvents:");
      if (!*v4)
        objc_msgSend(v18, "setHidden:", 1);

    }
    return;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  if (v8 == v11 && v10 == v12)
  {

    swift_bridgeObjectRelease_n(v10, 2);
    return;
  }
  v14 = v12;
  v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, v11, v12, 0);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v14);
  if ((v15 & 1) == 0)
    goto LABEL_18;
}

uint64_t sub_10000B124()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  swift_beginAccess(v0 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded, v3, 0, 0);
  return *v1;
}

id sub_10000B16C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  _BOOL8 v4;
  _BYTE v6[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  v4 = 1;
  swift_beginAccess(v1 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded, v6, 1, 0);
  *v3 = a1;
  sub_10000B9C4();
  if (*v3 == 1)
    v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) == 0;
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton), "setHidden:", v4);
}

void (*sub_10000B204(_QWORD *a1))(_QWORD *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = APUISystemApertureView.expanded.modify((uint64_t)v3);
  return sub_10000B24C;
}

void sub_10000B24C(_QWORD *a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  _BOOL8 v7;

  v3 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0)
  {
    v4 = v3[4];
    sub_10000B9C4();
    v5 = *(void **)(v4 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
    v6 = (_BYTE *)(v4 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
    swift_beginAccess(v6, v3, 0, 0);
    v7 = *v6 != 1
      || *(_QWORD *)(v3[4] + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) == 0;
    objc_msgSend(v5, "setHidden:", v7);
  }
  free(v3);
}

void sub_10000B300(void *a1, uint64_t a2, char a3, void *a4)
{
  char *v4;
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
  void *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjCClassFromMetadata;
  id v21;
  unint64_t v22;
  id v23;
  id v24;
  NSString v25;
  id v26;
  NSString v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString v35;
  void *v36;
  id v37;
  objc_class *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  Class isa;
  id v45;
  uint64_t v46;
  char *v47;
  Class v48;
  void *v49;
  id v50;
  id v51;
  char *v52;
  void *v53;
  void *v54;
  char *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  char v62[24];
  objc_super v63;

  v60 = a2;
  v61 = a4;
  v59 = a1;
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UIButton.Configuration(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress;
  v16 = (void *)objc_opt_self(NSProgress);
  v17 = v4;
  *(_QWORD *)&v4[v15] = objc_msgSend(v16, "progressWithTotalUnitCount:", 1000);
  v18 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction;
  *(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction] = 0;
  v17[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton] = 0;
  v17[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification] = 0;
  v19 = type metadata accessor for BackgroundActivitySession(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v19);
  v21 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  if ((a3 & 1) != 0)
    v22 = 0x8000000100039C70;
  else
    v22 = 0x8000000100039C20;
  v23 = objc_allocWithZone((Class)BSUICAPackageView);
  v24 = v21;
  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  v26 = objc_msgSend(v23, "initWithPackageName:inBundle:", v25, v24);

  if (v26)
  {
    v58 = v24;
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (qword_10004EDB0 != -1)
      swift_once(&qword_10004EDB0, sub_10002D4EC);
    objc_msgSend(v26, "setFrame:", 0.0, 0.0, *(double *)&static APUISystemApertureView.compactDimension, *(double *)&static APUISystemApertureView.compactDimension);
    v27 = String._bridgeToObjectiveC()();
    objc_msgSend(v26, "setState:", v27);

    *(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView] = v26;
    sub_10000BF98(0, &qword_10004F358, UIButton_ptr);
    v28 = v26;
    static UIButton.Configuration.plain()();
    v29 = v61;
    v30 = v61;
    v31 = (id)UIButton.init(configuration:primaryAction:)(v14, v29);
    v32 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000021, 0x8000000100039C40);
    static Locale.current.getter(v32);
    String.init(localized:table:bundle:locale:comment:)(v11, 0, 0, 0, v8, 0, 0, 256);
    v34 = v33;
    v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
    objc_msgSend(v31, "setAccessibilityLabel:", v35);

    objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    *(_QWORD *)&v17[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton] = v31;
    v36 = *(void **)&v17[v18];
    *(_QWORD *)&v17[v18] = v29;
    v56 = v30;
    v37 = v31;

    v38 = (objc_class *)type metadata accessor for BackgroundActivityProgressMicaView();
    v63.receiver = v17;
    v63.super_class = v38;
    v39 = objc_msgSendSuper2(&v63, "init");
    objc_msgSend(v39, "addSubview:", v28);
    objc_msgSend(v39, "addSubview:", v37);
    v40 = v39;
    v57 = v28;
    v41 = v60;
    v42 = APUISystemApertureView.createConstraints(forSubview:offset:alignedToEdge:)(v28, v60, 0.0);

    sub_10000BF98(0, (unint64_t *)&qword_10004EFF0, NSLayoutConstraint_ptr);
    v43 = v40;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
    objc_msgSend(v43, "addConstraints:", isa);

    v45 = v43;
    v46 = APUISystemApertureView.createConstraints(forSubview:offset:alignedToEdge:)(v37, v41, 0.0);

    v47 = (char *)v45;
    v48 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v46);
    objc_msgSend(v47, "addConstraints:", v48);

    v49 = *(void **)&v47[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton];
    if (v29)
    {
      v50 = v56;
      v51 = v56;
      objc_msgSend(v49, "addAction:forControlEvents:", v51, 0x2000);
      v52 = &v47[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded];
      swift_beginAccess(&v47[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded], v62, 0, 0);
      objc_msgSend(v49, "setHidden:", (*v52 & 1) == 0);

      v53 = v59;
    }
    else
    {
      objc_msgSend(*(id *)&v47[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton], "setHidden:", 1);
      v53 = v59;
      v50 = v56;
    }
    v54 = *(void **)&v47[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton];
    objc_msgSend(v54, "addTarget:action:forControlEvents:", v47, "touchedDownCancelButton", 17);
    v55 = v47;
    objc_msgSend(v54, "addTarget:action:forControlEvents:", v55, "touchedUpCancelButton", 480);

  }
  else
  {
    __break(1u);
  }
}

void sub_10000B9C4()
{
  _BYTE *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  void *v25;
  NSString v26;
  _BYTE v28[24];

  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v2 = &v28[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v4 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = &v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded];
  swift_beginAccess(&v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded], v28, 0, 0);
  LODWORD(v5) = *v5;
  v6 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress;
  v7 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress], "isIndeterminate");
  if ((_DWORD)v5 == 1)
  {
    v8 = 0xEB00000000676E69;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)&v0[v6], "fractionCompleted");
      if (v9 >= 0.00001)
      {
        objc_msgSend(*(id *)&v0[v6], "fractionCompleted");
        if (v10 >= 1.0)
        {
          v20 = *(void **)&v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton];
          v21 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000023, 0x8000000100039B40);
          static Locale.current.getter(v21);
          String.init(localized:table:bundle:locale:comment:)(v4, 0, 0, 0, v2, 0, 0, 256);
          v23 = v22;
          v24 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v23);
          objc_msgSend(v20, "setAccessibilityLabel:", v24);

          v8 = 0xE900000000000065;
        }
        else if (v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton])
        {
          v8 = 0xEA00000000007373;
        }
        else
        {
          v8 = 0xE400000000000000;
        }
      }
    }
  }
  else
  {
    v8 = 0xEE00676E69766173;
    v11 = 0x2D746361706D6F63;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)&v0[v6], "fractionCompleted");
      if (v12 >= 0.00001)
      {
        objc_msgSend(*(id *)&v0[v6], "fractionCompleted");
        if (v13 >= 1.0)
        {
          v8 = 0xEC000000656E6F64;
        }
        else
        {
          v11 = 0x746361706D6F63;
          v8 = 0xE700000000000000;
        }
      }
    }
    swift_bridgeObjectRetain(v8);
    v14 = String.LocalizationValue.init(_:)(v11, v8);
    static Locale.current.getter(v14);
    String.init(localized:table:bundle:locale:comment:)(v4, 0, 0, 0, v2, 0, 0, 256);
    v16 = v15;
    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
    objc_msgSend(v0, "setAccessibilityLabel:", v17);

    v18 = objc_msgSend(v0, "systemApertureElementContext");
    objc_msgSend(v18, "setElementNeedsUpdate");
    swift_unknownObjectRelease(v18);
    v19 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification;
    if ((v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification] & 1) == 0)
    {
      UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v0);
      v0[v19] = 1;
    }
  }
  v25 = *(void **)&v0[OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView];
  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v25, "setState:", v26);

}

void sub_10000BE1C()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton));
}

id sub_10000BE68()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackgroundActivityProgressMicaView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BackgroundActivityProgressMicaView()
{
  return objc_opt_self(_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView);
}

uint64_t sub_10000BF10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000088F0(&qword_10004FE20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BF58(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000088F0(&qword_10004FE20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000BF98(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

char *APUISystemApertureElementHostingController.__allocating_init(elementProvider:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return APUISystemApertureElementHostingController.init(elementProvider:)(a1);
}

uint64_t APUISystemApertureElement.init<A, B, C>(expanded:compactLeading:compactTrailing:)@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X2>, void (*a4)(void)@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(void);
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(void);
  void (*v38)(void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(void);

  v41 = a5;
  v42 = a4;
  v37 = a1;
  v38 = a3;
  v36 = a2;
  v39 = a9;
  v40 = a12;
  v15 = __chkstk_darwin(a1);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for APUISystemApertureLayoutState(0);
  v24 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  v25 = EnvironmentObject.init()(v23, v24);
  v34 = v26;
  v35 = v25;
  v37();
  v27 = AnyView.init<A>(_:)(v22, a6, a10);
  v28 = v38;
  v38();
  v29 = AnyView.init<A>(_:)(v20, a7, a11);
  v42();
  v30 = AnyView.init<A>(_:)(v17, v39, v40);
  v28();
  result = AnyView.init<A>(_:)(v20, a7, a11);
  v32 = v34;
  *(_QWORD *)a8 = v35;
  *(_QWORD *)(a8 + 8) = v32;
  *(_QWORD *)(a8 + 16) = v27;
  *(_QWORD *)(a8 + 24) = v29;
  *(_QWORD *)(a8 + 32) = v30;
  *(_QWORD *)(a8 + 40) = result;
  *(_WORD *)(a8 + 48) = 0;
  *(_QWORD *)(a8 + 56) = 4;
  *(_QWORD *)(a8 + 64) = 0;
  *(_QWORD *)(a8 + 72) = 0;
  *(_QWORD *)(a8 + 80) = 0;
  *(_QWORD *)(a8 + 88) = &_swiftEmptySetSingleton;
  return result;
}

__n128 APUISystemApertureElement.showsOnCoverSheet(_:)@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 v12;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + 88);
  v11 = *(_OWORD *)(v2 + 56);
  v12 = *(__n128 *)(v2 + 72);
  v5 = *(_BYTE *)(v2 + 49);
  v6 = *(_QWORD *)v2;
  v7 = *(_QWORD *)(v2 + 8);
  v9 = *(_OWORD *)(v2 + 32);
  v10 = *(_OWORD *)(v2 + 16);
  sub_1000089A8((uint64_t *)v2);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 48) = 1;
  *(_BYTE *)(a1 + 49) = v5;
  *(_OWORD *)(a1 + 56) = v11;
  result = v12;
  *(__n128 *)(a1 + 72) = v12;
  *(_QWORD *)(a1 + 88) = v4;
  return result;
}

__n128 APUISystemApertureElement.suppressingBackgroundActivities(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  __n128 result;
  __int128 v13;
  __int128 v14;
  __n128 v15;
  uint64_t v16;

  v5 = *(_QWORD *)v2;
  v6 = *(_QWORD *)(v2 + 8);
  v7 = *(_BYTE *)(v2 + 48);
  v8 = *(_BYTE *)(v2 + 49);
  v9 = *(__n128 *)(v2 + 56);
  v10 = *(_QWORD *)(v2 + 72);
  v11 = *(_QWORD *)(v2 + 80);
  v16 = *(_QWORD *)(v2 + 88);
  v14 = *(_OWORD *)(v2 + 16);
  v15 = v9;
  v13 = *(_OWORD *)(v2 + 32);
  sub_1000089A8((uint64_t *)v2);
  swift_bridgeObjectRetain(a1);
  sub_10000E6CC(&v16);
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v13;
  *(_BYTE *)(a2 + 48) = v7;
  *(_BYTE *)(a2 + 49) = v8;
  result = v15;
  *(__n128 *)(a2 + 56) = v15;
  *(_QWORD *)(a2 + 72) = v10;
  *(_QWORD *)(a2 + 80) = v11;
  *(_QWORD *)(a2 + 88) = a1;
  return result;
}

void *APUIHostedBySystemAperture.defaultValue.unsafeMutableAddressor()
{
  return &static APUIHostedBySystemAperture.defaultValue;
}

void sub_10000C324(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10000C32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, &protocol witness table for Bool);
}

uint64_t EnvironmentValues.isHostedBySystemAperture.getter()
{
  unint64_t v0;
  uint64_t var1;

  v0 = sub_10000E6F4();
  EnvironmentValues.subscript.getter(&var1, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v0);
  return var1;
}

uint64_t EnvironmentValues.isHostedBySystemAperture.setter(char a1)
{
  unint64_t v1;
  char v3;

  v3 = a1;
  v1 = sub_10000E6F4();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v1);
}

uint64_t (*EnvironmentValues.isHostedBySystemAperture.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unint64_t v4;

  v3 = (_QWORD *)(a1 + 17);
  *(_QWORD *)a1 = v1;
  v4 = sub_10000E6F4();
  *(_QWORD *)(a1 + 8) = v4;
  EnvironmentValues.subscript.getter(v3, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v4);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_10000C408;
}

uint64_t sub_10000C408(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return EnvironmentValues.subscript.setter(a1 + 17, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v1);
}

uint64_t APUISystemApertureElement.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X3>, void (*a5)(void)@<X4>, uint64_t a6@<X5>, void (*a7)(void)@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(void);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(void);
  uint64_t v46;
  uint64_t v47;
  void (*v48)(void);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(void);

  v51 = a8;
  v52 = a7;
  v47 = a6;
  v48 = a5;
  v44 = a4;
  v45 = a3;
  v40 = a2;
  v41 = a1;
  v46 = a16;
  v39 = a14;
  v42 = a12;
  v43 = a15;
  v49 = a13;
  v50 = a17;
  v18 = __chkstk_darwin(a1);
  v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v21);
  v26 = (char *)&v38 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v28 = (char *)&v38 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for APUISystemApertureLayoutState(0);
  v30 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  v31 = EnvironmentObject.init()(v29, v30);
  v33 = v32;
  v41();
  v34 = AnyView.init<A>(_:)(v28, a10, v39);
  v45();
  v35 = AnyView.init<A>(_:)(v26, a11, v43);
  v48();
  v36 = AnyView.init<A>(_:)(v23, v42, v46);
  v52();
  result = AnyView.init<A>(_:)(v20, v49, v50);
  *(_QWORD *)a9 = v31;
  *(_QWORD *)(a9 + 8) = v33;
  *(_QWORD *)(a9 + 16) = v34;
  *(_QWORD *)(a9 + 24) = v35;
  *(_QWORD *)(a9 + 32) = v36;
  *(_QWORD *)(a9 + 40) = result;
  *(_WORD *)(a9 + 48) = 0;
  *(_QWORD *)(a9 + 56) = 4;
  *(_QWORD *)(a9 + 64) = 0;
  *(_QWORD *)(a9 + 72) = 0;
  *(_QWORD *)(a9 + 80) = 0;
  *(_QWORD *)(a9 + 88) = &_swiftEmptySetSingleton;
  return result;
}

double APUISystemApertureElement.init<A, B>(expanded:compactLeading:)@<D0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _OWORD *a8@<X8>)
{
  __int128 v9;
  __int128 v10;
  double result;
  __int128 v12;
  _OWORD v13[6];

  APUISystemApertureElement.init<A, B, C>(expanded:compactLeading:compactTrailing:)(a1, a2, a3, (void (*)(void))nullsub_1, 0, a4, a5, (uint64_t)v13, (uint64_t)&type metadata for EmptyView, a6, a7, (uint64_t)&protocol witness table for EmptyView);
  v9 = v13[3];
  a8[2] = v13[2];
  a8[3] = v9;
  v10 = v13[5];
  a8[4] = v13[4];
  a8[5] = v10;
  result = *(double *)v13;
  v12 = v13[1];
  *a8 = v13[0];
  a8[1] = v12;
  return result;
}

double APUISystemApertureElement.init<A>(expanded:)@<D0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  __int128 v6;
  __int128 v7;
  double result;
  __int128 v9;
  _OWORD v10[6];

  APUISystemApertureElement.init<A, B, C>(expanded:compactLeading:compactTrailing:)(a1, a2, (void (*)(void))nullsub_1, (void (*)(void))nullsub_1, 0, a3, (uint64_t)&type metadata for EmptyView, (uint64_t)v10, (uint64_t)&type metadata for EmptyView, a4, (uint64_t)&protocol witness table for EmptyView, (uint64_t)&protocol witness table for EmptyView);
  v6 = v10[3];
  a5[2] = v10[2];
  a5[3] = v6;
  v7 = v10[5];
  a5[4] = v10[4];
  a5[5] = v7;
  result = *(double *)v10;
  v9 = v10[1];
  *a5 = v10[0];
  a5[1] = v9;
  return result;
}

uint64_t APUISystemApertureElement.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v2 = v1[2];
  v3 = *v1;
  if (*v1)
  {
    KeyPath = swift_getKeyPath(&unk_1000355A8);
    v6 = swift_getKeyPath(&unk_1000355D0);
    swift_retain(v2);
    v7 = swift_retain(v3);
    static Published.subscript.getter(&v17, v7, KeyPath, v6);
    swift_release(v3);
    swift_release(KeyPath);
    v8 = swift_release(v6);
    v16 = v18;
    v9 = v19;
    v10 = v20;
    LOBYTE(KeyPath) = static Edge.Set.all.getter(v8);
    v11 = static Color.black.getter();
    result = static Edge.Set.all.getter(v11);
    *(_QWORD *)a1 = v2;
    *(_BYTE *)(a1 + 8) = KeyPath;
    *(_OWORD *)(a1 + 16) = v16;
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v10;
    *(_BYTE *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = v11;
    *(_BYTE *)(a1 + 64) = result;
  }
  else
  {
    v13 = v1[1];
    v14 = type metadata accessor for APUISystemApertureLayoutState(0);
    v15 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
    swift_retain(v2);
    result = EnvironmentObject.error()(0, v13, v14, v15);
    __break(1u);
  }
  return result;
}

__n128 APUISystemApertureElement.undimsScreenIfNecessary(_:)@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 v12;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + 88);
  v11 = *(_OWORD *)(v2 + 56);
  v12 = *(__n128 *)(v2 + 72);
  v5 = *(_BYTE *)(v2 + 48);
  v6 = *(_QWORD *)v2;
  v7 = *(_QWORD *)(v2 + 8);
  v9 = *(_OWORD *)(v2 + 32);
  v10 = *(_OWORD *)(v2 + 16);
  sub_1000089A8((uint64_t *)v2);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 49) = 1;
  *(_OWORD *)(a1 + 56) = v11;
  result = v12;
  *(__n128 *)(a1 + 72) = v12;
  *(_QWORD *)(a1 + 88) = v4;
  return result;
}

__n128 APUISystemApertureElement.preferredLayoutMode(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  __n128 result;
  __int128 v12;
  __int128 v13;
  __n128 v14;

  v6 = *(_QWORD *)(v2 + 80);
  v5 = *(_QWORD *)(v2 + 88);
  v7 = *(_BYTE *)(v2 + 49);
  v8 = *(_BYTE *)(v2 + 48);
  v9 = *(_QWORD *)v2;
  v10 = *(_QWORD *)(v2 + 8);
  v13 = *(_OWORD *)(v2 + 16);
  v14 = *(__n128 *)(v2 + 64);
  v12 = *(_OWORD *)(v2 + 32);
  sub_1000089A8((uint64_t *)v2);
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  *(_OWORD *)(a2 + 16) = v13;
  *(_OWORD *)(a2 + 32) = v12;
  *(_BYTE *)(a2 + 48) = v8;
  *(_BYTE *)(a2 + 49) = v7;
  *(_QWORD *)(a2 + 56) = a1;
  result = v14;
  *(__n128 *)(a2 + 64) = v14;
  *(_QWORD *)(a2 + 80) = v6;
  *(_QWORD *)(a2 + 88) = v5;
  return result;
}

__n128 APUISystemApertureElement.elementIdentifier(_:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __n128 result;
  __int128 v13;
  __int128 v14;
  __n128 v15;
  id v16;

  v5 = *(_QWORD *)v2;
  v6 = *(_QWORD *)(v2 + 8);
  v7 = *(_BYTE *)(v2 + 48);
  v8 = *(_BYTE *)(v2 + 49);
  v9 = *(_QWORD *)(v2 + 56);
  v10 = *(_QWORD *)(v2 + 88);
  v14 = *(_OWORD *)(v2 + 16);
  v15 = *(__n128 *)(v2 + 72);
  v13 = *(_OWORD *)(v2 + 32);
  sub_10000F82C(v2 + 64, (uint64_t)&v16, &qword_10004F370);
  sub_1000089A8((uint64_t *)v2);
  v11 = a1;
  sub_10000F804(&v16);
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v13;
  *(_BYTE *)(a2 + 48) = v7;
  *(_BYTE *)(a2 + 49) = v8;
  *(_QWORD *)(a2 + 56) = v9;
  *(_QWORD *)(a2 + 64) = a1;
  result = v15;
  *(__n128 *)(a2 + 72) = v15;
  *(_QWORD *)(a2 + 88) = v10;
  return result;
}

__n128 APUISystemApertureElement.associatedAppBundleIdentifier(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 result;
  __n128 v14;
  __int128 v15;
  _BYTE v17[16];

  v6 = *(_QWORD *)v3;
  v7 = *(_QWORD *)(v3 + 8);
  v8 = *(_BYTE *)(v3 + 48);
  v9 = *(_BYTE *)(v3 + 49);
  v10 = *(_QWORD *)(v3 + 56);
  v11 = *(_QWORD *)(v3 + 64);
  v12 = *(_QWORD *)(v3 + 88);
  v14 = *(__n128 *)(v3 + 32);
  v15 = *(_OWORD *)(v3 + 16);
  sub_10000F82C(v3 + 72, (uint64_t)v17, &qword_10004F378);
  sub_1000089A8((uint64_t *)v3);
  swift_bridgeObjectRetain(a2);
  sub_10000F870((uint64_t)v17);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v7;
  result = v14;
  *(_OWORD *)(a3 + 16) = v15;
  *(__n128 *)(a3 + 32) = v14;
  *(_BYTE *)(a3 + 48) = v8;
  *(_BYTE *)(a3 + 49) = v9;
  *(_QWORD *)(a3 + 56) = v10;
  *(_QWORD *)(a3 + 64) = v11;
  *(_QWORD *)(a3 + 72) = a1;
  *(_QWORD *)(a3 + 80) = a2;
  *(_QWORD *)(a3 + 88) = v12;
  return result;
}

uint64_t sub_10000CB10()
{
  return APUISystemApertureElementHostingController.activeLayoutMode.getter();
}

uint64_t APUISystemApertureElementHostingController.activeLayoutMode.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000CB74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.activeLayoutMode.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.activeLayoutMode.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode);
  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode, v5, 1, 0);
  *v3 = a1;
  return sub_10000CBEC();
}

uint64_t sub_10000CBEC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE v6[24];

  v1 = (uint64_t *)(v0 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode);
  result = swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode, &v5, 0, 0);
  v3 = *v1;
  if ((unint64_t)(*v1 - 3) <= 1)
  {
    v4 = (_QWORD *)(v0 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode);
    result = swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode, v6, 1, 0);
    *v4 = v3;
  }
  return result;
}

uint64_t (*APUISystemApertureElementHostingController.activeLayoutMode.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode, a1, 33, 0);
  return sub_10000CCB0;
}

uint64_t sub_10000CCB0(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess(a1);
  if ((a2 & 1) == 0)
    return sub_10000CBEC();
  return result;
}

uint64_t sub_10000CCE0()
{
  return APUISystemApertureElementHostingController.contentRole.getter();
}

uint64_t APUISystemApertureElementHostingController.contentRole.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.contentRole;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.contentRole, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000CD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.contentRole.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.contentRole.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + direct field offset for APUISystemApertureElementHostingController.contentRole);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *APUISystemApertureElementHostingController.contentRole.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.contentRole, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_10000CDF8()
{
  return APUISystemApertureElementHostingController.preferredLayoutMode.getter();
}

uint64_t APUISystemApertureElementHostingController.preferredLayoutMode.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000CE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.preferredLayoutMode.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.preferredLayoutMode.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *APUISystemApertureElementHostingController.preferredLayoutMode.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000CF0C()
{
  return APUISystemApertureElementHostingController.maximumLayoutMode.getter();
}

uint64_t APUISystemApertureElementHostingController.maximumLayoutMode.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000CF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return APUISystemApertureElementHostingController.maximumLayoutMode.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.maximumLayoutMode.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *APUISystemApertureElementHostingController.maximumLayoutMode.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000D020()
{
  uint64_t v0;
  uint64_t v1;
  NSString v2;

  sub_10000FBC4();
  if (v0)
  {
    v1 = v0;
    swift_bridgeObjectRetain(v0);
    v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t APUISystemApertureElementHostingController.associatedAppBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_10000FBC4();
  swift_bridgeObjectRetain(v1);
  return v0;
}

void sub_10000D0AC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = a1;
  APUISystemApertureElementHostingController.associatedAppBundleIdentifier.setter(v4, v6);

}

uint64_t APUISystemApertureElementHostingController.associatedAppBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

void *APUISystemApertureElementHostingController.associatedAppBundleIdentifier.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000D1B8()
{
  return (id)sub_10000FC08();
}

void *APUISystemApertureElementHostingController.elementIdentifier.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_10000FC08();
  v1 = v0;
  return v0;
}

void sub_10000D200(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  APUISystemApertureElementHostingController.elementIdentifier.setter(a3);

}

void APUISystemApertureElementHostingController.elementIdentifier.setter(void *a1)
{
  sub_10000D7B8(a1, &direct field offset for APUISystemApertureElementHostingController.elementIdentifier);
}

void *APUISystemApertureElementHostingController.elementIdentifier.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.elementIdentifier, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000D298()
{
  return APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.getter() & 1;
}

uint64_t APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0
                         + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding);
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding, v3, 0, 0);
  return *v1;
}

uint64_t sub_10000D300(uint64_t a1, uint64_t a2, char a3)
{
  return APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.setter(a3);
}

uint64_t APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1
               + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding, a1, 33, 0);
  return &j_j__swift_endAccess;
}

Class sub_10000D3B0()
{
  uint64_t v0;
  Class isa;

  v0 = sub_10000FC4C();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_1000067D0(&qword_10004EEF0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034D30);
  swift_bridgeObjectRetain(v0);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v0);
  return isa;
}

uint64_t APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.getter()
{
  uint64_t v0;

  v0 = sub_10000FC4C();
  return swift_bridgeObjectRetain(v0);
}

void sub_10000D440(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  type metadata accessor for STBackgroundActivityIdentifier(0);
  v6 = v5;
  v7 = sub_1000067D0(&qword_10004EEF0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_100034D30);
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v6, v7);
  v9 = a1;
  APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.setter(v8);

}

uint64_t APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_bridgeObjectRelease(v4);
}

void *APUISystemApertureElementHostingController.backgroundActivitiesToSuppress.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000D55C()
{
  return (id)sub_10000FC90();
}

void *APUISystemApertureElementHostingController.leadingView.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_10000FC90();
  v1 = v0;
  return v0;
}

void sub_10000D5A4(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  APUISystemApertureElementHostingController.leadingView.setter(a3);

}

void APUISystemApertureElementHostingController.leadingView.setter(void *a1)
{
  sub_10000D7B8(a1, &direct field offset for APUISystemApertureElementHostingController.leadingView);
}

void *APUISystemApertureElementHostingController.leadingView.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.leadingView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000D63C()
{
  return (id)sub_10000FCD4();
}

void *APUISystemApertureElementHostingController.trailingView.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_10000FCD4();
  v1 = v0;
  return v0;
}

void sub_10000D684(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  APUISystemApertureElementHostingController.trailingView.setter(a3);

}

void APUISystemApertureElementHostingController.trailingView.setter(void *a1)
{
  sub_10000D7B8(a1, &direct field offset for APUISystemApertureElementHostingController.trailingView);
}

void *APUISystemApertureElementHostingController.trailingView.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.trailingView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000D71C()
{
  return (id)sub_10000FD18();
}

void *APUISystemApertureElementHostingController.minimalView.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_10000FD18();
  v1 = v0;
  return v0;
}

void sub_10000D764(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  APUISystemApertureElementHostingController.minimalView.setter(a3);

}

void APUISystemApertureElementHostingController.minimalView.setter(void *a1)
{
  sub_10000D7B8(a1, &direct field offset for APUISystemApertureElementHostingController.minimalView);
}

void sub_10000D7B8(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;
  _BYTE v6[24];

  v4 = (void **)(v2 + *a2);
  swift_beginAccess(v4, v6, 1, 0);
  v5 = *v4;
  *v4 = a1;

}

void *APUISystemApertureElementHostingController.minimalView.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.minimalView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000D848()
{
  return (id)sub_10000FD5C();
}

id APUISystemApertureElementHostingController.systemApertureElementViewController.getter()
{
  return (id)sub_10000FD5C();
}

uint64_t sub_10000D888()
{
  return APUISystemApertureElementHostingController.presentationBehaviors.getter();
}

uint64_t APUISystemApertureElementHostingController.presentationBehaviors.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors, v3, 0, 0);
  return *(_QWORD *)v1;
}

void sub_10000D8EC(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = a1;
  APUISystemApertureElementHostingController.presentationBehaviors.setter(a3);

}

uint64_t APUISystemApertureElementHostingController.presentationBehaviors.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors);
  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return sub_10000D984(v4);
}

uint64_t sub_10000D984(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t result;
  id v5;
  char v6[24];

  v3 = &v1[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
  result = swift_beginAccess(&v1[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors], v6, 0, 0);
  if (*(_QWORD *)v3 != a1)
  {
    v5 = objc_msgSend(v1, "systemApertureElementContext");
    objc_msgSend(v5, "setElementNeedsUpdate");
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

void (*APUISystemApertureElementHostingController.presentationBehaviors.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  v4 = (_QWORD *)(v1 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors);
  swift_beginAccess(v1 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors, v3 + 6, 0, 0);
  v3[9] = *v4;
  return sub_10000DA78;
}

void sub_10000DA78(uint64_t *a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)*a1;
  v3 = *(_QWORD *)(*a1 + 72);
  v4 = (uint64_t *)(*(_QWORD *)(*a1 + 80)
                 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors);
  if ((a2 & 1) != 0)
    v5 = *a1;
  else
    v5 = *a1 + 24;
  swift_beginAccess(*(_QWORD *)(*a1 + 80) + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors, v5, 1, 0);
  v6 = *v4;
  *v4 = v3;
  sub_10000D984(v6);
  free(v2);
}

char *APUISystemApertureElementHostingController.init(elementProvider:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  objc_class *v37;
  id v38;
  objc_class *v39;
  char *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  char *result;
  char *v46;
  char *v47;
  id v48;
  id v49;
  char *v50;
  id v51;
  void *v52;
  char *v53;
  void *v54;
  void **v55;
  void *v56;
  id v57;
  char *v58;
  char *v59;
  id v60;
  id v61;
  char *v62;
  id v63;
  void *v64;
  char *v65;
  void *v66;
  void **v67;
  void *v68;
  id v69;
  char *v70;
  char *v71;
  id v72;
  id v73;
  char *v74;
  id v75;
  void *v76;
  char *v77;
  void *v78;
  void **v79;
  void *v80;
  id v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  void **v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  id v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t *v101;
  uint64_t *v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t KeyPath;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  char v122[24];
  char v123[24];
  char v124[24];
  char v125[24];
  char v126[24];
  char v127[24];
  char v128[24];
  objc_super v129;
  char v130[24];
  objc_super v131;
  objc_super v132;
  objc_super v133;
  _OWORD v134[9];
  objc_super v135;
  int v136;
  __int16 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;

  v3 = swift_isaMask & *v1;
  *(_QWORD *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.activeLayoutMode) = 0;
  *(_QWORD *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.contentRole) = 2;
  *(_QWORD *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode) = 4;
  *(_QWORD *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode) = 4;
  v4 = (_QWORD *)((char *)v1
                + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier);
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)((char *)v1 + direct field offset for APUISystemApertureElementHostingController.elementIdentifier) = 0;
  *((_BYTE *)v1
  + direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding) = 1;
  *(_QWORD *)((char *)v1
            + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress) = &_swiftEmptySetSingleton;
  v5 = qword_10004F3E0;
  v6 = objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator());
  v7 = v1;
  *(_QWORD *)((char *)v1 + v5) = objc_msgSend(v6, "init");
  *(_QWORD *)((char *)v7 + qword_10004F3E8) = 0;
  v8 = qword_10004F3F0;
  v113 = type metadata accessor for APUISystemApertureLayoutState(0);
  v9 = swift_allocObject(v113, *(unsigned int *)(v113 + 48), *(unsigned __int16 *)(v113 + 52));
  v138 = 0uLL;
  __asm { FMOV            V0.2D, #20.0 }
  v139 = _Q0;
  v140 = _Q0;
  Published.init(initialValue:)(&v138, &type metadata for APUISystemApertureLayoutState.Metrics);
  v138 = 0uLL;
  LOBYTE(v139) = 0;
  Published.init(initialValue:)(&v138, &type metadata for APUISystemApertureLayoutState.Context);
  *(_QWORD *)((char *)v7 + v8) = v9;
  *(_QWORD *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.leadingView) = 0;
  *(_QWORD *)((char *)v7 + qword_10004F3F8) = 0;
  *(_QWORD *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.trailingView) = 0;
  *(_QWORD *)((char *)v7 + qword_10004F400) = 0;
  *(_QWORD *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.minimalView) = 0;
  *(_QWORD *)((char *)v7 + qword_10004F408) = 0;
  *(_QWORD *)((char *)v7 + direct field offset for APUISystemApertureElementHostingController.presentationBehaviors) = 1;

  v16 = *(_QWORD *)(v3 + 80);
  v15 = *(_QWORD *)(v3 + 88);
  v18 = (objc_class *)type metadata accessor for APUISystemApertureElementHostingController(0, v16, v15, v17);
  v135.receiver = v7;
  v135.super_class = v18;
  v19 = objc_msgSendSuper2(&v135, "initWithNibName:bundle:", 0, 0);
  v20 = *(_QWORD *)(v15 + 8);
  v21 = (char *)v19;
  v106 = v16;
  v107 = a1;
  dispatch thunk of View.body.getter(&v138, v16, v20);
  v22 = v138;
  v23 = *((_QWORD *)&v139 + 1);
  v117 = v139;
  v118 = v138;
  v24 = v140;
  v25 = v141;
  v26 = BYTE1(v141);
  v27 = *((_QWORD *)&v142 + 1);
  v119 = (void *)v142;
  v120 = *((_QWORD *)&v139 + 1);
  v121 = v143;
  v115 = *((_QWORD *)&v141 + 1);
  v116 = *((_QWORD *)&v143 + 1);
  v28 = *(_QWORD *)&v21[qword_10004F3F0];
  v29 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  swift_retain(v28);
  v114 = static ObservableObject.environmentStore.getter(v113, v29);
  KeyPath = swift_getKeyPath(&unk_1000355F0);
  v30 = swift_getKeyPath(&unk_100035620);
  v31 = *(void **)&v21[qword_10004F3E0];
  v138 = v22;
  *(_QWORD *)&v139 = v117;
  *((_QWORD *)&v139 + 1) = v23;
  v140 = v24;
  v108 = v26;
  LOBYTE(v141) = v25;
  BYTE1(v141) = v26;
  *(_DWORD *)((char *)&v141 + 2) = v136;
  WORD3(v141) = v137;
  *((_QWORD *)&v141 + 1) = v115;
  *(_QWORD *)&v142 = v119;
  v109 = v27;
  *((_QWORD *)&v142 + 1) = v27;
  *(_QWORD *)&v143 = v121;
  *((_QWORD *)&v143 + 1) = v116;
  *(_QWORD *)&v144 = v114;
  *((_QWORD *)&v144 + 1) = v28;
  *(_QWORD *)&v145 = KeyPath;
  BYTE8(v145) = 1;
  *(_QWORD *)&v146 = v30;
  *((_QWORD *)&v146 + 1) = v31;
  v134[6] = v144;
  v134[7] = v145;
  v134[8] = v146;
  v134[4] = v142;
  v134[5] = v143;
  v134[2] = v24;
  v134[3] = v141;
  v134[0] = v22;
  v134[1] = v139;
  swift_bridgeObjectRetain(v121);
  v32 = v21;
  swift_bridgeObjectRetain(v116);
  v33 = v31;
  swift_retain(v118);
  swift_retain(v117);
  swift_retain(v120);
  swift_retain(v24);
  swift_retain(*((_QWORD *)&v24 + 1));
  v112 = v119;
  sub_100008A30((uint64_t *)&v138);
  v34 = sub_1000088F0(&qword_10004EF50);
  v35 = sub_100008B00();
  v36 = AnyView.init<A>(_:)(v134, v34, v35);
  v37 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryViewController();
  v38 = objc_allocWithZone(v37);
  v39 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryView();
  objc_allocWithZone(v39);
  v40 = (char *)v38;
  v41 = swift_retain(v36);
  *(_QWORD *)&v40[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v41);

  v133.receiver = v40;
  v133.super_class = v37;
  v42 = objc_msgSendSuper2(&v133, "initWithNibName:bundle:", 0, 0);
  swift_release(v36);
  v43 = *(void **)&v32[qword_10004F3E8];
  *(_QWORD *)&v32[qword_10004F3E8] = v42;
  v44 = v42;

  objc_msgSend(v32, "addChildViewController:", v44);
  result = (char *)objc_msgSend(v32, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_40;
  }
  v46 = result;
  result = (char *)objc_msgSend(v44, "view");
  if (!result)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v47 = result;
  objc_msgSend(v46, "addSubview:", result);

  objc_msgSend(v44, "didMoveToParentViewController:", v32);
  v48 = objc_allocWithZone(v37);
  v49 = objc_allocWithZone(v39);
  swift_retain_n(v120, 2);
  v50 = (char *)v48;
  *(_QWORD *)&v50[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v120);

  v132.receiver = v50;
  v132.super_class = v37;
  v51 = objc_msgSendSuper2(&v132, "initWithNibName:bundle:", 0, 0);
  swift_release(v120);
  v52 = *(void **)&v32[qword_10004F3F8];
  *(_QWORD *)&v32[qword_10004F3F8] = v51;
  v53 = (char *)v51;

  v54 = *(void **)&v53[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v55 = (void **)&v32[direct field offset for APUISystemApertureElementHostingController.leadingView];
  swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.leadingView], v134, 1, 0);
  v56 = *v55;
  *v55 = v54;
  v57 = v54;

  objc_msgSend(v32, "addChildViewController:", v53);
  result = (char *)objc_msgSend(v32, "view");
  if (!result)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v58 = result;
  v111 = v44;
  result = (char *)objc_msgSend(v53, "view");
  if (!result)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v59 = result;
  objc_msgSend(v58, "addSubview:", result);

  objc_msgSend(v53, "didMoveToParentViewController:", v32);
  v60 = objc_allocWithZone(v37);
  v61 = objc_allocWithZone(v39);
  swift_retain_n(v24, 2);
  v62 = (char *)v60;
  *(_QWORD *)&v62[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(v24);

  v131.receiver = v62;
  v131.super_class = v37;
  v63 = objc_msgSendSuper2(&v131, "initWithNibName:bundle:", 0, 0);
  swift_release(v24);
  v64 = *(void **)&v32[qword_10004F400];
  *(_QWORD *)&v32[qword_10004F400] = v63;
  v65 = (char *)v63;

  v66 = *(void **)&v65[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v67 = (void **)&v32[direct field offset for APUISystemApertureElementHostingController.trailingView];
  swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.trailingView], v130, 1, 0);
  v68 = *v67;
  *v67 = v66;
  v69 = v66;

  objc_msgSend(v32, "addChildViewController:", v65);
  result = (char *)objc_msgSend(v32, "view");
  if (!result)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v70 = result;
  result = (char *)objc_msgSend(v65, "view");
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v71 = result;
  objc_msgSend(v70, "addSubview:", result);

  objc_msgSend(v65, "didMoveToParentViewController:", v32);
  v72 = objc_allocWithZone(v37);
  v73 = objc_allocWithZone(v39);
  swift_retain_n(*((_QWORD *)&v24 + 1), 2);
  v74 = (char *)v72;
  *(_QWORD *)&v74[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view] = sub_10000F11C(*((uint64_t *)&v24 + 1));

  v129.receiver = v74;
  v129.super_class = v37;
  v75 = objc_msgSendSuper2(&v129, "initWithNibName:bundle:", 0, 0);
  swift_release(*((_QWORD *)&v24 + 1));
  v76 = *(void **)&v32[qword_10004F408];
  *(_QWORD *)&v32[qword_10004F408] = v75;
  v77 = (char *)v75;

  v78 = *(void **)&v77[OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view];
  v79 = (void **)&v32[direct field offset for APUISystemApertureElementHostingController.minimalView];
  swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.minimalView], v128, 1, 0);
  v80 = *v79;
  *v79 = v78;
  v81 = v78;

  objc_msgSend(v32, "addChildViewController:", v77);
  result = (char *)objc_msgSend(v32, "view");
  if (!result)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v82 = result;
  result = (char *)objc_msgSend(v77, "view");
  if (!result)
  {
LABEL_46:
    __break(1u);
    return result;
  }
  v83 = result;
  objc_msgSend(v82, "addSubview:", result);

  objc_msgSend(v77, "didMoveToParentViewController:", v32);
  if (v25)
  {
    v84 = &v32[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors], v122, 1, 0);
    if ((*(_QWORD *)v84 & 8) == 0)
      *(_QWORD *)v84 |= 8uLL;
  }
  if (v108)
  {
    v85 = &v32[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors];
    swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors], v123, 1, 0);
    if ((*(_QWORD *)v85 & 0x40) == 0)
      *(_QWORD *)v85 |= 0x40uLL;
  }
  v86 = &v32[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode];
  swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode], v127, 1, 0);
  if (v115 != *(_QWORD *)v86)
    *(_QWORD *)v86 = v115;
  v87 = (void **)&v32[direct field offset for APUISystemApertureElementHostingController.elementIdentifier];
  swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.elementIdentifier], v126, 1, 0);
  v88 = *v87;
  if (!v119)
  {
    if (!v88)
      goto LABEL_27;
LABEL_26:
    *v87 = v119;
    v96 = v112;

    goto LABEL_27;
  }
  if (!v88)
    goto LABEL_26;
  v89 = static String._unconditionallyBridgeFromObjectiveC(_:)(v119);
  v91 = v90;
  v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(v88);
  v94 = v92;
  if (v89 == v93 && v91 == v92)
  {
    swift_bridgeObjectRelease_n(v91, 2);
    goto LABEL_27;
  }
  v95 = _stringCompareWithSmolCheck(_:_:expecting:)(v89, v91, v93, v92, 0);
  swift_bridgeObjectRelease(v91);
  swift_bridgeObjectRelease(v94);
  if ((v95 & 1) == 0)
  {
    v88 = *v87;
    goto LABEL_26;
  }
LABEL_27:
  v97 = &v32[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  swift_beginAccess(&v32[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier], v125, 1, 0);
  v98 = *((_QWORD *)v97 + 1);
  if (v121)
  {
    v100 = v106;
    v99 = v107;
    v101 = &qword_10004F000;
    if (v98)
    {
      if (v109 == *(_QWORD *)v97 && v121 == v98
        || (_stringCompareWithSmolCheck(_:_:expecting:)(v109, v121, *(_QWORD *)v97, *((_QWORD *)v97 + 1), 0) & 1) != 0)
      {
        goto LABEL_35;
      }
      v98 = *((_QWORD *)v97 + 1);
    }
    goto LABEL_34;
  }
  v100 = v106;
  v99 = v107;
  v101 = &qword_10004F000;
  if (v98)
  {
LABEL_34:
    *(_QWORD *)v97 = v109;
    *((_QWORD *)v97 + 1) = v121;
    swift_bridgeObjectRetain(v121);
    swift_bridgeObjectRelease(v98);
  }
LABEL_35:
  v102 = (uint64_t *)&v32[v101[119]];
  swift_beginAccess(v102, v124, 1, 0);
  v103 = *v102;
  swift_bridgeObjectRetain(*v102);
  v104 = sub_10000F898(v116, v103);

  swift_bridgeObjectRelease(v103);
  sub_100008D14((uint64_t *)&v138);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 8))(v99, v100);
  if ((v104 & 1) != 0)
  {
    swift_bridgeObjectRelease(v116);
    swift_bridgeObjectRelease(v121);

    swift_release(*((_QWORD *)&v24 + 1));
    swift_release(v24);
    swift_release(v120);
    swift_release(v117);
    swift_release(v118);
  }
  else
  {
    v105 = *v102;
    *v102 = v116;
    swift_bridgeObjectRelease(v121);

    swift_release(*((_QWORD *)&v24 + 1));
    swift_release(v24);
    swift_release(v120);
    swift_release(v117);
    swift_release(v118);
    swift_bridgeObjectRelease(v105);
  }
  return v32;
}

_QWORD *sub_10000E6CC(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

unint64_t sub_10000E6F4()
{
  unint64_t result;

  result = qword_10004F368;
  if (!qword_10004F368)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture);
    atomic_store(result, (unint64_t *)&qword_10004F368);
  }
  return result;
}

_QWORD *sub_10000E738@<X0>(_BYTE *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_10000E6F4();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_10000E784(char *a1)
{
  unint64_t v1;
  char v3;

  v3 = *a1;
  v1 = sub_10000E6F4();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v1);
}

_QWORD *sub_10000E7CC@<X0>(_QWORD *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_100010734();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for APUIRemoteAlertTransitioningDelegateKey, &type metadata for APUIRemoteAlertTransitioningDelegateKey, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_10000E818(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v3;

  v3 = *a1;
  v1 = sub_100010734();
  swift_unknownObjectRetain(v3);
  return EnvironmentValues.subscript.setter(&v3, &type metadata for APUIRemoteAlertTransitioningDelegateKey, &type metadata for APUIRemoteAlertTransitioningDelegateKey, v1);
}

id APUISystemApertureElementHostingController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

void sub_10000E8B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC5coderACyxGSgSo7NSCoderC_tcfc_0();
}

id APUISystemApertureElementHostingController.layoutSystemApertureAccessoryViews()()
{
  char *v0;
  char *v1;
  id result;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double MidY;
  char *v18;
  id *v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MidX;
  id *v32;
  void *v33;
  id v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  char *v43;
  uint64_t v44;
  id *v45;
  id *v46;
  id *v47;
  char v48[24];
  char v49[24];
  char v50[24];
  char v51[24];
  char v52[24];
  char v53[24];
  char v54[24];
  char v55[32];
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v1 = &v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode];
  swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode], v48, 0, 0);
  if (*(_QWORD *)v1 != 4)
  {
    v18 = &v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode];
    swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode], v49, 0, 0);
    if (*(_QWORD *)v18 == 3)
    {
      v19 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.leadingView];
      swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.leadingView], v50, 0, 0);
      if (*v19)
      {
        v20 = *v19;
        result = objc_msgSend(v0, "view");
        if (!result)
        {
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        v21 = result;
        v22 = objc_msgSend(result, "SBUISA_systemApertureLeadingConcentricContentLayoutGuide");

        objc_msgSend(v22, "layoutFrame");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;

        v58.origin.x = v24;
        v58.origin.y = v26;
        v58.size.width = v28;
        v58.size.height = v30;
        MidX = CGRectGetMidX(v58);
        objc_msgSend(v20, "center");
        objc_msgSend(v20, "setCenter:", MidX);

      }
      v32 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.trailingView];
      swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.trailingView], v51, 0, 0);
      if (*v32)
      {
        v15 = *v32;
        result = objc_msgSend(v0, "view");
        if (result)
        {
          v33 = result;
          v34 = objc_msgSend(result, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide");

          objc_msgSend(v34, "layoutFrame");
          v36 = v35;
          v38 = v37;
          v40 = v39;
          v42 = v41;

          v59.origin.x = v36;
          v59.origin.y = v38;
          v59.size.width = v40;
          v59.size.height = v42;
          v16 = CGRectGetMidX(v59);
          objc_msgSend(v15, "center");
          goto LABEL_15;
        }
LABEL_27:
        __break(1u);
        return result;
      }
    }
    goto LABEL_16;
  }
  result = objc_msgSend(v0, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_24;
  }
  v3 = result;
  objc_msgSend(result, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(void **)&v0[qword_10004F3E8];
  if (!v12)
    goto LABEL_16;
  result = objc_msgSend(v12, "view");
  if (!result)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v13 = result;
  objc_msgSend(result, "frame");
  objc_msgSend(v13, "setFrame:");

  v14 = *(void **)&v0[qword_10004F3E8];
  if (v14)
  {
    result = objc_msgSend(v14, "view");
    if (result)
    {
      v15 = result;
      v56.origin.x = v5;
      v56.origin.y = v7;
      v56.size.width = v9;
      v56.size.height = v11;
      v16 = CGRectGetMidX(v56);
      v57.origin.x = v5;
      v57.origin.y = v7;
      v57.size.width = v9;
      v57.size.height = v11;
      MidY = CGRectGetMidY(v57);
LABEL_15:
      objc_msgSend(v15, "setCenter:", v16, MidY);

      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_16:
  v43 = &v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode];
  swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode], v52, 0, 0);
  v44 = *(_QWORD *)v43;
  v45 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.leadingView];
  swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.leadingView], v53, 0, 0);
  if (*v45)
    objc_msgSend(*v45, "setHidden:", v44 == 4);
  v46 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.trailingView];
  swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.trailingView], v54, 0, 0);
  if (*v46)
    objc_msgSend(*v46, "setHidden:", v44 == 4);
  v47 = (id *)&v0[direct field offset for APUISystemApertureElementHostingController.minimalView];
  swift_beginAccess(&v0[direct field offset for APUISystemApertureElementHostingController.minimalView], v55, 0, 0);
  result = *v47;
  if (*v47)
    return objc_msgSend(result, "setHidden:", v44 == 4);
  return result;
}

void APUISystemApertureElementHostingController.viewWillLayoutSubviews(with:)(void *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;

  v3 = swift_allocObject(&unk_100045B18, 24, 7);
  *(_QWORD *)(v3 + 16) = v1;
  v7[4] = sub_100010088;
  v8 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10000EE34;
  v7[3] = &unk_100045B30;
  v4 = _Block_copy(v7);
  v5 = v8;
  v6 = v1;
  swift_release(v5);
  objc_msgSend(a1, "animateAlongsideTransition:completion:", v4, 0);
  _Block_release(v4);
}

id sub_10000ED94(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)((char *)a2 + qword_10004F3F0);
  type metadata accessor for APUISystemApertureElementHostingController(0, *(_QWORD *)((swift_isaMask & *a2) + 0x50), *(_QWORD *)((swift_isaMask & *a2) + 0x58), a4);
  swift_retain(v5);
  sub_100025470(a2, v5);
  swift_release(v5);
  v6 = *(id *)((char *)a2 + qword_10004F3E0);
  sub_10002BEC4(a2, (uint64_t)v6);

  return APUISystemApertureElementHostingController.layoutSystemApertureAccessoryViews()();
}

uint64_t sub_10000EE34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

void sub_10000EE7C(void *a1, uint64_t a2, void *a3)
{
  id v5;

  swift_unknownObjectRetain(a3);
  v5 = a1;
  APUISystemApertureElementHostingController.viewWillLayoutSubviews(with:)(a3);
  swift_unknownObjectRelease(a3);

}

uint64_t sub_10000EED0()
{
  return 1;
}

void sub_10000EEDC(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;

  swift_unknownObjectRetain(a3);
  v5 = a1;
  _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC29preferredContentSizeDidChange08forChildJ9ContainerySo09UIContentP0_p_tF_0();
  swift_unknownObjectRelease(a3);

}

id APUISystemApertureElementHostingController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithNibName:bundle:", v7, a3);

  return v8;
}

void APUISystemApertureElementHostingController.init(nibName:bundle:)()
{
  sub_1000101D0();
}

void sub_10000EFB8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_1000101D0();
}

id APUISystemApertureElementHostingController.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for APUISystemApertureElementHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), *(_QWORD *)((swift_isaMask & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

void sub_10000F040(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1
                                      + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier
                                      + 8));

  swift_bridgeObjectRelease(*(_QWORD *)(a1
                                      + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress));

  swift_release(*(_QWORD *)(a1 + qword_10004F3F0));
}

char *sub_10000F11C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_class *v20;
  char *v21;
  void *v22;
  char *v23;
  char *result;
  char *v25;
  uint64_t v26;
  objc_super v27;
  uint64_t v28;

  v3 = type metadata accessor for UIHostingControllerSizingOptions(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone((Class)sub_1000088F0((uint64_t *)&unk_10004F650));
  v28 = a1;
  v8 = v1;
  swift_retain(a1);
  v9 = (void *)UIHostingController.init(rootView:)(&v28);
  v10 = sub_1000088F0(&qword_10004EFC8);
  v11 = swift_allocObject(v10, ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72), *(unsigned __int8 *)(v4 + 80) | 7);
  *(_OWORD *)(v11 + 16) = xmmword_1000349A0;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  v28 = v11;
  v12 = sub_1000067D0((unint64_t *)&qword_10004EFD0, (uint64_t (*)(uint64_t))&type metadata accessor for UIHostingControllerSizingOptions, (uint64_t)&protocol conformance descriptor for UIHostingControllerSizingOptions);
  v13 = sub_1000088F0(&qword_10004EFD8);
  v14 = sub_100008E7C((unint64_t *)&qword_10004EFE0, &qword_10004EFD8, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v13, v14, v3, v12);
  dispatch thunk of UIHostingController.sizingOptions.setter(v6);
  *(_QWORD *)&v8[OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController] = v9;
  v15 = v9;
  objc_msgSend(v15, "preferredContentSize");
  v17 = v16;
  v19 = v18;

  v20 = (objc_class *)type metadata accessor for APUISystemApertureAccessoryView();
  v27.receiver = v8;
  v27.super_class = v20;
  v21 = (char *)objc_msgSendSuper2(&v27, "initWithFrame:", 0.0, 0.0, v17, v19);
  v22 = *(void **)&v21[OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController];
  v23 = v21;
  result = (char *)objc_msgSend(v22, "view");
  if (result)
  {
    v25 = result;
    objc_msgSend(v23, "addSubview:", result);

    swift_release(a1);
    return v23;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000F4EC()
{
  return sub_10000F6A8(type metadata accessor for APUISystemApertureAccessoryView);
}

id sub_10000F69C()
{
  return sub_10000F6A8(type metadata accessor for APUISystemApertureAccessoryViewController);
}

id sub_10000F6A8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

double sub_10000F6E8@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  __int128 v7;
  __int128 v8;
  _OWORD v9[3];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000355A8);
  v5 = swift_getKeyPath(&unk_1000355D0);
  static Published.subscript.getter(v9, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = *(double *)v9;
  v7 = v9[1];
  v8 = v9[2];
  *a2 = v9[0];
  a2[1] = v7;
  a2[2] = v8;
  return result;
}

uint64_t sub_10000F770(__int128 *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v8 = a1[1];
  v9 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  v3 = *((_QWORD *)a1 + 5);
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000355A8);
  v6 = swift_getKeyPath(&unk_1000355D0);
  v10[0] = v9;
  v10[1] = v8;
  v11 = v2;
  v12 = v3;
  swift_retain(v4);
  return static Published.subscript.setter(v10, v4, KeyPath, v6);
}

id *sub_10000F804(id *a1)
{

  return a1;
}

uint64_t sub_10000F82C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000088F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F870(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10000F898(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  Swift::Int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char v38;
  uint64_t v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  _QWORD v43[9];

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v39 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v40 = (unint64_t)(v4 + 63) >> 6;
  v42 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v41 = v3;
      v8 = v7 | (v3 << 6);
      goto LABEL_27;
    }
    v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_46;
    }
    if (v9 >= v40)
      return 1;
    v10 = *(_QWORD *)(v39 + 8 * v9);
    v11 = v3 + 1;
    if (!v10)
    {
      v11 = v3 + 2;
      if (v3 + 2 >= v40)
        return 1;
      v10 = *(_QWORD *)(v39 + 8 * v11);
      if (!v10)
      {
        v11 = v3 + 3;
        if (v3 + 3 >= v40)
          return 1;
        v10 = *(_QWORD *)(v39 + 8 * v11);
        if (!v10)
        {
          v11 = v3 + 4;
          if (v3 + 4 >= v40)
            return 1;
          v10 = *(_QWORD *)(v39 + 8 * v11);
          if (!v10)
            break;
        }
      }
    }
LABEL_26:
    v6 = (v10 - 1) & v10;
    v41 = v11;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_27:
    v13 = result;
    v14 = *(void **)(*(_QWORD *)(result + 48) + 8 * v8);
    v15 = *(_QWORD *)(a2 + 40);
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v18 = v17;
    Hasher.init(_seed:)(v43, v15);
    v19 = v14;
    String.hash(into:)(v43, v16, v18);
    v20 = Hasher._finalize()();
    swift_bridgeObjectRelease(v18);
    v21 = -1 << *(_BYTE *)(a2 + 32);
    v22 = v20 & ~v21;
    if (((*(_QWORD *)(v42 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
      goto LABEL_42;
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v22));
    v25 = v24;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    if (v23 == v26 && v25 == v27)
    {
LABEL_7:
      swift_bridgeObjectRelease_n(v25, 2);
    }
    else
    {
      v29 = v27;
      v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v26, v27, 0);
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v29);
      if ((v30 & 1) == 0)
      {
        v31 = ~v21;
        while (1)
        {
          v22 = (v22 + 1) & v31;
          if (((*(_QWORD *)(v42 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
            break;
          v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v22));
          v25 = v33;
          v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
          if (v32 == v34 && v25 == v35)
            goto LABEL_7;
          v37 = v35;
          v38 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v25, v34, v35, 0);
          swift_bridgeObjectRelease(v25);
          swift_bridgeObjectRelease(v37);
          if ((v38 & 1) != 0)
            goto LABEL_8;
        }
LABEL_42:

        return 0;
      }
    }
LABEL_8:

    result = v13;
    v3 = v41;
  }
  v12 = v3 + 5;
  if (v3 + 5 >= v40)
    return 1;
  v10 = *(_QWORD *)(v39 + 8 * v12);
  if (v10)
  {
    v11 = v3 + 5;
    goto LABEL_26;
  }
  while (1)
  {
    v11 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v11 >= v40)
      return 1;
    v10 = *(_QWORD *)(v39 + 8 * v11);
    ++v12;
    if (v10)
      goto LABEL_26;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_10000FBC4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000FC08()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.elementIdentifier;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.elementIdentifier, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000FC4C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000FC90()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.leadingView;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.leadingView, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000FCD4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.trailingView;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.trailingView, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000FD18()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + direct field offset for APUISystemApertureElementHostingController.minimalView;
  swift_beginAccess(v0 + direct field offset for APUISystemApertureElementHostingController.minimalView, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000FD5C()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for APUISystemApertureElementHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100010778(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for APUISystemApertureElementHostingController);
}

_QWORD *sub_10000FD70@<X0>(_BYTE *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_10000E6F4();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v2);
  *a1 = v4;
  return result;
}

uint64_t sub_10000FDBC(char *a1)
{
  unint64_t v1;
  char v3;

  v3 = *a1;
  v1 = sub_10000E6F4();
  return EnvironmentValues.subscript.setter(&v3, &type metadata for APUIHostedBySystemAperture, &type metadata for APUIHostedBySystemAperture, v1);
}

_QWORD *sub_10000FE04@<X0>(_QWORD *a1@<X8>)
{
  unint64_t v2;
  _QWORD *result;
  uint64_t v4;

  v2 = sub_100010734();
  result = EnvironmentValues.subscript.getter(&v4, &type metadata for APUIRemoteAlertTransitioningDelegateKey, &type metadata for APUIRemoteAlertTransitioningDelegateKey, v2);
  *a1 = v4;
  return result;
}

uint64_t type metadata accessor for APUISystemApertureAccessoryViewController()
{
  return objc_opt_self(_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController);
}

uint64_t type metadata accessor for APUISystemApertureAccessoryView()
{
  return objc_opt_self(_TtC18ActivityProgressUI31APUISystemApertureAccessoryView);
}

void _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC5coderACyxGSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.activeLayoutMode] = 0;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.contentRole] = 2;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.preferredLayoutMode] = 4;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.maximumLayoutMode] = 4;
  v1 = &v0[direct field offset for APUISystemApertureElementHostingController.associatedAppBundleIdentifier];
  *v1 = 0;
  v1[1] = 0;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.elementIdentifier] = 0;
  v0[direct field offset for APUISystemApertureElementHostingController.attachedMinimalViewRequiresZeroPadding] = 1;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.backgroundActivitiesToSuppress] = &_swiftEmptySetSingleton;
  v2 = qword_10004F3E0;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator()), "init");
  *(_QWORD *)&v0[qword_10004F3E8] = 0;
  v3 = qword_10004F3F0;
  v4 = type metadata accessor for APUISystemApertureLayoutState(0);
  v5 = swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v11 = 0;
  v12 = 0;
  __asm { FMOV            V0.2D, #20.0 }
  v13 = _Q0;
  v14 = _Q0;
  Published.init(initialValue:)(&v11, &type metadata for APUISystemApertureLayoutState.Metrics);
  v11 = 0;
  v12 = 0;
  LOBYTE(v13) = 0;
  Published.init(initialValue:)(&v11, &type metadata for APUISystemApertureLayoutState.Context);
  *(_QWORD *)&v0[v3] = v5;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.leadingView] = 0;
  *(_QWORD *)&v0[qword_10004F3F8] = 0;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.trailingView] = 0;
  *(_QWORD *)&v0[qword_10004F400] = 0;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.minimalView] = 0;
  *(_QWORD *)&v0[qword_10004F408] = 0;
  *(_QWORD *)&v0[direct field offset for APUISystemApertureElementHostingController.presentationBehaviors] = 1;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/APUISystemApertureElementHostingController.swift", 67, 2, 243, 0);
  __break(1u);
}

uint64_t sub_100010064()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100010088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_10000ED94(a1, *(_QWORD **)(v4 + 16), a3, a4);
}

uint64_t sub_100010090(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000100A0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id _s18ActivityProgressUI42APUISystemApertureElementHostingControllerC29preferredContentSizeDidChange08forChildJ9ContainerySo09UIContentP0_p_tF_0()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  id result;
  double v9;
  double v10;
  id v12;
  void *v13;
  _QWORD v14[6];

  objc_msgSend(v0, "preferredContentSize");
  v2 = v1;
  v4 = v3;
  v5 = *(_QWORD *)&v0[qword_10004F3E8];
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v5 + OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view)+ OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController), "preferredContentSize");
  }
  else
  {
    v7 = 0.0;
    v6 = 0.0;
  }
  objc_msgSend(v0, "setPreferredContentSize:", v6, v7);
  result = objc_msgSend(v0, "preferredContentSize");
  if (v2 != v10 || v4 != v9)
  {
    v12 = objc_msgSend(v0, "systemApertureElementContext");
    v14[4] = nullsub_1;
    v14[5] = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 1107296256;
    v14[2] = sub_1000134A0;
    v14[3] = &unk_100045D00;
    v13 = _Block_copy(v14);
    objc_msgSend(v12, "setElementNeedsUpdateWithCoordinatedAnimations:", v13);
    _Block_release(v13);
    return (id)swift_unknownObjectRelease(v12);
  }
  return result;
}

void sub_1000101D0()
{
  _swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.APUISystemApertureElementHostingController", 61, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

uint64_t sub_1000101FC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of APUISystemApertureElement.body>>, 1);
}

ValueMetadata *type metadata accessor for APUIHostedBySystemAperture()
{
  return &type metadata for APUIHostedBySystemAperture;
}

uint64_t destroy for APUISystemApertureElement(uint64_t a1)
{
  swift_release(*(_QWORD *)a1);
  swift_release(*(_QWORD *)(a1 + 16));
  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  swift_release(*(_QWORD *)(a1 + 40));

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 80));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 88));
}

uint64_t initializeWithCopy for APUISystemApertureElement(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2[2];
  v6 = a2[3];
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = a2[4];
  v8 = a2[5];
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_WORD *)(a1 + 48) = *((_WORD *)a2 + 24);
  v9 = (void *)a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v9;
  v10 = a2[10];
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_QWORD *)(a1 + 80) = v10;
  v11 = a2[11];
  *(_QWORD *)(a1 + 88) = v11;
  swift_retain(v3);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  v12 = v9;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  return a1;
}

uint64_t *assignWithCopy for APUISystemApertureElement(uint64_t *a1, uint64_t *a2)
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
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = a2[4];
  v11 = a1[4];
  a1[4] = v10;
  swift_retain(v10);
  swift_release(v11);
  v12 = a2[5];
  v13 = a1[5];
  a1[5] = v12;
  swift_retain(v12);
  swift_release(v13);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  *((_BYTE *)a1 + 49) = *((_BYTE *)a2 + 49);
  a1[7] = a2[7];
  v14 = (void *)a1[8];
  v15 = (void *)a2[8];
  a1[8] = (uint64_t)v15;
  v16 = v15;

  a1[9] = a2[9];
  v17 = a2[10];
  v18 = a1[10];
  a1[10] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  v19 = a2[11];
  v20 = a1[11];
  a1[11] = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRelease(v20);
  return a1;
}

__n128 initializeWithTake for APUISystemApertureElement(uint64_t a1, uint64_t a2)
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
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t *assignWithTake for APUISystemApertureElement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];
  swift_release(a1[2]);
  v5 = a1[3];
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  swift_release(v5);
  swift_release(a1[4]);
  v6 = a1[5];
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  swift_release(v6);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  *((_BYTE *)a1 + 49) = *((_BYTE *)a2 + 49);
  v7 = (void *)a1[8];
  v8 = a2[8];
  a1[7] = a2[7];
  a1[8] = v8;

  a1[9] = a2[9];
  swift_bridgeObjectRelease(a1[10]);
  v9 = a1[11];
  *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureElement(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureElement()
{
  return &type metadata for APUISystemApertureElement;
}

uint64_t sub_1000105A8(uint64_t a1)
{
  _QWORD v2[18];

  v2[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[3] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[4] = &unk_1000357A0;
  v2[5] = &unk_1000357B8;
  v2[6] = &unk_1000357D0;
  v2[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[9] = &unk_1000357B8;
  v2[10] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[11] = &unk_1000357B8;
  v2[12] = &unk_1000357B8;
  v2[13] = &unk_1000357B8;
  v2[14] = &unk_1000357B8;
  v2[15] = &unk_1000357B8;
  v2[16] = &unk_1000357B8;
  v2[17] = (char *)&value witness table for Builtin.Int64 + 64;
  return swift_initClassMetadata2(a1, 0, 18, v2, a1 + 96);
}

unint64_t sub_10001064C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004F618;
  if (!qword_10004F618)
  {
    v1 = sub_100008B84(&qword_10004F620);
    sub_1000106D0();
    sub_100008E7C(&qword_10004F638, (uint64_t *)&unk_10004F640, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10004F618);
  }
  return result;
}

unint64_t sub_1000106D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004F628;
  if (!qword_10004F628)
  {
    v1 = sub_100008B84(&qword_10004F630);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10004F628);
  }
  return result;
}

unint64_t sub_100010734()
{
  unint64_t result;

  result = qword_100050590;
  if (!qword_100050590)
  {
    result = swift_getWitnessTable(&unk_100036CB8, &type metadata for APUIRemoteAlertTransitioningDelegateKey);
    atomic_store(result, (unint64_t *)&qword_100050590);
  }
  return result;
}

uint64_t sub_100010778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

id sub_10001083C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC18ActivityProgressUI11AppDelegate);
}

uint64_t sub_100010924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_10004F6F0);
  v1 = sub_100008930(v0, (uint64_t)qword_10004F6F0);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1000109B4()
{
  return 0;
}

uint64_t sub_1000109C0@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_1000109EC()
{
  return 0;
}

void sub_1000109F8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100010A04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015734();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100010A2C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015734();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100010A54(_QWORD *a1)
{
  return sub_1000156F0(a1);
}

uint64_t sub_100010A78(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = sub_1000088F0(&qword_10004FAB8);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_100015710(a1, v6);
  v8 = sub_100015734();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BackgroundActivityAttributes.ContentState.CodingKeys, &type metadata for BackgroundActivityAttributes.ContentState.CodingKeys, v8, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int sub_100010B3C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  return Hasher._finalize()();
}

Swift::Int sub_100010B70(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  return Hasher._finalize()();
}

uint64_t sub_100010BA0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v4 = sub_1000088F0(&qword_10004FAF0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100015710(a1, v8);
  v10 = sub_1000163D4();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BackgroundActivityAttributes.CodingKeys, &type metadata for BackgroundActivityAttributes.CodingKeys, v10, v8, v9);
  v13 = a2;
  sub_1000088F0(&qword_10004FAD8);
  sub_100016418(&qword_10004FAF8, &qword_10004FB00, (uint64_t)&protocol conformance descriptor for UUID, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int sub_100010CC4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100010D04()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100010D28(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100010D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000161C8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100010D90(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000163D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100010DB8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000163D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

_QWORD *sub_100010DE0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_100016288(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_100010E08(_QWORD *a1)
{
  uint64_t *v1;

  return sub_100010BA0(a1, *v1);
}

void *sub_100010E20()
{
  void *result;

  result = (void *)sub_100004AC0((uint64_t)&_swiftEmptyArrayStorage);
  off_10004F708 = result;
  return result;
}

uint64_t sub_100010E44()
{
  return sub_100010E6C((uint64_t)&unk_100035BA0, (uint64_t)&unk_100035BC8);
}

uint64_t sub_100010E58()
{
  return sub_100010E6C((uint64_t)&unk_100035BE8, (uint64_t)&unk_100035C10);
}

uint64_t sub_100010E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

uint64_t sub_100010ED4()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100035C30);
  v2 = swift_getKeyPath(&unk_100035C58);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100010F44()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100035D50);
  v2 = swift_getKeyPath(&unk_100035D78);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100010FB4()
{
  return sub_100010FDC((uint64_t)&unk_100035B10, (uint64_t)&unk_100035B38);
}

uint64_t sub_100010FC8()
{
  return sub_100010FDC((uint64_t)&unk_100035D08, (uint64_t)&unk_100035D30);
}

uint64_t sub_100010FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

uint64_t sub_100011044@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100035CC0);
  v4 = swift_getKeyPath(&unk_100035CE8);
  static Published.subscript.getter(a1, v1, KeyPath, v4);
  swift_release(KeyPath);
  return swift_release(v4);
}

uint64_t sub_1000110A8()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  void *object;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  void *v10;
  Swift::String v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Swift::String v15;

  _StringGuts.grow(_:)(67);
  v1._countAndFlagsBits = 0xD000000000000026;
  v1._object = (void *)0x800000010003A740;
  String.append(_:)(v1);
  v2 = type metadata accessor for Date(0);
  v3 = sub_1000067D0(&qword_10004FB80, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v2, v3);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  v6._countAndFlagsBits = 0x3D6469202CLL;
  v6._object = (void *)0xE500000000000000;
  String.append(_:)(v6);
  v7 = type metadata accessor for UUID(0);
  v8 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v7, v8);
  v10 = v9._object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v10);
  v11._object = (void *)0x800000010003A770;
  v11._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v11);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession))
    v12 = 1702195828;
  else
    v12 = 0x65736C6166;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession))
    v13 = 0xE400000000000000;
  else
    v13 = 0xE500000000000000;
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease(v13);
  v15._countAndFlagsBits = 93;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  return 0;
}

uint64_t sub_100011250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  _QWORD *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char *v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
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
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint8_t *v76;
  id v77;
  _QWORD *v78;
  uint64_t v79;
  char *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  _QWORD v86[4];
  uint64_t v87;
  uint64_t v88;

  v12 = v11;
  v81 = a8;
  v82 = a1;
  v77 = a7;
  v73 = a5;
  v74 = a6;
  v71 = a3;
  v72 = a4;
  v83 = a11;
  LODWORD(v76) = a10;
  v75 = a9;
  v14 = type metadata accessor for APKDeviceLockState(0);
  v78 = *(_QWORD **)(v14 - 8);
  v15 = __chkstk_darwin(v14);
  v80 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)&v70 - v17;
  v19 = sub_1000088F0(&qword_10004FB08);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = Date.init()(v21);
  UUID.init()(v24);
  v25 = v11 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__image;
  v86[0] = 0;
  v26 = sub_1000088F0(&qword_10004F7A0);
  Published.init(initialValue:)(v86, v26);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v25, v23, v19);
  *(_QWORD *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity) = 0;
  v27 = (_QWORD *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  v28 = v71;
  *v27 = a2;
  v27[1] = v28;
  swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__title, v86, 33, 0);
  v84 = v72;
  v85 = v73;
  Published.init(initialValue:)(&v84, &type metadata for String);
  swift_endAccess(v86);
  swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__subtitle, v86, 33, 0);
  v84 = v74;
  v85 = v77;
  v29 = v81;
  Published.init(initialValue:)(&v84, &type metadata for String);
  swift_endAccess(v86);
  swift_beginAccess(v25, v86, 33, 0);
  v30 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v31 = (uint64_t)v75;
  v77 = v75;
  v30(v25, v19);
  v84 = v31;
  Published.init(initialValue:)(&v84, v26);
  swift_endAccess(v86);
  LOBYTE(v26) = sub_1000119C8();
  swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__shouldHideProgressUI, v86, 33, 0);
  LOBYTE(v84) = v26 & 1;
  Published.init(initialValue:)(&v84, &type metadata for Bool);
  swift_endAccess(v86);
  swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__canceling, v86, 33, 0);
  LOBYTE(v84) = 0;
  Published.init(initialValue:)(&v84, &type metadata for Bool);
  swift_endAccess(v86);
  LOBYTE(v30) = (_BYTE)v76;
  *(_BYTE *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) = (_BYTE)v76;
  v32 = v78;
  v33 = (void (*)(char *, uint64_t, uint64_t))v78[2];
  v33(v18, v83, v14);
  swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__lockState, v86, 33, 0);
  v34 = v80;
  v33(v80, (uint64_t)v18, v14);
  Published.init(initialValue:)(v34, v14);
  v35 = (_QWORD *)v32[1];
  v80 = (char *)v14;
  v78 = v35;
  ((void (*)(char *, uint64_t))v35)(v18, v14);
  v36 = swift_endAccess(v86);
  *(_BYTE *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_systemApertureIsEnabled) = SBUIIsSystemApertureEnabled(v36);
  if ((v30 & 1) != 0)
  {
    *(_QWORD *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers) = &_swiftEmptyArrayStorage;
    v37 = objc_msgSend((id)objc_opt_self(NSProgress), "progressWithTotalUnitCount:", 0);
    swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__progress, v86, 33, 0);
    v84 = (uint64_t)v37;
    v38 = sub_10000BF98(0, &qword_10004F790, NSProgress_ptr);
    Published.init(initialValue:)(&v84, v38);
    swift_endAccess(v86);
    v39 = v82;
    sub_1000136B0(v82, (uint64_t)v29);
  }
  else
  {
    v40 = sub_1000088F0(&qword_10004FB10);
    v41 = type metadata accessor for UUID(0);
    v42 = *(_QWORD *)(v41 - 8);
    v43 = *(unsigned __int8 *)(v42 + 80);
    v44 = (v43 + 32) & ~v43;
    v45 = swift_allocObject(v40, v44 + *(_QWORD *)(v42 + 72), v43 | 7);
    *(_OWORD *)(v45 + 16) = xmmword_1000349A0;
    v46 = v45 + v44;
    v39 = v82;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v46, v82, v41);
    *(_QWORD *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers) = v45;
    swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__progress, v86, 33, 0);
    v84 = (uint64_t)v29;
    v47 = sub_10000BF98(0, &qword_10004F790, NSProgress_ptr);
    v48 = v29;
    Published.init(initialValue:)(&v84, v47);
    swift_endAccess(v86);
  }
  if (qword_10004ECF0 != -1)
    swift_once(&qword_10004ECF0, sub_100010924);
  v49 = type metadata accessor for Logger(0);
  sub_100008930(v49, (uint64_t)qword_10004F6F0);
  v50 = swift_retain_n(v12, 2);
  v51 = Logger.logObject.getter(v50);
  v52 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc(12, -1);
    v54 = swift_slowAlloc(32, -1);
    v84 = v54;
    *(_DWORD *)v53 = 136315138;
    v76 = v53 + 4;
    v55 = (uint64_t *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v86, 0, 0);
    v56 = *v55;
    v57 = type metadata accessor for UUID(0);
    v58 = swift_bridgeObjectRetain(v56);
    v59 = Array.description.getter(v58, v57);
    v61 = v60;
    swift_bridgeObjectRelease(v56);
    v87 = sub_10002785C(v59, v61, &v84);
    v29 = v81;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88);
    swift_release_n(v12, 2);
    swift_bridgeObjectRelease(v61);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Background activity session created for task identifiers %s", v53, 0xCu);
    swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
    v62 = v54;
    v39 = v82;
    swift_slowDealloc(v62, -1, -1);
    swift_slowDealloc(v53, -1, -1);

  }
  else
  {

    swift_release_n(v12, 2);
  }
  v63 = v79;
  v64 = sub_100011FAC();
  if (v63)
  {
    swift_release(v12);

    ((void (*)(uint64_t, char *))v78)(v83, v80);
    v65 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 8))(v39, v65);
  }
  else
  {
    v66 = v64;

    ((void (*)(uint64_t, char *))v78)(v83, v80);
    v67 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 8))(v39, v67);
    v68 = *(_QWORD *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity);
    *(_QWORD *)(v12 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity) = v66;
    swift_release(v68);
  }
  return v12;
}

id sub_1000119C8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  id v11;
  id v13;
  __int128 v14;
  __int128 v15;

  v1 = objc_msgSend(v0, "userInfo");
  type metadata accessor for ProgressUserInfoKey(0);
  v3 = v2;
  v4 = sub_1000067D0(&qword_10004F040, (uint64_t (*)(uint64_t))type metadata accessor for ProgressUserInfoKey, (uint64_t)&unk_100035220);
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, v3, (char *)&type metadata for Any + 8, v4);

  if (!*(_QWORD *)(v5 + 16))
  {
    v14 = 0u;
    v15 = 0u;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    goto LABEL_9;
  }
  v6 = CFSTR("HideProgressCircleInUI");
  v7 = sub_10002804C((uint64_t)CFSTR("HideProgressCircleInUI"));
  if ((v8 & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;

    goto LABEL_8;
  }
  sub_10001649C(*(_QWORD *)(v5 + 56) + 32 * v7, (uint64_t)&v14);

  swift_bridgeObjectRelease(v5);
  if (!*((_QWORD *)&v15 + 1))
  {
LABEL_9:
    sub_1000164F8((uint64_t)&v14, &qword_10004FE20);
    return 0;
  }
  v9 = sub_10000BF98(0, &qword_10004FB18, NSNumber_ptr);
  if ((swift_dynamicCast(&v13, &v14, (char *)&type metadata for Any + 8, v9, 6) & 1) == 0)
    return 0;
  v10 = v13;
  v11 = objc_msgSend(v13, "BOOLValue");

  return v11;
}

uint64_t sub_100011B38()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for ActivityUIDismissalPolicy(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000088F0(&qword_10004FB30);
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity;
  v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity);
  if (v10)
  {
    v11 = sub_1000088F0(&qword_10004FB38);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    v12 = swift_retain(v10);
    static ActivityUIDismissalPolicy.immediate.getter(v12);
    dispatch thunk of Activity.endSync(_:dismissalPolicy:)(v8, v5);
    swift_release(v10);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_1000164F8((uint64_t)v8, &qword_10004FB30);
  }
  v13 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_startTime;
  v14 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id;
  v16 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease(*(_QWORD *)(v1
                                      + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers));
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8));
  v17 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__title;
  v18 = sub_1000088F0(&qword_10004FB88);
  v19 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8);
  v19(v17, v18);
  v19(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__subtitle, v18);
  v20 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__progress;
  v21 = sub_1000088F0(&qword_10004FB90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
  v22 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__image;
  v23 = sub_1000088F0(&qword_10004FB08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
  v24 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__shouldHideProgressUI;
  v25 = sub_1000088F0(&qword_10004FB98);
  v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8);
  v26(v24, v25);
  v26(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__canceling, v25);
  v27 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession__lockState;
  v28 = sub_1000088F0(&qword_10004FBA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
  swift_release(*(_QWORD *)(v1 + v9));
  return v1;
}

uint64_t sub_100011DE8()
{
  uint64_t v0;

  sub_100011B38();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100011E0C()
{
  return type metadata accessor for BackgroundActivitySession(0);
}

uint64_t type metadata accessor for BackgroundActivitySession(uint64_t a1)
{
  uint64_t result;

  result = qword_10004F770;
  if (!qword_10004F770)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BackgroundActivitySession);
  return result;
}

void sub_100011E50(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v16[4];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v16[0] = *(_QWORD *)(v2 - 8) + 64;
    v4 = type metadata accessor for UUID(319);
    if (v5 <= 0x3F)
    {
      v16[1] = *(_QWORD *)(v4 - 8) + 64;
      v16[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v16[3] = &unk_1000358B0;
      sub_1000153BC(319, &qword_10004F780, (uint64_t)&type metadata for String);
      if (v7 <= 0x3F)
      {
        v17 = *(_QWORD *)(v6 - 8) + 64;
        v18 = v17;
        sub_100015300(319);
        if (v9 <= 0x3F)
        {
          v19 = *(_QWORD *)(v8 - 8) + 64;
          sub_100015364(319);
          if (v11 <= 0x3F)
          {
            v20 = *(_QWORD *)(v10 - 8) + 64;
            sub_1000153BC(319, &qword_10004F7A8, (uint64_t)&type metadata for Bool);
            if (v13 <= 0x3F)
            {
              v21 = *(_QWORD *)(v12 - 8) + 64;
              v22 = v21;
              sub_100015400(319);
              if (v15 <= 0x3F)
              {
                v23 = *(_QWORD *)(v14 - 8) + 64;
                v24 = &unk_1000358C8;
                v25 = &unk_1000358C8;
                v26 = &unk_1000358E0;
                swift_updateClassMetadata2(a1, 256, 14, v16, a1 + 80);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_100011FAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(char *, uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char v85[24];
  uint64_t v86;
  _QWORD v87[3];
  char v88[8];
  uint64_t v89[4];
  uint64_t v90;
  uint64_t v91;

  v2 = v1;
  v3 = v0;
  v4 = sub_1000088F0(&qword_10004FB68);
  __chkstk_darwin(v4);
  v79 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000088F0(&qword_10004FB38);
  v82 = *(_QWORD *)(v6 - 8);
  v83 = v6;
  __chkstk_darwin(v6);
  v81 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ActivityPresentationOptions(0);
  v9 = *(void (***)(char *, uint64_t))(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10004ECF0 != -1)
    swift_once(&qword_10004ECF0, sub_100010924);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_100008930(v12, (uint64_t)qword_10004F6F0);
  v14 = swift_retain_n(v3, 2);
  v80 = v13;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  v17 = os_log_type_enabled(v15, v16);
  v84 = v11;
  if (v17)
  {
    v18 = swift_slowAlloc(12, -1);
    v78 = v8;
    v19 = (uint8_t *)v18;
    v76 = swift_slowAlloc(32, -1);
    v89[0] = v76;
    *(_DWORD *)v19 = 136315138;
    v75 = v19 + 4;
    v77 = v1;
    v20 = (uint64_t *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v85, 0, 0);
    v21 = *v20;
    v22 = type metadata accessor for UUID(0);
    v23 = swift_bridgeObjectRetain(v21);
    v24 = v3;
    v25 = v9;
    v26 = Array.description.getter(v23, v22);
    v28 = v27;
    v29 = v21;
    v2 = v77;
    swift_bridgeObjectRelease(v29);
    v30 = v26;
    v9 = v25;
    v3 = v24;
    v90 = sub_10002785C(v30, v28, v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
    swift_release_n(v24, 2);
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Creating ActivityKit activity for task identifiers: %s", v19, 0xCu);
    v31 = v76;
    swift_arrayDestroy(v76, 1, (char *)&type metadata for Any + 8);
    v11 = v84;
    swift_slowDealloc(v31, -1, -1);
    v32 = v19;
    v8 = v78;
    swift_slowDealloc(v32, -1, -1);

  }
  else
  {

    swift_release_n(v3, 2);
  }
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_systemApertureIsEnabled) == 1)
  {
    v33 = *(unsigned __int8 *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
    v34 = sub_1000088F0(&qword_10004FB70);
    v35 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination(0);
    v36 = *(_QWORD *)(v35 - 8);
    v37 = *(unsigned __int8 *)(v36 + 80);
    v38 = (v37 + 32) & ~v37;
    v39 = swift_allocObject(v34, v38 + *(_QWORD *)(v36 + 72), v37 | 7);
    *(_OWORD *)(v39 + 16) = xmmword_1000349A0;
    if (v33 == 1)
      v40 = (unsigned int *)&enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:);
    else
      v40 = (unsigned int *)&enum case for ActivityPresentationOptions.ActivityPresentationDestination.lockscreen(_:);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v36 + 104))(v39 + v38, *v40, v35);
    v11 = v84;
  }
  else
  {
    v41 = sub_1000088F0(&qword_10004FB70);
    v42 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination(0);
    v43 = *(_QWORD *)(v42 - 8);
    v44 = *(unsigned __int8 *)(v43 + 80);
    v45 = (v44 + 32) & ~v44;
    v39 = swift_allocObject(v41, v45 + *(_QWORD *)(v43 + 72), v44 | 7);
    *(_OWORD *)(v39 + 16) = xmmword_1000349A0;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v43 + 104))(v39 + v45, enum case for ActivityPresentationOptions.ActivityPresentationDestination.lockscreen(_:), v42);
  }
  ActivityPresentationOptions.init(destinations:)(v39);
  v46 = (uint64_t *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v89, 0, 0);
  v47 = *v46;
  sub_1000088F0(&qword_10004FB78);
  v90 = v47;
  v48 = type metadata accessor for Date(0);
  v49 = v79;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v79, 1, 1, v48);
  v50 = sub_1000154F8();
  v51 = sub_100015540();
  v52 = sub_100015588();
  v53 = swift_bridgeObjectRetain(v47);
  v54 = v50;
  v55 = v81;
  ActivityContent.init(state:staleDate:relevanceScore:)(v53, v49, &type metadata for BackgroundActivityAttributes.ContentState, v54, v51, v52, 0.0);
  v56 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)(&v90, v55, v11, 0xD00000000000002DLL, 0x800000010003A710, 1, &_swiftEmptyArrayStorage, 1, 0);
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v82 + 8))(v55, v83);
    v9[1](v11, v8);
    swift_bridgeObjectRelease(v47);
    swift_errorRetain(v2);
    v57 = swift_errorRetain(v2);
    v58 = Logger.logObject.getter(v57);
    v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc(12, -1);
      v61 = swift_slowAlloc(32, -1);
      v90 = v61;
      *(_DWORD *)v60 = 136315138;
      swift_getErrorValue(v2, v88, v87);
      v62 = Error.localizedDescription.getter(v87[1], v87[2]);
      v64 = v63;
      v86 = sub_10002785C(v62, v63, &v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, v87);
      swift_bridgeObjectRelease(v64);
      swift_errorRelease(v2);
      swift_errorRelease(v2);
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Error requesting activity %s", v60, 0xCu);
      swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v61, -1, -1);
      swift_slowDealloc(v60, -1, -1);
    }
    else
    {
      swift_errorRelease(v2);
      swift_errorRelease(v2);
    }

    swift_willThrow();
  }
  else
  {
    v79 = (char *)v9;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v55, v83);
    swift_bridgeObjectRelease(v47);
    v65 = swift_retain_n(v56, 2);
    v66 = Logger.logObject.getter(v65);
    v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc(12, -1);
      v69 = swift_slowAlloc(32, -1);
      v78 = v8;
      v70 = v69;
      v90 = v69;
      *(_DWORD *)v68 = 136315138;
      v71 = Activity.id.getter(v69);
      v73 = v72;
      v86 = sub_10002785C(v71, v72, &v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, v87);
      swift_release_n(v56, 2);
      swift_bridgeObjectRelease(v73);
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Requested activity successfully: %s", v68, 0xCu);
      swift_arrayDestroy(v70, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v70, -1, -1);
      swift_slowDealloc(v68, -1, -1);

      (*((void (**)(char *, uint64_t))v79 + 1))(v84, v78);
    }
    else
    {
      swift_release_n(v56, 2);

      (*((void (**)(char *, uint64_t))v79 + 1))(v84, v8);
    }
  }
  return v56;
}

void sub_100012788(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t KeyPath;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  void *v84;
  char *v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t, uint64_t);
  uint64_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  _QWORD *v112;
  char *v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  char v125[24];
  void *v126;
  id aBlock[5];
  uint64_t v128;
  uint64_t v129;
  char v130[8];

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v113 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v120 - 8);
  __chkstk_darwin(v120);
  v119 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = (_QWORD *)type metadata accessor for DispatchTimeInterval(0);
  v111 = *(v112 - 1);
  __chkstk_darwin(v112);
  v110 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = type metadata accessor for DispatchTime(0);
  v109 = *(_QWORD *)(v118 - 8);
  v10 = __chkstk_darwin(v118);
  v116 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v117 = (char *)&v103 - v12;
  v13 = sub_1000088F0(&qword_10004FB20);
  __chkstk_darwin(v13);
  v123 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for UUID(0);
  v124 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v115 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = v17;
  __chkstk_darwin(v16);
  v122 = (char *)&v103 - v18;
  KeyPath = swift_getKeyPath(&unk_100035C30);
  v20 = swift_getKeyPath(&unk_100035C58);
  static Published.subscript.getter(aBlock, v2, KeyPath, v20);
  swift_release(KeyPath);
  swift_release(v20);
  v21 = aBlock[0];
  sub_10000BF98(0, &qword_10004F790, NSProgress_ptr);
  LOBYTE(v20) = static NSObject.== infix(_:_:)(v21, a1);

  if ((v20 & 1) != 0)
    return;
  if (qword_10004ECF0 != -1)
    swift_once(&qword_10004ECF0, sub_100010924);
  v22 = type metadata accessor for Logger(0);
  v23 = sub_100008930(v22, (uint64_t)qword_10004F6F0);
  swift_retain_n(v2, 2);
  v24 = a1;
  v106 = (uint8_t *)v23;
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.info.getter();
  v27 = os_log_type_enabled(v25, v26);
  v108 = v7;
  v121 = v15;
  if (v27)
  {
    v28 = swift_slowAlloc(22, -1);
    v29 = (_QWORD *)swift_slowAlloc(8, -1);
    v104 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc(32, -1);
    aBlock[0] = v104;
    *(_DWORD *)v28 = 136315394;
    v107 = v5;
    v105 = v4;
    v30 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v125, 0, 0);
    v31 = *v30;
    v32 = swift_bridgeObjectRetain(v31);
    v33 = Array.description.getter(v32, v15);
    v35 = v34;
    swift_bridgeObjectRelease(v31);
    v129 = sub_10002785C(v33, v35, (uint64_t *)aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130);
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v35);
    *(_WORD *)(v28 + 12) = 2112;
    v129 = (uint64_t)v24;
    v36 = v24;
    v4 = v105;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v129, v130);
    *v29 = v24;

    v5 = v107;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Updating progress for task identifiers %s to: %@", (uint8_t *)v28, 0x16u);
    v37 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v29, 1, v37);
    swift_slowDealloc(v29, -1, -1);
    v38 = v104;
    swift_arrayDestroy(v104, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v28, -1, -1);

  }
  else
  {

    swift_release_n(v2, 2);
  }
  v39 = swift_getKeyPath(&unk_100035C30);
  v40 = swift_getKeyPath(&unk_100035C58);
  static Published.subscript.getter(aBlock, v2, v39, v40);
  swift_release(v39);
  swift_release(v40);
  v41 = aBlock[0];
  objc_msgSend(aBlock[0], "setTotalUnitCount:", objc_msgSend(v24, "totalUnitCount"));

  v42 = swift_getKeyPath(&unk_100035C30);
  v43 = swift_getKeyPath(&unk_100035C58);
  static Published.subscript.getter(aBlock, v2, v42, v43);
  swift_release(v42);
  swift_release(v43);
  v44 = aBlock[0];
  objc_msgSend(aBlock[0], "setCompletedUnitCount:", objc_msgSend(v24, "completedUnitCount"));

  LOBYTE(v44) = sub_1000119C8();
  v45 = swift_getKeyPath(&unk_100035B10);
  v46 = swift_getKeyPath(&unk_100035B38);
  LOBYTE(aBlock[0]) = v44 & 1;
  swift_retain(v2);
  static Published.subscript.setter(aBlock, v2, v45, v46);
  v47 = type metadata accessor for BackgroundActivitySession(0);
  v48 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  v49 = ObservableObject<>.objectWillChange.getter(v47, v48);
  ObservableObjectPublisher.send()();
  swift_release(v49);
  if (qword_10004ED08 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  v50 = qword_100050B18;
  v51 = swift_getKeyPath(&unk_100035C78);
  v52 = swift_getKeyPath(&unk_100035CA0);
  static Published.subscript.getter(aBlock, v50, v51, v52);
  swift_release(v51);
  swift_release(v52);
  v53 = aBlock[0];
  if (*((_QWORD *)aBlock[0] + 2))
  {
    v55 = *(_QWORD *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
    v54 = *(_QWORD *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
    swift_bridgeObjectRetain(v54);
    v56 = sub_100027FC8(v55, v54);
    if ((v57 & 1) != 0)
    {
      v58 = *(_QWORD *)(v53[7] + 8 * v56);
      swift_retain(v58);
      swift_bridgeObjectRelease(v54);
      swift_bridgeObjectRelease(v53);
      v59 = sub_100014D10();
      v60 = swift_getKeyPath(&unk_100035B10);
      v61 = swift_getKeyPath(&unk_100035B38);
      LOBYTE(aBlock[0]) = v59 & 1;
      swift_retain(v58);
      static Published.subscript.setter(aBlock, v58, v60, v61);
      v62 = ObservableObject<>.objectWillChange.getter(v47, v48);
      ObservableObjectPublisher.send()();
      swift_release(v58);
      swift_release(v62);
      goto LABEL_14;
    }
    swift_bridgeObjectRelease(v54);
  }
  swift_bridgeObjectRelease(v53);
LABEL_14:
  v63 = objc_msgSend(v24, "isFinished");
  v64 = v108;
  v65 = v121;
  if (((v63 & 1) != 0 || objc_msgSend(v24, "isCancelled"))
    && (*(_BYTE *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) & 1) == 0)
  {
    v66 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, &v129, 0, 0);
    v67 = *v66;
    if (*(_QWORD *)(*v66 + 16))
    {
      v107 = v5;
      v69 = (uint64_t)v123;
      v68 = v124;
      v70 = *(unsigned __int8 *)(v124 + 80);
      v71 = *(void (**)(char *, uint64_t, uint64_t))(v124 + 16);
      v71(v123, v67 + ((v70 + 32) & ~v70), v65);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v68 + 56))(v69, 0, 1, v65);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v69, 1, v65) != 1)
      {
        v104 = v71;
        v103 = ~v70;
        v123 = *(char **)(v68 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v123)(v122, v69, v65);
        v72 = swift_retain_n(v2, 2);
        v73 = Logger.logObject.getter(v72);
        v74 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v73, v74))
        {
          v75 = (uint8_t *)swift_slowAlloc(12, -1);
          v76 = (void *)swift_slowAlloc(32, -1);
          v105 = v4;
          v77 = v76;
          aBlock[0] = v76;
          *(_DWORD *)v75 = 136315138;
          v106 = v75 + 4;
          v78 = *v66;
          v79 = swift_bridgeObjectRetain(v78);
          v80 = Array.description.getter(v79, v121);
          v82 = v81;
          swift_bridgeObjectRelease(v78);
          v126 = (void *)sub_10002785C(v80, v82, (uint64_t *)aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, aBlock);
          swift_release_n(v2, 2);
          v83 = v82;
          v64 = v108;
          swift_bridgeObjectRelease(v83);
          _os_log_impl((void *)&_mh_execute_header, v73, v74, "Progress completed for task identifiers %s", v75, 0xCu);
          swift_arrayDestroy(v77, 1, (char *)&type metadata for Any + 8);
          v84 = v77;
          v4 = v105;
          swift_slowDealloc(v84, -1, -1);
          swift_slowDealloc(v75, -1, -1);

        }
        else
        {

          swift_release_n(v2, 2);
        }
        v85 = v113;
        v86 = v112;
        v87 = v111;
        v88 = v110;
        v89 = v109;
        sub_10000BF98(0, (unint64_t *)&qword_10004FB48, OS_dispatch_queue_ptr);
        v113 = (char *)static OS_dispatch_queue.main.getter();
        v90 = v116;
        static DispatchTime.now()();
        *v88 = 500;
        (*(void (**)(_QWORD *, _QWORD, _QWORD *))(v87 + 104))(v88, enum case for DispatchTimeInterval.milliseconds(_:), v86);
        v91 = v117;
        + infix(_:_:)(v90, v88);
        (*(void (**)(_QWORD *, _QWORD *))(v87 + 8))(v88, v86);
        v112 = *(_QWORD **)(v89 + 8);
        v92 = v118;
        ((void (*)(char *, uint64_t))v112)(v90, v118);
        v93 = v115;
        v94 = v121;
        v104(v115, (uint64_t)v122, v121);
        v95 = (v70 + 16) & v103;
        v96 = swift_allocObject(&unk_100045DC0, v95 + v114, v70 | 7);
        ((void (*)(uint64_t, char *, uint64_t))v123)(v96 + v95, v93, v94);
        aBlock[4] = sub_100016920;
        v128 = v96;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1000134A0;
        aBlock[3] = &unk_100045DD8;
        v97 = _Block_copy(aBlock);
        v98 = v119;
        static DispatchQoS.unspecified.getter();
        v126 = &_swiftEmptyArrayStorage;
        v99 = sub_1000067D0(&qword_10004FB50, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v100 = sub_1000088F0(&qword_10004FB58);
        v101 = sub_100016964();
        dispatch thunk of SetAlgebra.init<A>(_:)(&v126, v100, v101, v4, v99);
        v102 = v113;
        OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v91, v98, v85, v97);
        _Block_release(v97);

        (*(void (**)(char *, uint64_t))(v107 + 8))(v85, v4);
        (*(void (**)(char *, uint64_t))(v64 + 8))(v98, v120);
        ((void (*)(char *, uint64_t))v112)(v91, v92);
        (*(void (**)(char *, uint64_t))(v124 + 8))(v122, v94);
        swift_release(v128);
        return;
      }
    }
    else
    {
      v69 = (uint64_t)v123;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v124 + 56))(v123, 1, 1, v65);
    }
    sub_1000164F8(v69, &qword_10004FB20);
  }
}

uint64_t sub_10001344C(uint64_t a1)
{
  if (qword_10004ED08 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  return sub_100017C34(a1);
}

uint64_t sub_1000134A0(uint64_t a1)
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

uint64_t sub_1000134CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  KeyPath = swift_getKeyPath(&unk_100035BA0);
  v10 = swift_getKeyPath(&unk_100035BC8);
  static Published.subscript.getter(&v23, v4, KeyPath, v10);
  swift_release(KeyPath);
  swift_release(v10);
  v11 = v24;
  if (v23 == a1 && v24 == a2)
  {
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a1, a2, 0);
    swift_bridgeObjectRelease(v11);
    if ((v13 & 1) == 0)
    {
LABEL_12:
      v19 = swift_getKeyPath(&unk_100035BA0);
      v20 = swift_getKeyPath(&unk_100035BC8);
      v23 = a1;
      v24 = a2;
      swift_bridgeObjectRetain(a2);
      swift_retain(v4);
      static Published.subscript.setter(&v23, v4, v19, v20);
      v21 = swift_getKeyPath(&unk_100035BE8);
      v22 = swift_getKeyPath(&unk_100035C10);
      v23 = a3;
      v24 = a4;
      swift_retain(v4);
      swift_bridgeObjectRetain(a4);
      return static Published.subscript.setter(&v23, v4, v21, v22);
    }
  }
  v14 = swift_getKeyPath(&unk_100035BE8);
  v15 = swift_getKeyPath(&unk_100035C10);
  static Published.subscript.getter(&v23, v4, v14, v15);
  swift_release(v14);
  swift_release(v15);
  v16 = v24;
  if (v23 == a3 && v24 == a4)
    return swift_bridgeObjectRelease(a4);
  v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a3, a4, 0);
  result = swift_bridgeObjectRelease(v16);
  if ((v18 & 1) == 0)
    goto LABEL_12;
  return result;
}

char *sub_1000136B0(uint64_t a1, uint64_t a2)
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
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  char *result;
  unint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
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
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  _BYTE v56[16];
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _BYTE v61[24];

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v54 - v11;
  v13 = (uint64_t *)(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess(v3 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v61, 0, 0);
  v14 = *v13;
  v57 = a1;
  swift_bridgeObjectRetain(v14);
  v15 = sub_100015C34((uint64_t (*)(char *))sub_100016534, (_BOOL8)v56, v14);
  result = (char *)swift_bridgeObjectRelease(v14);
  if (!v15)
  {
    v54 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v54(v12, a1, v6);
    swift_beginAccess(v13, &v59, 33, 0);
    v17 = *v13;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v13);
    *v13 = v17;
    v55 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v17 = sub_100015A2C(0, *(_QWORD *)(v17 + 16) + 1, 1, v17);
      *v13 = v17;
    }
    v20 = *(_QWORD *)(v17 + 16);
    v19 = *(_QWORD *)(v17 + 24);
    if (v20 >= v19 >> 1)
    {
      v17 = sub_100015A2C(v19 > 1, v20 + 1, 1, v17);
      *v13 = v17;
    }
    *(_QWORD *)(v17 + 16) = v20 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v20, v12, v6);
    swift_endAccess(&v59);
    if (qword_10004ECF0 != -1)
      swift_once(&qword_10004ECF0, sub_100010924);
    v21 = type metadata accessor for Logger(0);
    sub_100008930(v21, (uint64_t)qword_10004F6F0);
    v22 = ((uint64_t (*)(char *, uint64_t, uint64_t))v54)(v10, a1, v6);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = (void *)swift_slowAlloc(32, -1);
      v59 = v26;
      *(_DWORD *)v25 = 136315138;
      v54 = (void (*)(char *, uint64_t, uint64_t))(v25 + 4);
      v27 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v28 = dispatch thunk of CustomStringConvertible.description.getter(v6, v27);
      v30 = v29;
      v58 = sub_10002785C(v28, v29, (uint64_t *)&v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59);
      swift_bridgeObjectRelease(v30);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Updating Jindo with new task identifier: %s", v25, 0xCu);
      swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }

    v31 = v55;
    v32 = (void *)sub_10001442C();
    v34 = v33;
    v36 = v35;
    v38 = v37;
    KeyPath = swift_getKeyPath(&unk_100035BA0);
    v40 = swift_getKeyPath(&unk_100035BC8);
    v59 = v32;
    v60 = v34;
    swift_retain(v3);
    static Published.subscript.setter(&v59, v3, KeyPath, v40);
    v41 = swift_getKeyPath(&unk_100035BE8);
    v42 = swift_getKeyPath(&unk_100035C10);
    v59 = v36;
    v60 = v38;
    swift_retain(v3);
    static Published.subscript.setter(&v59, v3, v41, v42);
    v43 = swift_getKeyPath(&unk_100035C30);
    v44 = swift_getKeyPath(&unk_100035C58);
    static Published.subscript.getter(&v59, v3, v43, v44);
    swift_release(v43);
    swift_release(v44);
    v45 = v59;
    result = (char *)objc_msgSend(v59, "totalUnitCount");
    if (__OFADD__(result, 1))
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v45, "setTotalUnitCount:", result + 1);

      v46 = swift_getKeyPath(&unk_100035C30);
      v47 = swift_getKeyPath(&unk_100035C58);
      static Published.subscript.getter(&v59, v3, v46, v47);
      swift_release(v46);
      swift_release(v47);
      v48 = v59;
      objc_msgSend(v59, "addChild:withPendingUnitCount:", v31, 1);

      LOBYTE(v48) = sub_100014D10();
      v49 = swift_getKeyPath(&unk_100035B10);
      v50 = swift_getKeyPath(&unk_100035B38);
      LOBYTE(v59) = v48 & 1;
      swift_retain(v3);
      static Published.subscript.setter(&v59, v3, v49, v50);
      v51 = type metadata accessor for BackgroundActivitySession(0);
      v52 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
      v53 = ObservableObject<>.objectWillChange.getter(v51, v52);
      ObservableObjectPublisher.send()();
      return (char *)swift_release(v53);
    }
  }
  return result;
}

void sub_100013C20(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  void *v47;
  int v48;
  _BYTE v49[16];
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  _BYTE v54[24];

  v3 = v2;
  v48 = a2;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess(v2 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v54, 0, 0);
  v10 = *v9;
  v50 = a1;
  swift_bridgeObjectRetain(v10);
  v11 = sub_100015C34((uint64_t (*)(char *))sub_100016534, (_BOOL8)v49, v10);
  v12 = swift_bridgeObjectRelease(v10);
  if (!v11)
    return;
  __chkstk_darwin(v12);
  v46[-2] = a1;
  swift_beginAccess(v9, &v52, 33, 0);
  v13 = sub_100015E5C((uint64_t (*)(unint64_t))sub_10001654C, (uint64_t)&v46[-4]);
  v14 = *(_QWORD *)(*v9 + 16);
  if (v14 < v13)
  {
    __break(1u);
  }
  else
  {
    sub_100016690(v13, v14);
    swift_endAccess(&v52);
    if (qword_10004ECF0 == -1)
      goto LABEL_4;
  }
  swift_once(&qword_10004ECF0, sub_100010924);
LABEL_4:
  v15 = type metadata accessor for Logger(0);
  sub_100008930(v15, (uint64_t)qword_10004F6F0);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    v47 = (void *)swift_slowAlloc(32, -1);
    v52 = v47;
    *(_DWORD *)v19 = 136315138;
    v46[1] = v19 + 4;
    v20 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v21 = dispatch thunk of CustomStringConvertible.description.getter(v5, v20);
    v23 = v22;
    v51 = sub_10002785C(v21, v22, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Updating Jindo with removed task identifier: %s", v19, 0xCu);
    v24 = v47;
    swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  if (*(_QWORD *)(*v9 + 16))
  {
    v25 = (void *)sub_10001442C();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    KeyPath = swift_getKeyPath(&unk_100035BA0);
    v33 = swift_getKeyPath(&unk_100035BC8);
    v52 = v25;
    v53 = v27;
    swift_retain(v3);
    static Published.subscript.setter(&v52, v3, KeyPath, v33);
    v34 = swift_getKeyPath(&unk_100035BE8);
    v35 = swift_getKeyPath(&unk_100035C10);
    v52 = v29;
    v53 = v31;
    swift_retain(v3);
    static Published.subscript.setter(&v52, v3, v34, v35);
    if ((v48 & 1) != 0)
    {
      v36 = swift_getKeyPath(&unk_100035C30);
      v37 = swift_getKeyPath(&unk_100035C58);
      static Published.subscript.getter(&v52, v3, v36, v37);
      swift_release(v36);
      swift_release(v37);
      v38 = v52;
      v39 = (char *)objc_msgSend(v52, "totalUnitCount");
      if (__OFSUB__(v39, 1))
      {
        __break(1u);
        return;
      }
      objc_msgSend(v38, "setTotalUnitCount:", v39 - 1);

    }
    v40 = sub_100014D10();
    v41 = swift_getKeyPath(&unk_100035B10);
    v42 = swift_getKeyPath(&unk_100035B38);
    LOBYTE(v52) = v40 & 1;
    swift_retain(v3);
    static Published.subscript.setter(&v52, v3, v41, v42);
    v43 = type metadata accessor for BackgroundActivitySession(0);
    v44 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
    v45 = ObservableObject<>.objectWillChange.getter(v43, v44);
    ObservableObjectPublisher.send()();
    swift_release(v45);
  }
}

uint64_t sub_1000140C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = v0;
  v2 = type metadata accessor for ActivityUIDismissalPolicy(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000088F0(&qword_10004FB30);
  result = __chkstk_darwin(v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity;
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_activity);
  if (v11)
  {
    v12 = qword_10004ECF0;
    swift_retain(v11);
    if (v12 != -1)
      swift_once(&qword_10004ECF0, sub_100010924);
    v13 = type metadata accessor for Logger(0);
    sub_100008930(v13, (uint64_t)qword_10004F6F0);
    swift_retain_n(v11, 2);
    v14 = swift_retain_n(v1, 2);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc(22, -1);
      v40 = v3;
      v19 = v18;
      v20 = swift_slowAlloc(64, -1);
      v39 = v20;
      v45 = v20;
      *(_DWORD *)v19 = 136315394;
      v41 = v2;
      v38 = v17;
      v21 = Activity.id.getter(v20);
      v23 = v22;
      v43 = sub_10002785C(v21, v22, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      swift_release_n(v11, 2);
      swift_bridgeObjectRelease(v23);
      *(_WORD *)(v19 + 12) = 2080;
      v37 = v19 + 14;
      v24 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
      swift_beginAccess(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, &v43, 0, 0);
      v25 = *v24;
      v26 = type metadata accessor for UUID(0);
      v27 = swift_bridgeObjectRetain(v25);
      v28 = Array.description.getter(v27, v26);
      v30 = v29;
      v31 = v25;
      v2 = v41;
      swift_bridgeObjectRelease(v31);
      v42 = sub_10002785C(v28, v30, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43);
      swift_release_n(v1, 2);
      swift_bridgeObjectRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v38, "Ending activity %s for task identifiers: %s", (uint8_t *)v19, 0x16u);
      v32 = v39;
      swift_arrayDestroy(v39, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      v33 = v19;
      v3 = v40;
      swift_slowDealloc(v33, -1, -1);

    }
    else
    {

      swift_release_n(v1, 2);
      swift_release_n(v11, 2);
    }
    v34 = sub_1000088F0(&qword_10004FB38);
    v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v9, 1, 1, v34);
    static ActivityUIDismissalPolicy.immediate.getter(v35);
    dispatch thunk of Activity.endSync(_:dismissalPolicy:)(v9, v5);
    swift_release(v11);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_1000164F8((uint64_t)v9, &qword_10004FB30);
    v36 = *(_QWORD *)(v1 + v10);
    *(_QWORD *)(v1 + v10) = 0;
    return swift_release(v36);
  }
  return result;
}

uint64_t sub_10001442C()
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
  char *v10;
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
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  char v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char isUniquelyReferenced_nonNull_native;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;

  v1 = v0;
  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000088F0(&qword_10004FB20);
  __chkstk_darwin(v8);
  v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) == 1)
  {
    v15 = v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers;
    swift_beginAccess(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, &v63, 0, 0);
    if (*(_QWORD *)(*(_QWORD *)v15 + 16) != 1)
      goto LABEL_12;
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v10, *(_QWORD *)v15 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      sub_1000164F8((uint64_t)v10, &qword_10004FB20);
      goto LABEL_12;
    }
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    if (qword_10004ED08 != -1)
      swift_once(&qword_10004ED08, sub_100018C5C);
    v21 = qword_100050B18;
    KeyPath = swift_getKeyPath(&unk_100035B58);
    v23 = swift_getKeyPath(&unk_100035B80);
    static Published.subscript.getter(&v62, v21, KeyPath, v23);
    swift_release(KeyPath);
    swift_release(v23);
    v24 = v62;
    if (!*(_QWORD *)(v62 + 16) || (v25 = sub_1000280CC((uint64_t)v14), (v26 & 1) == 0))
    {
      swift_bridgeObjectRelease(v24);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_12:
      if (qword_10004ECF8 != -1)
        swift_once(&qword_10004ECF8, sub_100010E20);
      v32 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      v33 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      v34 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_beginAccess(&off_10004F708, &v62, 32, 0);
      v35 = off_10004F708;
      if (*((_QWORD *)off_10004F708 + 2))
      {
        swift_bridgeObjectRetain(v34);
        v36 = sub_100027FC8(v33, v34);
        if ((v37 & 1) != 0)
        {
          v38 = (uint64_t *)(v35[7] + 16 * v36);
          v18 = *v38;
          v39 = v38[1];
          swift_endAccess(&v62);
          swift_bridgeObjectRetain(v39);
          swift_bridgeObjectRelease(v34);
LABEL_19:
          v51 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000025, 0x800000010003A5A0);
          static Locale.current.getter(v51);
          v52 = String.init(localized:table:bundle:locale:comment:)(v7, 0, 0, 0, v4, 0, 0, 256);
          v54 = v53;
          v55 = sub_1000088F0(&qword_10004FB28);
          v56 = swift_allocObject(v55, 72, 7);
          *(_OWORD *)(v56 + 16) = xmmword_1000349A0;
          v57 = *(_QWORD *)(*(_QWORD *)v15 + 16);
          *(_QWORD *)(v56 + 56) = &type metadata for Int;
          *(_QWORD *)(v56 + 64) = &protocol witness table for Int;
          *(_QWORD *)(v56 + 32) = v57;
          static String.localizedStringWithFormat(_:_:)(v52, v54, v56);
          swift_bridgeObjectRelease(v56);
          swift_bridgeObjectRelease(v54);
          return v18;
        }
        swift_bridgeObjectRelease(v34);
      }
      v60 = v15;
      swift_endAccess(&v62);
      v40 = *v32;
      v41 = v32[1];
      v42 = objc_allocWithZone((Class)LSApplicationRecord);
      swift_bridgeObjectRetain(v41);
      v43 = sub_100015954(v40, v41, 1);
      v44 = objc_msgSend(v43, "localizedName");
      v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      v46 = v45;

      v47 = *v32;
      v48 = v32[1];
      swift_beginAccess(&off_10004F708, &v62, 33, 0);
      swift_bridgeObjectRetain(v48);
      swift_bridgeObjectRetain(v46);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(off_10004F708);
      v61 = off_10004F708;
      off_10004F708 = (_UNKNOWN *)0x8000000000000000;
      sub_10001F1B8(v18, v46, v47, v48, isUniquelyReferenced_nonNull_native);
      v50 = off_10004F708;
      off_10004F708 = v61;
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease(v50);
      swift_endAccess(&v62);

      v15 = v60;
      goto LABEL_19;
    }
    v27 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v25);
    swift_retain(v27);
    swift_bridgeObjectRelease(v24);
    v28 = swift_getKeyPath(&unk_100035BA0);
    v29 = swift_getKeyPath(&unk_100035BC8);
    static Published.subscript.getter(&v62, v27, v28, v29);
    swift_release(v28);
    swift_release(v29);
    v18 = v62;
    v30 = swift_getKeyPath(&unk_100035BE8);
    v31 = swift_getKeyPath(&unk_100035C10);
    static Published.subscript.getter(&v62, v27, v30, v31);
    swift_release(v27);
    swift_release(v30);
    swift_release(v31);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v16 = swift_getKeyPath(&unk_100035BA0);
    v17 = swift_getKeyPath(&unk_100035BC8);
    static Published.subscript.getter(&v63, v1, v16, v17);
    swift_release(v16);
    swift_release(v17);
    v18 = v63;
    v19 = swift_getKeyPath(&unk_100035BE8);
    v20 = swift_getKeyPath(&unk_100035C10);
    static Published.subscript.getter(&v63, v1, v19, v20);
    swift_release(v19);
    swift_release(v20);
  }
  return v18;
}

uint64_t sub_100014D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *KeyPath;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t *, uint64_t);
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[24];

  v1 = sub_1000088F0(&qword_10004FB20);
  v2 = __chkstk_darwin(v1);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v46 - v5;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  KeyPath = (char *)&v46 - v12;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession) == 1)
  {
    v14 = (uint64_t *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
    swift_beginAccess(v0 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v51, 0, 0);
    if (*(_QWORD *)(*v14 + 16) == 1)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *v14 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(KeyPath, v6, v7);
        if (qword_10004ED08 == -1)
          goto LABEL_7;
        goto LABEL_44;
      }
      sub_1000164F8((uint64_t)v6, &qword_10004FB20);
    }
    while (1)
    {
      v25 = *v14;
      v50 = (uint64_t)&_swiftEmptyArrayStorage;
      v26 = *(_QWORD *)(v25 + 16);
      v46 = v25;
      if (v26)
      {
        v14 = (uint64_t *)(v25
                        + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)));
        v27 = *(void (**)(char *, uint64_t *, uint64_t))(v8 + 16);
        v47 = *(_QWORD *)(v8 + 72);
        v48 = v27;
        swift_bridgeObjectRetain_n(v25, 2);
        while (1)
        {
          v48(v4, v14, v7);
          v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
          v28(v4, 0, 1, v7);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
            break;
          (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v4, v7);
          if (qword_10004ED08 != -1)
            swift_once(&qword_10004ED08, sub_100018C5C);
          v29 = qword_100050B18;
          KeyPath = (char *)swift_getKeyPath(&unk_100035B58);
          v30 = swift_getKeyPath(&unk_100035B80);
          static Published.subscript.getter(&v49, v29, KeyPath, v30);
          swift_release(KeyPath);
          swift_release(v30);
          v31 = v49;
          if (*(_QWORD *)(v49 + 16) && (v32 = sub_1000280CC((uint64_t)v11), (v33 & 1) != 0))
          {
            KeyPath = *(char **)(*(_QWORD *)(v31 + 56) + 8 * v32);
            swift_retain(KeyPath);
            swift_bridgeObjectRelease(v31);
            v34 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v34);
            v36 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
            v35 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18);
            if (v36 >= v35 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1);
            v37 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, KeyPath);
            specialized Array._endMutation()(v37);
          }
          else
          {
            swift_bridgeObjectRelease(v31);
            (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
          }
          v14 = (uint64_t *)((char *)v14 + v47);
          if (!--v26)
            goto LABEL_24;
        }
      }
      else
      {
        v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
        swift_bridgeObjectRetain_n(v25, 2);
LABEL_24:
        v28(v4, 1, 1, v7);
      }
      v38 = v46;
      swift_bridgeObjectRelease(v46);
      v7 = v50;
      swift_bridgeObjectRelease(v38);
      if ((unint64_t)v7 >> 62)
      {
        if (v7 < 0)
          v44 = v7;
        else
          v44 = v7 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v7);
        v39 = _CocoaArrayWrapper.endIndex.getter(v44);
        if (!v39)
        {
LABEL_41:
          swift_bridgeObjectRelease_n(v7, 2);
          return 1;
        }
      }
      else
      {
        v39 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v7);
        if (!v39)
          goto LABEL_41;
      }
      if (v39 >= 1)
        break;
      __break(1u);
LABEL_44:
      swift_once(&qword_10004ED08, sub_100018C5C);
LABEL_7:
      v16 = qword_100050B18;
      v17 = swift_getKeyPath(&unk_100035B58);
      v18 = swift_getKeyPath(&unk_100035B80);
      static Published.subscript.getter(&v50, v16, v17, v18);
      swift_release(v17);
      swift_release(v18);
      v19 = v50;
      if (*(_QWORD *)(v50 + 16))
      {
        v20 = sub_1000280CC((uint64_t)KeyPath);
        if ((v21 & 1) != 0)
        {
          v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
          swift_retain(v22);
          swift_bridgeObjectRelease(v19);
          v23 = swift_getKeyPath(&unk_100035B10);
          v24 = swift_getKeyPath(&unk_100035B38);
          static Published.subscript.getter(&v50, v22, v23, v24);
          swift_release(v22);
          swift_release(v23);
          swift_release(v24);
          v15 = v50;
          (*(void (**)(char *, uint64_t))(v8 + 8))(KeyPath, v7);
          return v15;
        }
      }
      swift_bridgeObjectRelease(v19);
      (*(void (**)(char *, uint64_t))(v8 + 8))(KeyPath, v7);
    }
    v40 = 0;
    LOBYTE(v15) = 1;
    while (1)
    {
      if ((v7 & 0xC000000000000001) != 0)
      {
        v41 = specialized _ArrayBuffer._getElementSlowPath(_:)(v40, v7);
        if ((v15 & 1) != 0)
          goto LABEL_35;
      }
      else
      {
        v41 = *(_QWORD *)(v7 + 8 * v40 + 32);
        swift_retain(v41);
        if ((v15 & 1) != 0)
        {
LABEL_35:
          v42 = swift_getKeyPath(&unk_100035B10);
          v43 = swift_getKeyPath(&unk_100035B38);
          static Published.subscript.getter(&v50, v41, v42, v43);
          swift_release(v41);
          swift_release(v42);
          swift_release(v43);
          v15 = v50;
          goto LABEL_30;
        }
      }
      swift_release(v41);
      v15 = 0;
LABEL_30:
      if (v39 == ++v40)
      {
        swift_bridgeObjectRelease_n(v7, 2);
        return v15;
      }
    }
  }
  return 0;
}

void sub_100015300(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10004F788)
  {
    v2 = sub_10000BF98(255, &qword_10004F790, NSProgress_ptr);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10004F788);
  }
}

void sub_100015364(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10004F798)
  {
    v2 = sub_100008B84(&qword_10004F7A0);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10004F798);
  }
}

void sub_1000153BC(uint64_t a1, unint64_t *a2, uint64_t a3)
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

void sub_100015400(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10004F7B0)
  {
    v2 = type metadata accessor for APKDeviceLockState(255);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10004F7B0);
  }
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes()
{
  return &type metadata for BackgroundActivityAttributes;
}

unint64_t sub_100015468()
{
  unint64_t result;

  result = qword_10004FA88;
  if (!qword_10004FA88)
  {
    result = swift_getWitnessTable(&unk_100035948, &type metadata for BackgroundActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_10004FA88);
  }
  return result;
}

unint64_t sub_1000154B0()
{
  unint64_t result;

  result = qword_10004FA90;
  if (!qword_10004FA90)
  {
    result = swift_getWitnessTable(&unk_100035920, &type metadata for BackgroundActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_10004FA90);
  }
  return result;
}

unint64_t sub_1000154F8()
{
  unint64_t result;

  result = qword_10004FA98;
  if (!qword_10004FA98)
  {
    result = swift_getWitnessTable(&unk_100035A50, &type metadata for BackgroundActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10004FA98);
  }
  return result;
}

unint64_t sub_100015540()
{
  unint64_t result;

  result = qword_10004FAA0;
  if (!qword_10004FAA0)
  {
    result = swift_getWitnessTable(&unk_100035A28, &type metadata for BackgroundActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10004FAA0);
  }
  return result;
}

unint64_t sub_100015588()
{
  unint64_t result;

  result = qword_10004FAA8;
  if (!qword_10004FAA8)
  {
    result = swift_getWitnessTable(&unk_1000359C0, &type metadata for BackgroundActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10004FAA8);
  }
  return result;
}

unint64_t sub_1000155D0()
{
  unint64_t result;

  result = qword_10004FAB0;
  if (!qword_10004FAB0)
  {
    result = swift_getWitnessTable(&unk_100035A00, &type metadata for BackgroundActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10004FAB0);
  }
  return result;
}

uint64_t sub_100015614()
{
  return sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
}

uint64_t sub_100015640@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for BackgroundActivitySession(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001567C()
{
  return sub_1000110A8();
}

uint64_t sub_10001569C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id;
  v4 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void *sub_1000156E4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000156F0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *sub_100015710(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100015734()
{
  unint64_t result;

  result = qword_10004FAC0;
  if (!qword_10004FAC0)
  {
    result = swift_getWitnessTable(&unk_100035F08, &type metadata for BackgroundActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FAC0);
  }
  return result;
}

uint64_t sub_100015778@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100035D50);
  v5 = swift_getKeyPath(&unk_100035D78);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_1000157F4(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100035D50);
  v5 = swift_getKeyPath(&unk_100035D78);
  v8 = v2;
  v6 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_100015868@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100035B10);
  v5 = swift_getKeyPath(&unk_100035B38);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_1000158E4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100035B10);
  v5 = swift_getKeyPath(&unk_100035B38);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

id sub_100015954(uint64_t a1, uint64_t a2, char a3)
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

uint64_t sub_100015A2C(char a1, int64_t a2, char a3, unint64_t a4)
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
  v10 = sub_1000088F0(&qword_10004FB10);
  v11 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
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
  v18 = type metadata accessor for UUID(0);
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
    sub_100016578(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

BOOL sub_100015C34(uint64_t (*a1)(char *), _BOOL8 a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  int v16;
  BOOL v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  _BOOL8 v31;
  uint64_t (*v32)(char *);
  uint64_t v33;

  v4 = v3;
  v31 = a2;
  v32 = a1;
  v33 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000088F0(&qword_10004FB20);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 + 16);
  if (v12)
  {
    v13 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v28 = *(_QWORD *)(v6 + 72);
    v29 = v8;
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v26 = a3;
    swift_bridgeObjectRetain(a3);
    while (1)
    {
      v14 = v33;
      v30(v11, v13, v33);
      v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v15(v11, 0, 1, v14);
      v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v14);
      v17 = v16 != 1;
      if (v16 == 1)
      {
        a3 = v26;
        goto LABEL_13;
      }
      v27 = 1;
      v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v19 = v6;
      v20 = v29;
      v18(v29, v11, v14);
      v17 = v31;
      v21 = v32(v20);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v14);
        swift_bridgeObjectRelease(v26);
        return v17;
      }
      v22 = v21;
      v23 = v15;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v14);
      if ((v22 & 1) != 0)
        break;
      v13 += v28;
      --v12;
      v4 = 0;
      v6 = v19;
      if (!v12)
      {
        a3 = v26;
        goto LABEL_9;
      }
    }
    a3 = v26;
    v17 = v27;
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain(a3);
LABEL_9:
    v23(v11, 1, 1, v33);
    v17 = 0;
  }
LABEL_13:
  swift_bridgeObjectRelease(a3);
  return v17;
}

uint64_t sub_100015E5C(uint64_t (*a1)(unint64_t), uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *);
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t (*v35)(unint64_t, char *, uint64_t);
  uint64_t v36;
  BOOL v37;
  unint64_t v38;
  _QWORD v39[2];
  uint64_t (*v40)(unint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;

  v4 = v2;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v42 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v41 = (char *)v39 - v12;
  __chkstk_darwin(v11);
  v46 = v4;
  v14 = *v4;
  v15 = *(_QWORD *)(*v4 + 16);
  if (!v15)
    return 0;
  v44 = (char *)v39 - v13;
  v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v48 = *(_QWORD *)(v8 + 72);
  swift_bridgeObjectRetain(v14);
  v17 = 0;
  v39[0] = v16;
  while (1)
  {
    v18 = a1(v14 + v16);
    if (v3)
    {
      swift_bridgeObjectRelease(v14);
      return v17;
    }
    if ((v18 & 1) != 0)
      break;
    ++v17;
    v16 += v48;
    if (v15 == v17)
    {
      swift_bridgeObjectRelease(v14);
      return *(_QWORD *)(v14 + 16);
    }
  }
  result = swift_bridgeObjectRelease(v14);
  if (!__OFADD__(v17, 1))
  {
    v20 = *(_QWORD *)(v14 + 16);
    if (v17 + 1 == v20)
      return v17;
    v21 = v48 + v16;
    v22 = v17 + 1;
    v45 = v7;
    v39[1] = a2;
    v40 = a1;
    v43 = v8;
    while (v22 < v20)
    {
      v47 = v22;
      v23 = v21;
      v24 = v14 + v21;
      v25 = (uint64_t (*)(char *))a1;
      v26 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v27 = v44;
      v26(v44, v24, v7);
      LOBYTE(v25) = v25(v27);
      result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v27, v7);
      if ((v25 & 1) != 0)
      {
        a1 = v40;
        v28 = v23;
        v29 = v47;
      }
      else
      {
        v29 = v47;
        v28 = v23;
        if (v47 != v17)
        {
          if ((v17 & 0x8000000000000000) != 0)
            goto LABEL_32;
          v30 = *v46;
          v31 = *(_QWORD *)(*v46 + 16);
          if (v17 >= v31)
            goto LABEL_33;
          v32 = v17 * v48;
          v33 = v45;
          result = ((uint64_t (*)(char *, unint64_t, uint64_t))v26)(v41, v30 + v39[0] + v17 * v48, v45);
          if (v47 >= v31)
            goto LABEL_34;
          v26(v42, v30 + v23, v33);
          result = swift_isUniquelyReferenced_nonNull_native(v30);
          *v46 = v30;
          if ((result & 1) == 0)
          {
            result = sub_1000161B4(v30);
            v30 = result;
            *v46 = result;
          }
          if (v17 >= *(_QWORD *)(v30 + 16))
            goto LABEL_35;
          v34 = v30 + v39[0] + v32;
          v35 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v43 + 40);
          v36 = v45;
          result = v35(v34, v42, v45);
          if (v47 >= *(_QWORD *)(*v46 + 16))
            goto LABEL_36;
          result = v35(*v46 + v23, v41, v36);
          v29 = v47;
        }
        v37 = __OFADD__(v17++, 1);
        a1 = v40;
        if (v37)
          goto LABEL_31;
      }
      v38 = v29 + 1;
      v7 = v45;
      v8 = v43;
      if (__OFADD__(v29, 1))
        goto LABEL_30;
      v14 = *v46;
      v20 = *(_QWORD *)(*v46 + 16);
      v22 = v29 + 1;
      v21 = v28 + v48;
      if (v38 == v20)
        return v17;
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000161B4(unint64_t a1)
{
  return sub_100015A2C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_1000161C8(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 0x6E6564496B736174 && a2 == 0xEF73726569666974)
  {
    swift_bridgeObjectRelease(a2);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6564496B736174, 0xEF73726569666974, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_100016264()
{
  return 0x6E6564496B736174;
}

_QWORD *sub_100016288(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;

  v3 = sub_1000088F0(&qword_10004FAC8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = sub_100015710(a1, v7);
  v10 = sub_1000163D4();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BackgroundActivityAttributes.CodingKeys, &type metadata for BackgroundActivityAttributes.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_1000156F0(a1);
  }
  else
  {
    v11 = sub_1000088F0(&qword_10004FAD8);
    sub_100016418(&qword_10004FAE0, &qword_10004FAE8, (uint64_t)&protocol conformance descriptor for UUID, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v14, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v14;
    sub_1000156F0(a1);
  }
  return v9;
}

unint64_t sub_1000163D4()
{
  unint64_t result;

  result = qword_10004FAD0;
  if (!qword_10004FAD0)
  {
    result = swift_getWitnessTable(&unk_100035EB8, &type metadata for BackgroundActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FAD0);
  }
  return result;
}

uint64_t sub_100016418(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v9 = sub_100008B84(&qword_10004FAD8);
    sub_1000067D0(a2, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, a3);
    result = swift_getWitnessTable(a4, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001649C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000164F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000088F0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100016534(uint64_t a1)
{
  return sub_100016844(a1) & 1;
}

uint64_t sub_10001654C(uint64_t a1)
{
  uint64_t v1;

  return static UUID.== infix(_:_:)(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_100016578(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  v8 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
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

uint64_t sub_100016690(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_100015A2C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = v4 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v15 = *(_QWORD *)(v13 + 72);
  v16 = v15 * a1;
  v17 = v14 + v15 * a1;
  result = swift_arrayDestroy(v17, v7, v12);
  if (!v7)
    goto LABEL_25;
  v19 = *(_QWORD *)(v4 + 16);
  v20 = v19 - a2;
  if (__OFSUB__(v19, a2))
    goto LABEL_31;
  if ((v20 & 0x8000000000000000) == 0)
  {
    v21 = v14 + v15 * a2;
    if (v16 < v15 * a2 || v17 >= v21 + v20 * v15)
    {
      result = swift_arrayInitWithTakeFrontToBack(v17, v21, v20, v12);
    }
    else if (v16 != v15 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront(v17);
    }
    v23 = *(_QWORD *)(v4 + 16);
    v24 = __OFADD__(v23, v8);
    v25 = v23 - v7;
    if (!v24)
    {
      *(_QWORD *)(v4 + 16) = v25;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v26, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100016844(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = type metadata accessor for UUID(0);
  v5 = sub_1000067D0(&qword_10004FF60, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  return dispatch thunk of static Equatable.== infix(_:_:)(a1, v3, v4, v5) & 1;
}

uint64_t sub_1000168C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100016920()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UUID(0) - 8) + 80);
  return sub_10001344C(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_10001694C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001695C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100016964()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004FB60;
  if (!qword_10004FB60)
  {
    v1 = sub_100008B84(&qword_10004FB58);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10004FB60);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityAttributes.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityAttributes.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100016A5C + 4 * asc_100035860[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100016A7C + 4 * byte_100035865[v4]))();
}

_BYTE *sub_100016A5C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100016A7C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100016A84(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100016A8C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100016A94(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100016A9C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes.CodingKeys()
{
  return &type metadata for BackgroundActivityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for BackgroundActivityAttributes.ContentState.CodingKeys;
}

ValueMetadata *type metadata accessor for BackgroundActivityAttributes.ContentState()
{
  return &type metadata for BackgroundActivityAttributes.ContentState;
}

unint64_t sub_100016ADC()
{
  unint64_t result;

  result = qword_10004FBA8;
  if (!qword_10004FBA8)
  {
    result = swift_getWitnessTable(&unk_100035E90, &type metadata for BackgroundActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FBA8);
  }
  return result;
}

unint64_t sub_100016B24()
{
  unint64_t result;

  result = qword_10004FBB0;
  if (!qword_10004FBB0)
  {
    result = swift_getWitnessTable(&unk_100035E00, &type metadata for BackgroundActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FBB0);
  }
  return result;
}

unint64_t sub_100016B6C()
{
  unint64_t result;

  result = qword_10004FBB8;
  if (!qword_10004FBB8)
  {
    result = swift_getWitnessTable(&unk_100035E28, &type metadata for BackgroundActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FBB8);
  }
  return result;
}

unint64_t sub_100016BB4()
{
  unint64_t result;

  result = qword_10004FBC0;
  if (!qword_10004FBC0)
  {
    result = swift_getWitnessTable(&unk_100035DB0, &type metadata for BackgroundActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FBC0);
  }
  return result;
}

unint64_t sub_100016BFC()
{
  unint64_t result;

  result = qword_10004FBC8;
  if (!qword_10004FBC8)
  {
    result = swift_getWitnessTable(&unk_100035DD8, &type metadata for BackgroundActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10004FBC8);
  }
  return result;
}

void destroy for BackgroundActivityProgressView(uint64_t a1)
{
  sub_100016C70(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));

}

uint64_t sub_100016C70(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t initializeWithCopy for BackgroundActivityProgressView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_100008E74(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = v7;
  return a1;
}

uint64_t assignWithCopy for BackgroundActivityProgressView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_100008E74(*(_QWORD *)a2, v5);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_100016C70(v7, v8);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v9 = *(void **)(a2 + 24);
  v10 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v9;
  v11 = v9;

  return a1;
}

uint64_t assignWithTake for BackgroundActivityProgressView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_100016C70(v5, v6);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityProgressView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityProgressView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityProgressView()
{
  return &type metadata for BackgroundActivityProgressView;
}

uint64_t sub_100016E54(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, id a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  char v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  _BYTE *v43;
  _BOOL8 v44;
  uint64_t v46;
  uint64_t v47;
  id v48;
  int v49;
  id v50[3];

  v9 = a4 & 1;
  v49 = a4 & 0x100;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a4 & 0x100) != 0)
  {
    v15 = type metadata accessor for BackgroundActivitySession(0);
    v16 = sub_100017810();
    v47 = v15;
    v17 = StateObject.wrappedValue.getter(a2, a3, v9, v15, v16);
    KeyPath = swift_getKeyPath(&unk_100036080);
    v19 = swift_getKeyPath(&unk_1000360A8);
    v48 = a5;
    v20 = v19;
    static Published.subscript.getter(v50, v17, KeyPath, v19);
    swift_release(v17);
    swift_release(KeyPath);
    swift_release(v20);
    v21 = v50[0];
    LODWORD(KeyPath) = objc_msgSend(v50[0], "isCancellable");

    a5 = v48;
    v14 = 0;
    if ((_DWORD)KeyPath)
    {
      sub_100017860();
      v22 = StateObject.wrappedValue.getter(a2, a3, v9, v47, v16);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v22 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id, v10);
      v23 = swift_release(v22);
      UUID.uuidString.getter(v23);
      v25 = v24;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      v26 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v25);
      v27 = swift_allocObject(&unk_1000460C8, 48, 7);
      *(_QWORD *)(v27 + 16) = a2;
      *(_QWORD *)(v27 + 24) = a3;
      *(_BYTE *)(v27 + 32) = (_DWORD)v9 != 0;
      *(_BYTE *)(v27 + 33) = 1;
      *(_QWORD *)(v27 + 40) = v48;
      sub_100008E74(a2, a3);
      v28 = v48;
      v46 = v27;
      a5 = v48;
      v14 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, v26, 0, 0, 0, 0, sub_1000178A0, v46);
    }
  }
  else
  {
    v14 = 0;
  }
  v29 = type metadata accessor for BackgroundActivitySession(0);
  v30 = sub_100017810();
  v31 = a5;
  v32 = StateObject.wrappedValue.getter(a2, a3, v9, v29, v30);
  v33 = *(_BYTE *)(v32 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release(v32);
  objc_allocWithZone((Class)type metadata accessor for BackgroundActivityProgressMicaView());
  v34 = v14;
  sub_10000B300(v31, 8, v33, v14);
  v36 = v35;
  v37 = StateObject.wrappedValue.getter(a2, a3, v9, v29, v30);
  v38 = swift_getKeyPath(&unk_100036080);
  v39 = swift_getKeyPath(&unk_1000360A8);
  static Published.subscript.getter(v50, v37, v38, v39);
  swift_release(v37);
  swift_release(v38);
  swift_release(v39);
  v40 = v50[0];
  v41 = *(void **)(v36 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress);
  *(id *)(v36 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress) = v50[0];
  v42 = v40;

  sub_10000ADDC();
  v43 = (_BYTE *)(v36 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  v44 = 1;
  swift_beginAccess(v36 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded, v50, 1, 0);
  *v43 = BYTE1(v49);
  sub_10000B9C4();
  if (*v43 == 1)
    v44 = *(_QWORD *)(v36 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) == 0;
  objc_msgSend(*(id *)(v36 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton), "setHidden:", v44);

  return v36;
}

void sub_10001724C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, void *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  _BOOL4 v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;

  v45 = a6;
  v10 = a5 & 1;
  v11 = type metadata accessor for UUID(0);
  v43 = *(_QWORD *)(v11 - 8);
  v44 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for BackgroundActivitySession(0);
  v15 = sub_100017810();
  v46 = a4;
  v16 = StateObject.wrappedValue.getter(a3, a4, v10, v14, v15);
  KeyPath = swift_getKeyPath(&unk_100036080);
  v18 = swift_getKeyPath(&unk_1000360A8);
  static Published.subscript.getter(&v47, v16, KeyPath, v18);
  swift_release(v16);
  swift_release(KeyPath);
  swift_release(v18);
  v19 = v47;
  v20 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress) = v47;
  v21 = v19;

  sub_10000ADDC();
  v22 = 0;
  if ((a5 & 0x100) != 0)
  {
    v23 = StateObject.wrappedValue.getter(a3, v46, v10, v14, v15);
    v24 = swift_getKeyPath(&unk_100036080);
    v25 = swift_getKeyPath(&unk_1000360A8);
    static Published.subscript.getter(&v47, v23, v24, v25);
    swift_release(v23);
    swift_release(v24);
    swift_release(v25);
    v26 = v47;
    LODWORD(v24) = objc_msgSend(v47, "isCancellable");

    if ((_DWORD)v24)
    {
      v41 = v10 != 0;
      v42 = sub_100017860();
      v27 = v46;
      v28 = StateObject.wrappedValue.getter(a3, v46, v10, v14, v15);
      v29 = v43;
      v30 = v44;
      (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v13, v28 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_id, v44);
      v31 = swift_release(v28);
      UUID.uuidString.getter(v31);
      v33 = v32;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
      v34 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v33);
      v35 = swift_allocObject(&unk_1000460A0, 48, 7);
      *(_QWORD *)(v35 + 16) = a3;
      *(_QWORD *)(v35 + 24) = v27;
      *(_BYTE *)(v35 + 32) = v41;
      *(_BYTE *)(v35 + 33) = 1;
      v36 = v45;
      *(_QWORD *)(v35 + 40) = v45;
      sub_100008E74(a3, v27);
      v37 = v36;
      v22 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, v34, 0, 0, 0, 0, sub_1000178A0, v35);
    }
    else
    {
      v22 = 0;
    }
  }
  v38 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) = v22;
  v39 = v22;
  sub_10000AF3C(v38);

}

uint64_t sub_100017580(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[24];

  v7 = type metadata accessor for BackgroundActivitySession(0);
  v8 = sub_100017810();
  v9 = StateObject.wrappedValue.getter(a2, a3, a4 & 1, v7, v8);
  if (qword_10004ED08 != -1)
    swift_once(&qword_10004ED08, sub_100018C5C);
  v10 = (uint64_t *)(v9 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
  swift_beginAccess(v9 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v14, 0, 0);
  v11 = *v10;
  v12 = swift_bridgeObjectRetain(v11);
  sub_1000181A0(v12);
  swift_release(v9);
  return swift_bridgeObjectRelease(v11);
}

uint64_t sub_100017654(uint64_t a1)
{
  uint64_t v1;
  __int16 v2;

  if (*(_BYTE *)(v1 + 17))
    v2 = 256;
  else
    v2 = 0;
  return sub_100016E54(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), v2 | *(unsigned __int8 *)(v1 + 16), *(id *)(v1 + 24));
}

void sub_100017680(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int16 v3;

  if (*(_BYTE *)(v2 + 17))
    v3 = 256;
  else
    v3 = 0;
  sub_10001724C(a1, a2, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), v3 | *(unsigned __int8 *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_1000176BC(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

void *sub_1000176FC()
{
  return &protocol witness table for Never;
}

uint64_t sub_100017708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000177CC();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100017758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000177CC();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000177A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000177CC();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_1000177CC()
{
  unint64_t result;

  result = qword_10004FBD0;
  if (!qword_10004FBD0)
  {
    result = swift_getWitnessTable(&unk_100035FA0, &type metadata for BackgroundActivityProgressView);
    atomic_store(result, (unint64_t *)&qword_10004FBD0);
  }
  return result;
}

unint64_t sub_100017810()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004FB40;
  if (!qword_10004FB40)
  {
    v1 = type metadata accessor for BackgroundActivitySession(255);
    result = swift_getWitnessTable(&unk_100035AD8, v1);
    atomic_store(result, (unint64_t *)&qword_10004FB40);
  }
  return result;
}

unint64_t sub_100017860()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004FBD8;
  if (!qword_10004FBD8)
  {
    v1 = objc_opt_self(UIAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004FBD8);
  }
  return result;
}

uint64_t sub_1000178A8()
{
  uint64_t v0;

  sub_100016C70(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000178D8(uint64_t a1)
{
  uint64_t v1;

  return sub_100017580(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

uint64_t sub_100017904()
{
  return sub_100017BCC((uint64_t)&unk_1000361C0, (uint64_t)&unk_1000361E8);
}

uint64_t sub_100017918(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1000164F8(a1, &qword_10004F288);
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
  v16 = swift_allocObject(&unk_1000461D0, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10004FD80, v16);
}

uint64_t sub_100017A64(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1000164F8(a1, &qword_10004F288);
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
  v16 = swift_allocObject(&unk_1000463F0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = sub_1000088F0(&qword_10004FE88);
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
  return swift_task_create(v8, v18, v17, &unk_10004FE98, v16);
}

uint64_t sub_100017BB8()
{
  return sub_100017BCC((uint64_t)&unk_100036208, (uint64_t)&unk_100036230);
}

uint64_t sub_100017BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(v5);
  swift_release(KeyPath);
  return v7;
}

uint64_t sub_100017C34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t KeyPath;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(id *, _QWORD);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(id *, _QWORD);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57[4];

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v9 = swift_getKeyPath(&unk_1000361E8);
  static Published.subscript.getter(v57, v2, KeyPath, v9);
  swift_release(KeyPath);
  swift_release(v9);
  v10 = v57[0];
  if (!*((_QWORD *)v57[0] + 2))
    return swift_bridgeObjectRelease(v10);
  v11 = sub_1000280CC(a1);
  if ((v12 & 1) == 0)
    return swift_bridgeObjectRelease(v10);
  v54 = *(_QWORD *)(v10[7] + 8 * v11);
  swift_retain(v54);
  swift_bridgeObjectRelease(v10);
  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v13 = type metadata accessor for Logger(0);
  sub_100008930(v13, (uint64_t)qword_10004FBE0);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v53 = a1;
  v15 = v14(v7, a1, v4);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    v19 = (void *)swift_slowAlloc(32, -1);
    v52 = v2;
    v20 = v19;
    v57[0] = v19;
    *(_DWORD *)v18 = 136315138;
    v21 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v22 = dispatch thunk of CustomStringConvertible.description.getter(v4, v21);
    v24 = v23;
    v55 = sub_10002785C(v22, v23, (uint64_t *)v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Ending session for task identifier %s", v18, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    v25 = v20;
    v2 = v52;
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  v27 = v54;
  v29 = *(_QWORD *)(v54 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  v28 = *(_QWORD *)(v54 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
  v30 = swift_getKeyPath(&unk_100036298);
  v31 = swift_getKeyPath(&unk_1000362C0);
  swift_bridgeObjectRetain(v28);
  static Published.subscript.getter(v57, v27, v30, v31);
  swift_release(v30);
  swift_release(v31);
  v32 = v53;
  if (((uint64_t)v57[0] & 1) != 0)
  {
    v33 = 1;
  }
  else
  {
    v34 = swift_getKeyPath(&unk_1000362E0);
    v35 = swift_getKeyPath(&unk_100036308);
    static Published.subscript.getter(v57, v27, v34, v35);
    swift_release(v34);
    swift_release(v35);
    v36 = v57[0];
    v33 = objc_msgSend(v57[0], "isCancelled");

  }
  sub_1000140C4();
  v37 = swift_getKeyPath(&unk_1000361C0);
  v38 = swift_getKeyPath(&unk_1000361E8);
  v39 = (void (*)(id *, _QWORD))static Published.subscript.modify(v57, v2, v37, v38);
  v40 = sub_1000284C8(v32);
  swift_release(v40);
  v39(v57, 0);
  swift_release(v37);
  swift_release(v38);
  v41 = swift_getKeyPath(&unk_100036208);
  v42 = swift_getKeyPath(&unk_100036230);
  swift_bridgeObjectRetain(v28);
  static Published.subscript.getter(v57, v2, v41, v42);
  swift_release(v41);
  swift_release(v42);
  v43 = v57[0];
  if (*((_QWORD *)v57[0] + 2) && (v44 = sub_100027FC8(v29, v28), (v45 & 1) != 0))
  {
    v46 = *(_QWORD *)(v43[7] + 8 * v44);
    swift_retain(v46);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v43);
    sub_100013C20(v32, v33);
    v47 = v46 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers;
    swift_beginAccess(v46 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, &v55, 0, 0);
    if (*(_QWORD *)(*(_QWORD *)v47 + 16))
    {
      swift_release(v46);
      swift_bridgeObjectRelease(v28);
    }
    else
    {
      sub_1000140C4();
      v48 = swift_getKeyPath(&unk_100036208);
      v49 = swift_getKeyPath(&unk_100036230);
      v50 = (void (*)(id *, _QWORD))static Published.subscript.modify(v57, v2, v48, v49);
      v51 = sub_1000284BC(v29, v28);
      swift_release(v51);
      v50(v57, 0);
      swift_bridgeObjectRelease(v28);
      swift_release(v46);
      swift_release(v48);
      swift_release(v49);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease_n(v28, 2);
  }
  sub_100009934();
  return swift_release(v27);
}

uint64_t sub_1000181A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  unint64_t v54;
  int64_t v55;
  unint64_t v56;
  int64_t v57;
  char *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t result;
  void *v90;
  id v91;
  Class isa;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t, uint64_t);
  char *v104;
  int64_t v105;
  _QWORD *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112[3];
  char *v113;
  _QWORD *v114;
  uint64_t v115;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v109 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v94 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v94 - v11;
  v13 = sub_1000088F0(&qword_10004FB20);
  v14 = __chkstk_darwin(v13);
  v100 = (char *)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v108 = (char *)&v94 - v16;
  if (qword_10004ED00 == -1)
    goto LABEL_2;
LABEL_61:
  swift_once(&qword_10004ED00, sub_100018BCC);
LABEL_2:
  v17 = type metadata accessor for Logger(0);
  sub_100008930(v17, (uint64_t)qword_10004FBE0);
  v18 = swift_bridgeObjectRetain_n(a1, 2);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  v21 = os_log_type_enabled(v19, v20);
  v101 = v2;
  v110 = v10;
  v111 = v5;
  if (v21)
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v112[0] = v23;
    *(_DWORD *)v22 = 136315138;
    v107 = (uint64_t)(v22 + 4);
    v24 = swift_bridgeObjectRetain(a1);
    v25 = Array.description.getter(v24, v4);
    v27 = v26;
    swift_bridgeObjectRelease(a1);
    v28 = v25;
    v5 = v111;
    v114 = (_QWORD *)sub_10002785C(v28, v27, v112);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v114, &v115);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v27);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Requested cancel for task identifiers: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  v29 = v108;
  v114 = &_swiftEmptySetSingleton;
  v30 = *(_QWORD *)(a1 + 16);
  v96 = a1;
  if (v30)
  {
    v31 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v32 = *(_QWORD *)(v5 + 72);
    v33 = a1;
    v34 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain(v33);
    while (1)
    {
      v34(v29, v31, v4);
      v103 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v103(v29, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v29, 1, v4) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v29, v4);
      KeyPath = swift_getKeyPath(&unk_1000361C0);
      v36 = swift_getKeyPath(&unk_1000361E8);
      static Published.subscript.getter(v112, v101, KeyPath, v36);
      swift_release(KeyPath);
      swift_release(v36);
      v37 = v112[0];
      if (*(_QWORD *)(v112[0] + 16) && (v38 = sub_1000280CC((uint64_t)v12), (v39 & 1) != 0))
      {
        v40 = *(_QWORD *)(*(_QWORD *)(v37 + 56) + 8 * v38);
        swift_retain(v40);
        swift_bridgeObjectRelease(v37);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
        v41 = swift_getKeyPath(&unk_100036298);
        v42 = swift_getKeyPath(&unk_1000362C0);
        LOBYTE(v112[0]) = 1;
        swift_retain(v40);
        static Published.subscript.setter(v112, v40, v41, v42);
        v43 = v12;
        v44 = *(_QWORD *)(v40 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
        v45 = *(_QWORD *)(v40 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
        swift_bridgeObjectRetain(v45);
        v46 = v44;
        v5 = v111;
        v47 = v45;
        v12 = v43;
        v29 = v108;
        sub_10001F860(v112, v46, v47);
        swift_release(v40);
        swift_bridgeObjectRelease(v112[1]);
      }
      else
      {
        swift_bridgeObjectRelease(v37);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
      }
      v31 += v32;
      if (!--v30)
        goto LABEL_14;
    }
  }
  else
  {
    v103 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    swift_bridgeObjectRetain(a1);
LABEL_14:
    v103(v29, 1, 1, v4);
  }
  a1 = v96;
  swift_bridgeObjectRelease(v96);
  v48 = 0;
  v49 = v114[7];
  v104 = (char *)(v114 + 7);
  v106 = v114;
  v50 = 1 << *((_BYTE *)v114 + 32);
  if (v50 < 64)
    v51 = ~(-1 << v50);
  else
    v51 = -1;
  v52 = v51 & v49;
  v105 = (unint64_t)(v50 + 63) >> 6;
  v10 = v100;
  v2 = v101;
  v53 = v110;
  if (v52)
  {
LABEL_19:
    v107 = (v52 - 1) & v52;
    v108 = v48;
    v54 = __clz(__rbit64(v52)) | ((_QWORD)v48 << 6);
    goto LABEL_34;
  }
  while (1)
  {
    v55 = (int64_t)(v48 + 1);
    if (__OFADD__(v48, 1))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    if (v55 >= v105)
      goto LABEL_56;
    v56 = *(_QWORD *)&v104[8 * v55];
    v57 = (int64_t)(v48 + 1);
    if (!v56)
    {
      v57 = (int64_t)(v48 + 2);
      if ((uint64_t)(v48 + 2) >= v105)
        goto LABEL_56;
      v56 = *(_QWORD *)&v104[8 * v57];
      if (!v56)
      {
        v57 = (int64_t)(v48 + 3);
        if ((uint64_t)(v48 + 3) >= v105)
          goto LABEL_56;
        v56 = *(_QWORD *)&v104[8 * v57];
        if (!v56)
          break;
      }
    }
LABEL_33:
    v107 = (v56 - 1) & v56;
    v108 = (char *)v57;
    v54 = __clz(__rbit64(v56)) + (v57 << 6);
LABEL_34:
    v59 = (uint64_t *)(v106[6] + 16 * v54);
    v60 = *v59;
    v61 = v59[1];
    v62 = swift_getKeyPath(&unk_100036208);
    v63 = swift_getKeyPath(&unk_100036230);
    swift_bridgeObjectRetain(v61);
    static Published.subscript.getter(&v113, v2, v62, v63);
    swift_release(v62);
    swift_release(v63);
    v12 = v113;
    if (*((_QWORD *)v113 + 2) && (v64 = sub_100027FC8(v60, v61), (v65 & 1) != 0))
    {
      v66 = *(_QWORD *)(*((_QWORD *)v12 + 7) + 8 * v64);
      swift_retain(v66);
      swift_bridgeObjectRelease(v61);
      swift_bridgeObjectRelease(v12);
      v94 = v66;
      v67 = (uint64_t *)(v66 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers);
      swift_beginAccess(v66 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_taskIdentifiers, v112, 0, 0);
      v68 = *v67;
      v69 = *(_QWORD *)(*v67 + 16);
      v70 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      swift_bridgeObjectRetain(v68);
      v99 = v70;
      v12 = (char *)Set.init(minimumCapacity:)(v69, v4, v70);
      v98 = *(_QWORD *)(v68 + 16);
      v95 = v68;
      if (v98)
      {
        v71 = 0;
        v97 = v68 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        v72 = *(_QWORD *)(v5 + 72);
        v73 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v73(v10, v97, v4);
        while (1)
        {
          v103(v10, 0, 1, v4);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
            break;
          v102 = v71;
          (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v53, v10, v4);
          v77 = *((_QWORD *)v12 + 5);
          swift_bridgeObjectRetain(v12);
          v78 = dispatch thunk of Hashable._rawHashValue(seed:)(v77, v4, v99);
          v79 = -1 << v12[32];
          v80 = v78 & ~v79;
          if (((*(_QWORD *)&v12[((v80 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v80) & 1) != 0)
          {
            v81 = ~v79;
            while (1)
            {
              v82 = v109;
              v73(v109, *((_QWORD *)v12 + 6) + v80 * v72, v4);
              v83 = sub_1000067D0(&qword_10004FF60, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
              v84 = dispatch thunk of static Equatable.== infix(_:_:)(v82, v110, v4, v83);
              v76 = *(void (**)(char *, uint64_t))(v111 + 8);
              v76(v82, v4);
              if ((v84 & 1) != 0)
                break;
              v80 = (v80 + 1) & v81;
              if (((*(_QWORD *)&v12[((v80 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v80) & 1) == 0)
                goto LABEL_41;
            }
            swift_bridgeObjectRelease(v12);
            v53 = v110;
            v5 = v111;
          }
          else
          {
LABEL_41:
            swift_bridgeObjectRelease(v12);
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v12);
            v75 = (uint64_t)v109;
            v53 = v110;
            v73(v109, (uint64_t)v110, v4);
            v113 = v12;
            sub_100020B6C(v75, v80, isUniquelyReferenced_nonNull_native);
            v12 = v113;
            swift_bridgeObjectRelease(0x8000000000000000);
            v5 = v111;
            v76 = *(void (**)(char *, uint64_t))(v111 + 8);
          }
          v71 = v102 + 1;
          v76(v53, v4);
          v10 = v100;
          if (v71 == v98)
            goto LABEL_51;
          v73(v100, v97 + v72 * v71, v4);
        }
      }
      else
      {
LABEL_51:
        v103(v10, 1, 1, v4);
      }
      swift_bridgeObjectRelease(v95);
      a1 = v96;
      v85 = sub_10001FA0C(v96, (uint64_t)v12);
      v86 = v85[2];
      swift_release(v85);
      if (v86)
      {
        swift_release(v94);
      }
      else
      {
        v87 = swift_getKeyPath(&unk_100036298);
        v88 = swift_getKeyPath(&unk_1000362C0);
        LOBYTE(v113) = 1;
        static Published.subscript.setter(&v113, v94, v87, v88);
      }
      v2 = v101;
    }
    else
    {
      swift_bridgeObjectRelease(v61);
      swift_bridgeObjectRelease(v12);
    }
    v52 = v107;
    v48 = v108;
    if (v107)
      goto LABEL_19;
  }
  v58 = v48 + 4;
  if ((uint64_t)(v48 + 4) < v105)
  {
    v56 = *(_QWORD *)&v104[8 * (_QWORD)v58];
    if (!v56)
    {
      while (1)
      {
        v57 = (int64_t)(v58 + 1);
        if (__OFADD__(v58, 1))
          goto LABEL_60;
        if (v57 >= v105)
          goto LABEL_56;
        v56 = *(_QWORD *)&v104[8 * v57];
        ++v58;
        if (v56)
          goto LABEL_33;
      }
    }
    v57 = (int64_t)(v48 + 4);
    goto LABEL_33;
  }
LABEL_56:
  result = swift_release(v106);
  v90 = *(void **)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient);
  if (v90)
  {
    v91 = objc_allocWithZone((Class)APKActivityProgressTasksSpecifier);
    swift_bridgeObjectRetain(a1);
    swift_unknownObjectRetain(v90);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    v93 = objc_msgSend(v91, "initWithTaskIdentifiers:", isa);

    objc_msgSend(v90, "cancelActivities:", v93);
    return swift_unknownObjectRelease(v90);
  }
  return result;
}

uint64_t sub_100018BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_10004FBE0);
  v1 = sub_100008930(v0, (uint64_t)qword_10004FBE0);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_100018C5C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BackgroundActivitySessionsController(0)), "init");
  qword_100050B18 = (uint64_t)result;
  return result;
}

uint64_t sub_100018C8C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100018CC8(a1, (uint64_t)&unk_1000361C0, (uint64_t)&unk_1000361E8, a2);
}

uint64_t sub_100018CA0(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100018D54(a1, a2, a3, a4, (uint64_t)&unk_1000361C0, (uint64_t)&unk_1000361E8);
}

uint64_t sub_100018CB4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100018CC8(a1, (uint64_t)&unk_100036208, (uint64_t)&unk_100036230, a2);
}

uint64_t sub_100018CC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(&v10, v6, KeyPath, v8);
  swift_release(v8);
  result = swift_release(KeyPath);
  *a4 = v10;
  return result;
}

uint64_t sub_100018D40(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100018D54(a1, a2, a3, a4, (uint64_t)&unk_100036208, (uint64_t)&unk_100036230);
}

uint64_t sub_100018D54(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  void *v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v12;

  v7 = *a1;
  v8 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v10 = swift_getKeyPath(a6);
  v12 = v7;
  swift_bridgeObjectRetain(v7);
  return static Published.subscript.setter(&v12, v8, KeyPath, v10);
}

uint64_t sub_100018DC4()
{
  char *v0;
  char *v1;
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  id v31;
  unint64_t v32;
  id v33;
  objc_class *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  void *v51;
  id v52;
  uint64_t result;
  int v54;
  char *v55;
  objc_class *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  __int128 v61;
  __int128 v62;
  objc_class *ObjectType;
  __int128 aBlock;
  __int128 v65;
  uint64_t (*v66)();
  uint64_t v67;
  objc_super v68;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  *(_QWORD *)&v62 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  *(_QWORD *)&v61 = *(_QWORD *)(v62 - 8);
  __chkstk_darwin(v62);
  v60 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v59);
  v58 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000088F0(&qword_10004FEA8);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000088F0((uint64_t *)&unk_10004FEB0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = 0;
  v15 = &v1[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__backgroundActivitySessionsByTaskID];
  v16 = v1;
  *(_QWORD *)&aBlock = sub_100004BE0((uint64_t)&_swiftEmptyArrayStorage);
  v17 = sub_1000088F0(&qword_10004FC80);
  Published.init(initialValue:)(&aBlock, v17);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v14, v11);
  v18 = &v16[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController__jindoSessionsByBundleID];
  *(_QWORD *)&aBlock = sub_100004D74((uint64_t)&_swiftEmptyArrayStorage);
  v19 = sub_1000088F0(&qword_10004FC90);
  Published.init(initialValue:)(&aBlock, v19);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v18, v10, v7);
  v20 = OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator;
  *(_QWORD *)&v16[v20] = objc_msgSend(objc_allocWithZone((Class)UINotificationFeedbackGenerator), "init");
  v16[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation] = 0;
  v21 = OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_queue;
  sub_100023298();
  static DispatchQoS.userInitiated.getter();
  *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
  v22 = sub_1000067D0(&qword_10004FEC0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v23 = sub_1000088F0(&qword_10004FEC8);
  v24 = sub_100008E7C(&qword_10004FED0, &qword_10004FEC8, (uint64_t)&protocol conformance descriptor for [A]);
  v25 = v58;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v23, v24, v59, v22);
  v26 = v60;
  (*(void (**)(char *, _QWORD, _QWORD))(v61 + 104))(v60, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v62);
  *(_QWORD *)&v16[v21] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000022, 0x800000010003AA90, v6, v25, v26, 0);
  v27 = type metadata accessor for APKLockStateMonitor(0);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_lockStateMonitor] = APKLockStateMonitor.init()();
  v28 = type metadata accessor for BackgroundActivitySystemPillController();
  v29 = (_QWORD *)swift_allocObject(v28, 48, 7);
  v29[2] = String._bridgeToObjectiveC()();
  BSAuditTokenForCurrentProcess(&aBlock);
  v61 = v65;
  v62 = aBlock;
  v30 = objc_allocWithZone((Class)STActivityAttribution);
  aBlock = v62;
  v65 = v61;
  v29[3] = objc_msgSend(v30, "initWithAuditToken:", &aBlock);
  v29[4] = objc_msgSend(objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainPublisher), "init");
  v29[5] = 0;
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_pillController] = v29;
  v31 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v32 = (unint64_t)objc_msgSend(v31, "userInterfaceLayoutDirection");

  if ((v32 & 0x8000000000000000) != 0)
    goto LABEL_11;
  v33 = objc_msgSend(objc_allocWithZone((Class)SFUIPeopleSuggestionImageProvider), "initWithTargetSize:layoutDirection:", v32, 1.0, 1.0);
  *(_QWORD *)&v16[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_appIconProvider] = v33;
  v16[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_isSystemApertureEnabled] = SBUIIsSystemApertureEnabled();

  v34 = ObjectType;
  v68.receiver = v16;
  v68.super_class = ObjectType;
  v35 = (char *)objc_msgSendSuper2(&v68, "init");
  v36 = *(_QWORD *)&v35[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_lockStateMonitor];
  v37 = sub_1000067D0(&qword_10004FED8, type metadata accessor for BackgroundActivitySessionsController, (uint64_t)&unk_100036160);
  v38 = v35;
  swift_retain(v36);
  dispatch thunk of APKLockStateMonitor.delegate.setter(v35, v37);
  v39 = swift_release(v36);
  v40 = &v57;
  __chkstk_darwin(v39);
  v55 = v38;
  v56 = v34;
  v41 = swift_allocObject(&unk_100046418, 32, 7);
  *(_QWORD *)(v41 + 16) = sub_1000232D4;
  *(_QWORD *)(v41 + 24) = &v54;
  v66 = sub_10000A4D8;
  v67 = v41;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v65 = sub_1000195B8;
  *((_QWORD *)&v65 + 1) = &unk_100046430;
  v42 = _Block_copy(&aBlock);
  v43 = (void *)objc_opt_self(BSServiceConnectionListener);
  swift_retain(v41);
  v44 = objc_msgSend(v43, "listenerWithConfigurator:", v42);
  _Block_release(v42);
  swift_release(v67);
  LOBYTE(v42) = swift_isEscapingClosureAtFileLocation(v41, "", 0, 0, 0, 1);
  swift_release(v41);
  if ((v42 & 1) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v40 = (uint64_t *)OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener;
  v45 = *(void **)&v38[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener];
  *(_QWORD *)&v38[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener] = v44;

  if (qword_10004ED00 != -1)
LABEL_9:
    swift_once(&qword_10004ED00, sub_100018BCC);
  v46 = type metadata accessor for Logger(0);
  v47 = sub_100008930(v46, (uint64_t)qword_10004FBE0);
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "BackgroundActivitySessionsController listener is activating...", v50, 2u);
    swift_slowDealloc(v50, -1, -1);
  }

  v51 = *(void **)((char *)v40 + (_QWORD)v38);
  if (v51)
  {
    v52 = v51;
    objc_msgSend(v52, "activate");

    return (uint64_t)v38;
  }
  __break(1u);
LABEL_11:
  LOBYTE(v54) = 2;
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, v54, 3451, 0);
  __break(1u);
  return result;
}

id sub_10001950C(void *a1, uint64_t a2)
{
  NSString v4;
  NSString v5;

  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setDomain:", v4);

  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setService:", v5);

  return objc_msgSend(a1, "setDelegate:", a2);
}

void sub_1000195DC()
{
  char *v0;
  void *v1;
  objc_class *ObjectType;
  objc_super v3;

  v1 = *(void **)&v0[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_listener];
  if (v1)
  {
    ObjectType = (objc_class *)swift_getObjectType(v0);
    objc_msgSend(v1, "invalidate");
    v3.receiver = v0;
    v3.super_class = ObjectType;
    objc_msgSendSuper2(&v3, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000197AC()
{
  return type metadata accessor for BackgroundActivitySessionsController(0);
}

uint64_t type metadata accessor for BackgroundActivitySessionsController(uint64_t a1)
{
  uint64_t result;

  result = qword_10004FC68;
  if (!qword_10004FC68)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BackgroundActivitySessionsController);
  return result;
}

void sub_1000197F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[12];

  v6[0] = "\b";
  v6[1] = "\b";
  v6[2] = "\b";
  sub_1000198D0(319, &qword_10004FC78, &qword_10004FC80);
  if (v3 <= 0x3F)
  {
    v6[3] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000198D0(319, &qword_10004FC88, &qword_10004FC90);
    if (v5 <= 0x3F)
    {
      v6[4] = *(_QWORD *)(v4 - 8) + 64;
      v6[5] = (char *)&value witness table for Builtin.NativeObject + 64;
      v6[6] = (char *)&value witness table for Builtin.NativeObject + 64;
      v6[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
      v6[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
      v6[9] = &unk_100036140;
      v6[10] = &unk_100036140;
      v6[11] = (char *)&value witness table for Builtin.UnknownObject + 64;
      swift_updateClassMetadata2(a1, 256, 12, v6, a1 + 80);
    }
  }
}

void sub_1000198D0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_100008B84(a3);
    v6 = type metadata accessor for Published(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10001991C(void (*a1)(_QWORD *, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, void (*)(_QWORD, _QWORD), uint64_t);
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void (*v57)(_QWORD *, _QWORD);
  _QWORD v58[4];
  uint64_t v59;

  v11 = v9;
  v55 = a7;
  v56 = a8;
  v53 = a4;
  v54 = a6;
  v51 = a2;
  v52 = a5;
  v57 = a1;
  v13 = type metadata accessor for APKDeviceLockState(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for UUID(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v49 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v21 = (char *)&v46 - v20;
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v23 = swift_getKeyPath(&unk_1000361E8);
  static Published.subscript.getter(v58, v11, KeyPath, v23);
  swift_release(KeyPath);
  swift_release(v23);
  v24 = v58[0];
  if (*(_QWORD *)(v58[0] + 16) && (v25 = sub_1000280CC((uint64_t)v57), (v26 & 1) != 0))
  {
    v27 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v25);
    swift_retain(v27);
    swift_bridgeObjectRelease(v24);
    sub_100012788(v56);
  }
  else
  {
    v50 = v10;
    swift_bridgeObjectRelease(v24);
    v28 = v11;
    v47 = v17;
    v29 = *(void (**)(char *, void (*)(_QWORD, _QWORD), uint64_t))(v17 + 16);
    v29(v21, (void (*)(_QWORD, _QWORD))v57, v16);
    v48 = v28;
    v30 = a9;
    v46 = v16;
    v31 = a3;
    swift_bridgeObjectRetain(a3);
    v32 = v52;
    swift_bridgeObjectRetain(v52);
    v33 = v55;
    swift_bridgeObjectRetain(v55);
    v34 = v56;
    dispatch thunk of APKLockStateMonitor.lockState.getter();
    v35 = type metadata accessor for BackgroundActivitySession(0);
    swift_allocObject(v35, *(unsigned int *)(v35 + 48), *(unsigned __int16 *)(v35 + 52));
    v36 = v50;
    result = sub_100011250((uint64_t)v21, v51, v31, v53, v32, v54, v33, v34, a9, 0, (uint64_t)v15);
    if (v36)
      return result;
    v27 = result;
    v38 = (uint64_t)v49;
    v39 = v46;
    v29(v49, (void (*)(_QWORD, _QWORD))v57, v46);
    v40 = swift_getKeyPath(&unk_1000361C0);
    v41 = swift_getKeyPath(&unk_1000361E8);
    swift_retain(v27);
    v57 = (void (*)(_QWORD *, _QWORD))static Published.subscript.modify(v58, v48, v40, v41);
    v43 = v42;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v42);
    v59 = *v43;
    *v43 = 0x8000000000000000;
    sub_10001F32C(v27, v38, isUniquelyReferenced_nonNull_native);
    v45 = *v43;
    *v43 = v59;
    swift_bridgeObjectRelease(v45);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v38, v39);
    v57(v58, 0);
    swift_release(v40);
    swift_release(v41);
    sub_100009244();
  }
  return swift_release(v27);
}

uint64_t sub_100019C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char *v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *, _QWORD);
  uint64_t *v39;
  uint64_t *v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  uint64_t v53;

  v11 = v9;
  v50 = a7;
  v51 = a8;
  v48 = a5;
  v49 = a6;
  v47 = a4;
  v15 = type metadata accessor for APKDeviceLockState(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for UUID(0);
  v19 = *(_QWORD *)(v18 - 8);
  result = __chkstk_darwin(v18);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v11
                + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_isSystemApertureEnabled) == 1)
  {
    v45 = a2;
    v46 = v10;
    KeyPath = swift_getKeyPath(&unk_100036208);
    v24 = swift_getKeyPath(&unk_100036230);
    swift_bridgeObjectRetain(a3);
    static Published.subscript.getter(v52, v11, KeyPath, v24);
    swift_release(KeyPath);
    swift_release(v24);
    v25 = v52[0];
    if (*(_QWORD *)(v52[0] + 16) && (v26 = sub_100027FC8(v45, a3), (v27 & 1) != 0))
    {
      v28 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26);
      swift_retain(v28);
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v25);
      sub_1000136B0(a1, (uint64_t)v51);
    }
    else
    {
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v25);
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, a1, v18);
      v29 = a9;
      swift_bridgeObjectRetain(a3);
      v30 = v48;
      swift_bridgeObjectRetain(v48);
      v31 = v50;
      swift_bridgeObjectRetain(v50);
      v32 = v51;
      dispatch thunk of APKLockStateMonitor.lockState.getter();
      v33 = type metadata accessor for BackgroundActivitySession(0);
      swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
      v43 = (uint64_t)v17;
      v35 = v45;
      v34 = v46;
      result = sub_100011250((uint64_t)v22, v45, a3, v47, v30, v49, v31, v32, a9, 1u, v43);
      if (v34)
        return result;
      v36 = result;
      v46 = 0;
      v37 = swift_getKeyPath(&unk_100036208);
      v28 = swift_getKeyPath(&unk_100036230);
      swift_bridgeObjectRetain(a3);
      swift_retain(v36);
      v38 = (void (*)(_QWORD *, _QWORD))static Published.subscript.modify(v52, v11, v37, v28);
      v40 = v39;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v39);
      v53 = *v40;
      *v40 = 0x8000000000000000;
      sub_10001F49C(v36, v35, a3, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_100028E48, &qword_10004EF10);
      v42 = *v40;
      *v40 = v53;
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v42);
      v38(v52, 0);
      swift_release(v36);
      swift_release(v37);
    }
    return swift_release(v28);
  }
  return result;
}

void sub_100019F70()
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
  uint64_t KeyPath;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __n128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000088F0(&qword_10004FDA8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v30 - v9;
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v12 = swift_getKeyPath(&unk_1000361E8);
  static Published.subscript.getter(&v35, v0, KeyPath, v12);
  swift_release(KeyPath);
  v13 = swift_release(v12);
  v14 = *(_QWORD *)(v35 + 64);
  v31 = v35 + 64;
  v33 = v35;
  v34 = 0;
  v15 = 1 << *(_BYTE *)(v35 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v32 = (unint64_t)(v15 + 63) >> 6;
  v30 = v32 - 1;
  if ((v16 & v14) == 0)
    goto LABEL_8;
LABEL_6:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  v20 = v19 | (v34 << 6);
  while (2)
  {
    v21 = v33;
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v2 + 16))(v8, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v2 + 72) * v20, v1, v13);
    v22 = *(_QWORD *)(v21 + 56);
    v23 = sub_1000088F0((uint64_t *)&unk_10004FDB0);
    v24 = *(_QWORD *)(v22 + 8 * v20);
    *(_QWORD *)&v8[*(int *)(v23 + 48)] = v24;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 0, 1, v23);
    swift_retain(v24);
    while (1)
    {
      sub_10000F82C((uint64_t)v8, (uint64_t)v10, &qword_10004FDA8);
      v29 = sub_1000088F0((uint64_t *)&unk_10004FDB0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v10, 1, v29) == 1)
      {
        swift_release(v33);
        return;
      }
      v18 = swift_release(*(_QWORD *)&v10[*(int *)(v29 + 48)]);
      (*(void (**)(char *, char *, uint64_t, __n128))(v2 + 32))(v4, v10, v1, v18);
      sub_100017C34((uint64_t)v4);
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v17)
        goto LABEL_6;
LABEL_8:
      v25 = v34 + 1;
      if (__OFADD__(v34, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v25 < v32)
      {
        v26 = *(_QWORD *)(v31 + 8 * v25);
        if (v26)
          goto LABEL_11;
        v27 = v34 + 2;
        ++v34;
        if (v25 + 1 < v32)
        {
          v26 = *(_QWORD *)(v31 + 8 * v27);
          if (v26)
            goto LABEL_14;
          v34 = v25 + 1;
          if (v25 + 2 < v32)
          {
            v26 = *(_QWORD *)(v31 + 8 * (v25 + 2));
            if (v26)
            {
              v25 += 2;
              goto LABEL_11;
            }
            v27 = v25 + 3;
            v34 = v25 + 2;
            if (v25 + 3 < v32)
              break;
          }
        }
      }
LABEL_25:
      v28 = sub_1000088F0((uint64_t *)&unk_10004FDB0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v8, 1, 1, v28);
      v17 = 0;
    }
    v26 = *(_QWORD *)(v31 + 8 * v27);
    if (v26)
    {
LABEL_14:
      v25 = v27;
LABEL_11:
      v17 = (v26 - 1) & v26;
      v20 = __clz(__rbit64(v26)) + (v25 << 6);
      v34 = v25;
      continue;
    }
    break;
  }
  while (1)
  {
    v25 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v25 >= v32)
    {
      v34 = v30;
      goto LABEL_25;
    }
    v26 = *(_QWORD *)(v31 + 8 * v25);
    ++v27;
    if (v26)
      goto LABEL_11;
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_10001A2EC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_10000F82C((uint64_t)&v6, v3, &qword_10004FE88);
  return swift_continuation_resume(v2);
}

uint64_t sub_10001A33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  v6 = type metadata accessor for MainActor(0);
  v5[5] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001A3AC, v7, v8);
}

uint64_t sub_10001A3AC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD **)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 40));
  *v3 = objc_msgSend(v2, "prepareImageForDescriptor:", v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A408(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return swift_task_switch(sub_10001A424, 0, 0);
}

uint64_t sub_10001A424()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSString v3;
  id v4;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  if (v1 == 0xD000000000000026 && v2 == 0x800000010003AA60
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v1, v2, 0xD000000000000026, 0x800000010003AA60, 0) & 1) != 0)
  {
    v3 = String._bridgeToObjectiveC()();
    v4 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v3);

    return (*(uint64_t (**)(id))(v0 + 8))(v4);
  }
  else
  {
    v6 = (_QWORD *)swift_task_alloc(async function pointer to SFUIPeopleSuggestionImageProvider.previewCornerIcon(for:)[1]);
    *(_QWORD *)(v0 + 56) = v6;
    *v6 = v0;
    v6[1] = sub_10001A52C;
    return SFUIPeopleSuggestionImageProvider.previewCornerIcon(for:)(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  }
}

uint64_t sub_10001A52C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(*v2 + 56);
  v5 = *v2;
  *(_QWORD *)(v5 + 64) = v1;
  swift_task_dealloc(v4);
  if (v1)
    return swift_task_switch(sub_10001A5A0, 0, 0);
  else
    return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
}

uint64_t sub_10001A5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = type metadata accessor for Logger(0);
  sub_100008930(v3, (uint64_t)qword_10004FBE0);
  swift_bridgeObjectRetain(v2);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  v4 = swift_errorRetain(v1);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 40);
  if (v7)
  {
    v15 = *(_QWORD *)(v0 + 32);
    v10 = swift_slowAlloc(22, -1);
    v11 = (uint64_t *)swift_slowAlloc(8, -1);
    v16 = swift_slowAlloc(32, -1);
    v17 = v16;
    *(_DWORD *)v10 = 136315394;
    swift_bridgeObjectRetain(v9);
    *(_QWORD *)(v0 + 16) = sub_10002785C(v15, v9, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
    swift_bridgeObjectRelease_n(v9, 3);
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain(v8);
    v12 = _swift_stdlib_bridgeErrorToNSError(v8);
    *(_QWORD *)(v0 + 24) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32);
    *v11 = v12;
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to get image for background activity with bundle ID %s: %@", (uint8_t *)v10, 0x16u);
    v13 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    swift_errorRelease(v8);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 64));
    swift_bridgeObjectRelease_n(v9, 2);
    swift_errorRelease(v8);
    swift_errorRelease(v8);

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_10001A820@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t result;

  ObjectType = swift_getObjectType(v2);
  result = ObservableObject<>.objectWillChange.getter(ObjectType, a1);
  *a2 = result;
  return result;
}

void sub_10001A85C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v11 = v10;
  v87 = a7;
  v80 = a4;
  v81 = a6;
  v83 = a10;
  v84 = a2;
  v16 = sub_1000088F0(&qword_10004F288);
  __chkstk_darwin(v16);
  v86 = (uint64_t)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for UUID(0);
  v88 = *(_QWORD *)(v18 - 8);
  v89 = v18;
  v19 = *(_QWORD *)(v88 + 64);
  v20 = __chkstk_darwin(v18);
  v21 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v20);
  v85 = (char *)&v74 - v23;
  __chkstk_darwin(v22);
  v25 = (char *)&v74 - v24;
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v27 = swift_getKeyPath(&unk_1000361E8);
  static Published.subscript.getter(&v91, v11, KeyPath, v27);
  swift_release(KeyPath);
  swift_release(v27);
  v28 = v91;
  if (*(_QWORD *)(v91 + 16))
  {
    sub_1000280CC(a1);
    v30 = v29;
    swift_bridgeObjectRelease(v28);
    if ((v30 & 1) != 0)
    {
      if (qword_10004ED00 != -1)
        swift_once(&qword_10004ED00, sub_100018BCC);
      v31 = type metadata accessor for Logger(0);
      sub_100008930(v31, (uint64_t)qword_10004FBE0);
      v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 16))(v21, a1, v89);
      v33 = Logger.logObject.getter(v32);
      v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc(12, -1);
        v36 = swift_slowAlloc(32, -1);
        v91 = v36;
        v87 = a1;
        *(_DWORD *)v35 = 136315138;
        v37 = v89;
        v38 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
        v39 = dispatch thunk of CustomStringConvertible.description.getter(v37, v38);
        v41 = v40;
        v90 = sub_10002785C(v39, v40, &v91);
        a1 = v87;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
        swift_bridgeObjectRelease(v41);
        (*(void (**)(char *, uint64_t))(v88 + 8))(v21, v37);
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "BackgroundActivitySessionsController: Received call to start new activity for existing task ID %s, converting to an updateProgress call", v35, 0xCu);
        swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v36, -1, -1);
        swift_slowDealloc(v35, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v88 + 8))(v21, v89);
      }

      sub_10001B050(v83, a1);
      return;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v91);
  }
  v79 = a8;
  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v42 = a9;
  v43 = type metadata accessor for Logger(0);
  sub_100008930(v43, (uint64_t)qword_10004FBE0);
  v78 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
  v78(v25, a1, v89);
  v44 = swift_bridgeObjectRetain_n(a3, 2);
  v45 = Logger.logObject.getter(v44);
  v46 = static os_log_type_t.default.getter();
  v47 = os_log_type_enabled(v45, v46);
  v82 = a9;
  if (v47)
  {
    v48 = swift_slowAlloc(22, -1);
    v74 = swift_slowAlloc(64, -1);
    v91 = v74;
    *(_DWORD *)v48 = 136315394;
    v75 = a5;
    v76 = a3;
    v49 = v89;
    v50 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v51 = dispatch thunk of CustomStringConvertible.description.getter(v49, v50);
    v53 = v52;
    v90 = sub_10002785C(v51, v52, &v91);
    v77 = v11;
    a5 = v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
    swift_bridgeObjectRelease(v53);
    v54 = v49;
    a3 = v76;
    (*(void (**)(char *, uint64_t))(v88 + 8))(v25, v54);
    *(_WORD *)(v48 + 12) = 2080;
    swift_bridgeObjectRetain(a3);
    v90 = sub_10002785C(v84, a3, &v91);
    v11 = v77;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Starting new activity for task ID %s and bundle ID %s", (uint8_t *)v48, 0x16u);
    v55 = v74;
    swift_arrayDestroy(v74, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v55, -1, -1);
    v56 = v48;
    v42 = v82;
    swift_slowDealloc(v56, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v88 + 8))(v25, v89);

    swift_bridgeObjectRelease_n(a3, 2);
  }
  v57 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v86, 1, 1, v57);
  v58 = swift_allocObject(&unk_100046270, 24, 7);
  swift_unknownObjectWeakInit(v58 + 16, v11);
  v78(v85, a1, v89);
  type metadata accessor for MainActor(0);
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(v87);
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(a3);
  swift_retain(v58);
  v59 = v83;
  v60 = static MainActor.shared.getter();
  v61 = a3;
  v62 = v88;
  v63 = *(unsigned __int8 *)(v88 + 80);
  v64 = (v63 + 80) & ~v63;
  v65 = (v19 + v64 + 7) & 0xFFFFFFFFFFFFFFF8;
  v66 = (v65 + 23) & 0xFFFFFFFFFFFFFFF8;
  v67 = (char *)swift_allocObject(&unk_100046388, v66 + 16, v63 | 7);
  *((_QWORD *)v67 + 2) = v60;
  *((_QWORD *)v67 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v67 + 4) = v58;
  *((_QWORD *)v67 + 5) = v59;
  *((_QWORD *)v67 + 6) = v80;
  *((_QWORD *)v67 + 7) = a5;
  v68 = v85;
  *((_QWORD *)v67 + 8) = v84;
  *((_QWORD *)v67 + 9) = v61;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v67[v64], v68, v89);
  v69 = &v67[v65];
  v70 = v87;
  *(_QWORD *)v69 = v81;
  *((_QWORD *)v69 + 1) = v70;
  v71 = &v67[v66];
  v72 = v82;
  *(_QWORD *)v71 = v79;
  *((_QWORD *)v71 + 1) = v72;
  swift_release(v58);
  v73 = sub_100017918(v86, (uint64_t)&unk_10004FE60, (uint64_t)v67);
  swift_release(v73);
}

void sub_10001B050(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000088F0(&qword_10004F288);
  __chkstk_darwin(v9);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v13 = swift_getKeyPath(&unk_1000361E8);
  static Published.subscript.getter(&v39, v2, KeyPath, v13);
  swift_release(KeyPath);
  swift_release(v13);
  v14 = v39;
  if (*(_QWORD *)(v39 + 16) && (v15 = sub_1000280CC(a2), (v16 & 1) != 0))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
    swift_retain(v17);
    swift_bridgeObjectRelease(v14);
    v18 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 1, 1, v18);
    type metadata accessor for MainActor(0);
    swift_retain(v17);
    v19 = a1;
    v20 = static MainActor.shared.getter();
    v21 = (_QWORD *)swift_allocObject(&unk_100046360, 48, 7);
    v21[2] = v20;
    v21[3] = &protocol witness table for MainActor;
    v21[4] = v17;
    v21[5] = v19;
    v22 = sub_100017918((uint64_t)v11, (uint64_t)&unk_10004FE50, (uint64_t)v21);
    swift_release(v22);
    swift_release(v17);
  }
  else
  {
    swift_bridgeObjectRelease(v14);
    if (qword_10004ED00 != -1)
      swift_once(&qword_10004ED00, sub_100018BCC);
    v23 = type metadata accessor for Logger(0);
    sub_100008930(v23, (uint64_t)qword_10004FBE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    v24 = a1;
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc(22, -1);
      v36 = (_QWORD *)swift_slowAlloc(8, -1);
      v37 = swift_slowAlloc(32, -1);
      v39 = v37;
      *(_DWORD *)v27 = 136315394;
      v28 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v29 = dispatch thunk of CustomStringConvertible.description.getter(v5, v28);
      v31 = v30;
      v38 = sub_10002785C(v29, v30, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
      swift_bridgeObjectRelease(v31);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      *(_WORD *)(v27 + 12) = 2112;
      v32 = objc_msgSend(v24, "ns");
      v38 = (uint64_t)v32;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
      v33 = v36;
      *v36 = v32;

      _os_log_impl((void *)&_mh_execute_header, v25, v26, "BackgroundActivitySessionsController: No session found when updating progress for task ID %s to %@", (uint8_t *)v27, 0x16u);
      v34 = sub_1000088F0(&qword_10004FE30);
      swift_arrayDestroy(v33, 1, v34);
      swift_slowDealloc(v33, -1, -1);
      v35 = v37;
      swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v27, -1, -1);

    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    }
  }
}

uint64_t sub_10001B448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)(v8 + 176) = v17;
  *(_QWORD *)(v8 + 184) = v18;
  *(_OWORD *)(v8 + 144) = v15;
  *(_OWORD *)(v8 + 160) = v16;
  *(_QWORD *)(v8 + 128) = a7;
  *(_QWORD *)(v8 + 136) = a8;
  *(_QWORD *)(v8 + 112) = a5;
  *(_QWORD *)(v8 + 120) = a6;
  *(_QWORD *)(v8 + 104) = a4;
  v9 = type metadata accessor for UUID(0);
  *(_QWORD *)(v8 + 192) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 200) = v10;
  *(_QWORD *)(v8 + 208) = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v8 + 216) = static MainActor.shared.getter();
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  *(_QWORD *)(v8 + 224) = v12;
  *(_QWORD *)(v8 + 232) = v13;
  return swift_task_switch(sub_10001B4F8, v12, v13);
}

uint64_t sub_10001B4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 104) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(_QWORD *)(v0 + 240) = Strong;
  if (Strong)
  {
    v3 = Strong;
    v4 = *(_QWORD *)(v0 + 128);
    v5 = *(void **)(v0 + 112);
    KeyPath = swift_getKeyPath(&unk_1000361C0);
    v7 = swift_getKeyPath(&unk_1000361E8);
    static Published.subscript.getter((_QWORD *)(v0 + 72), v3, KeyPath, v7);
    swift_release(v7);
    swift_release(KeyPath);
    v8 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 248) = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRelease(v8);
    *(_QWORD *)(v0 + 256) = objc_msgSend(v5, "ns");
    if (v4)
    {
      v9 = *(_QWORD *)(v0 + 128);
      v10 = (_QWORD *)swift_task_alloc(dword_10004FE74);
      *(_QWORD *)(v0 + 264) = v10;
      *v10 = v0;
      v10[1] = sub_10001B690;
      return sub_100021FFC(*(_QWORD *)(v0 + 120), v9);
    }
    else
    {
      v12 = (_QWORD *)swift_task_alloc(dword_10004FE6C);
      *(_QWORD *)(v0 + 272) = v12;
      *v12 = v0;
      v12[1] = sub_10001BB0C;
      v13 = *(_QWORD *)(v0 + 136);
      v12[5] = *(_QWORD *)(v0 + 144);
      v12[6] = v3;
      v12[4] = v13;
      return swift_task_switch(sub_10001A424, 0, 0);
    }
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 216));
    swift_task_dealloc(*(_QWORD *)(v0 + 208));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10001B690(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  v2[5] = v1;
  v2[6] = a1;
  swift_task_dealloc(v2[33]);
  return swift_task_switch(sub_10001B6E0, v2[28], v2[29]);
}

uint64_t sub_10001B6E0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(_QWORD *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v10;
  char *v11;
  void *v12;

  v1 = *(void **)(v0 + 48);
  v12 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(void **)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  v4 = *(void **)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 144);
  v6 = *(void (**)(_QWORD *, _QWORD))(v0 + 152);
  v8 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 216));
  sub_10001991C(v6, v8, v7, v5, v4, v2, v3, v12, v1);
  sub_100019C48(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 160), *(void **)(v0 + 168), *(_QWORD *)(v0 + 176), *(void **)(v0 + 184), *(void **)(v0 + 256), v1);
  v10 = *(void **)(v0 + 256);
  v11 = *(char **)(v0 + 240);
  if (*(_QWORD *)(v0 + 248))
  {
    objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator], "notificationOccurred:", 0);

  }
  else
  {

    v11[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation] = 1;
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 208));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001BB0C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  v2[7] = v1;
  v2[8] = a1;
  swift_task_dealloc(v2[34]);
  return swift_task_switch(sub_10001BB5C, v2[28], v2[29]);
}

uint64_t sub_10001BB5C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(_QWORD *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v10;
  char *v11;
  void *v12;

  v1 = *(void **)(v0 + 64);
  v12 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(void **)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  v4 = *(void **)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 144);
  v6 = *(void (**)(_QWORD *, _QWORD))(v0 + 152);
  v8 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 216));
  sub_10001991C(v6, v8, v7, v5, v4, v2, v3, v12, v1);
  sub_100019C48(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 160), *(void **)(v0 + 168), *(_QWORD *)(v0 + 176), *(void **)(v0 + 184), *(void **)(v0 + 256), v1);
  v10 = *(void **)(v0 + 256);
  v11 = *(char **)(v0 + 240);
  if (*(_QWORD *)(v0 + 248))
  {
    objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator], "notificationOccurred:", 0);

  }
  else
  {

    v11[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_shouldPlayHapticOnSceneActivation] = 1;
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 208));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[2] = a4;
  v5[3] = a5;
  v6 = type metadata accessor for MainActor(0);
  v5[4] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001C158, v7, v8);
}

uint64_t sub_10001C158()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 32));
  v2 = objc_msgSend(v1, "ns");
  sub_100012788(v2);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10001C260(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t KeyPath;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  int v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _BYTE v60[12];
  int v61;
  os_log_t v62;
  _QWORD *v63;
  _BYTE *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;

  v6 = v5;
  v66 = a1;
  v67 = a3;
  v10 = sub_1000088F0(&qword_10004F288);
  __chkstk_darwin(v10);
  v64 = &v60[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = &v60[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  v18 = &v60[-v17];
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v20 = swift_getKeyPath(&unk_1000361E8);
  v65 = v6;
  static Published.subscript.getter(&v69, v6, KeyPath, v20);
  swift_release(KeyPath);
  swift_release(v20);
  v21 = v69;
  if (v69[2] && (v22 = sub_1000280CC(a5), (v23 & 1) != 0))
  {
    v24 = *(_QWORD *)(v21[7] + 8 * v22);
    swift_retain(v24);
    swift_bridgeObjectRelease(v21);
    if (qword_10004ED00 != -1)
      swift_once(&qword_10004ED00, sub_100018BCC);
    v25 = type metadata accessor for Logger(0);
    sub_100008930(v25, (uint64_t)qword_10004FBE0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16))(v18, a5, v12);
    v26 = a2;
    swift_bridgeObjectRetain_n(a2, 2);
    v27 = swift_bridgeObjectRetain_n(a4, 2);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.default.getter();
    v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      v31 = swift_slowAlloc(32, -1);
      v63 = (_QWORD *)swift_slowAlloc(96, -1);
      v69 = v63;
      *(_DWORD *)v31 = 136315650;
      v32 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v62 = v28;
      v33 = dispatch thunk of CustomStringConvertible.description.getter(v12, v32);
      v61 = v30;
      v35 = v34;
      v68 = sub_10002785C(v33, v34, (uint64_t *)&v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_bridgeObjectRelease(v35);
      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v18, v12);
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      v36 = v66;
      v68 = sub_10002785C(v66, a2, (uint64_t *)&v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_bridgeObjectRelease_n(a2, 3);
      *(_WORD *)(v31 + 22) = 2080;
      swift_bridgeObjectRetain(a4);
      v37 = v67;
      v68 = sub_10002785C(v67, a4, (uint64_t *)&v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_bridgeObjectRelease_n(a4, 3);
      v38 = v62;
      _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v61, "Updating title and subtitle for task identifier %s to title: %s and subtitle: %s", (uint8_t *)v31, 0x20u);
      v39 = v63;
      swift_arrayDestroy(v63, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v39, -1, -1);
      v40 = v31;
      v26 = a2;
      swift_slowDealloc(v40, -1, -1);

    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v18, v12);

      swift_bridgeObjectRelease_n(a4, 2);
      swift_bridgeObjectRelease_n(a2, 2);
      v36 = v66;
      v37 = v67;
    }
    v54 = type metadata accessor for TaskPriority(0);
    v55 = (uint64_t)v64;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v64, 1, 1, v54);
    type metadata accessor for MainActor(0);
    swift_retain(v24);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(a4);
    v56 = v65;
    v57 = static MainActor.shared.getter();
    v58 = (_QWORD *)swift_allocObject(&unk_100046338, 80, 7);
    v58[2] = v57;
    v58[3] = &protocol witness table for MainActor;
    v58[4] = v24;
    v58[5] = v36;
    v58[6] = v26;
    v58[7] = v37;
    v58[8] = a4;
    v58[9] = v56;
    v59 = sub_100017918(v55, (uint64_t)&unk_10004FE40, (uint64_t)v58);
    swift_release(v59);
    swift_release(v24);
  }
  else
  {
    swift_bridgeObjectRelease(v21);
    if (qword_10004ED00 != -1)
      swift_once(&qword_10004ED00, sub_100018BCC);
    v41 = type metadata accessor for Logger(0);
    sub_100008930(v41, (uint64_t)qword_10004FBE0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 16))(v16, a5, v12);
    swift_bridgeObjectRetain_n(a2, 2);
    v42 = swift_bridgeObjectRetain_n(a4, 2);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.error.getter();
    v45 = v44;
    if (os_log_type_enabled(v43, v44))
    {
      v46 = a2;
      v47 = swift_slowAlloc(32, -1);
      v65 = (id)swift_slowAlloc(96, -1);
      v69 = v65;
      *(_DWORD *)v47 = 136315650;
      v48 = sub_1000067D0(&qword_10004EF48, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      LODWORD(v64) = v45;
      v49 = dispatch thunk of CustomStringConvertible.description.getter(v12, v48);
      v50 = a4;
      v52 = v51;
      v68 = sub_10002785C(v49, v51, (uint64_t *)&v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_bridgeObjectRelease(v52);
      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v16, v12);
      *(_WORD *)(v47 + 12) = 2080;
      swift_bridgeObjectRetain(v46);
      v68 = sub_10002785C(v66, v46, (uint64_t *)&v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_bridgeObjectRelease_n(v46, 3);
      *(_WORD *)(v47 + 22) = 2080;
      swift_bridgeObjectRetain(v50);
      v68 = sub_10002785C(v67, v50, (uint64_t *)&v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_bridgeObjectRelease_n(v50, 3);
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v64, "BackgroundActivitySessionsController: No session found when updating name and description for task ID %s to name: %s and description: %s", (uint8_t *)v47, 0x20u);
      v53 = v65;
      swift_arrayDestroy(v65, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v53, -1, -1);
      swift_slowDealloc(v47, -1, -1);

    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v16, v12);

      swift_bridgeObjectRelease_n(a4, 2);
      swift_bridgeObjectRelease_n(a2, 2);
    }
  }
}

uint64_t sub_10001C950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v8[8] = a8;
  v8[9] = v13;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v9 = type metadata accessor for MainActor(0);
  v8[10] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001C9CC, v10, v11);
}

uint64_t sub_10001C9CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t KeyPath;
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
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 80));
  KeyPath = swift_getKeyPath(&unk_100036330);
  v7 = swift_getKeyPath(&unk_100036358);
  static Published.subscript.getter((_QWORD *)(v0 + 16), v5, KeyPath, v7);
  swift_release(v7);
  swift_release(KeyPath);
  v8 = *(_QWORD *)(v0 + 24);
  v34 = *(_QWORD *)(v0 + 16);
  v9 = swift_getKeyPath(&unk_100036378);
  v10 = swift_getKeyPath(&unk_1000363A0);
  static Published.subscript.getter((_QWORD *)(v0 + 16), v5, v9, v10);
  swift_release(v10);
  swift_release(v9);
  v12 = *(_QWORD *)(v0 + 16);
  v11 = *(_QWORD *)(v0 + 24);
  sub_1000134CC(v4, v3, v2, v1);
  v13 = v5 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID;
  v14 = *(_QWORD *)(v5 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  v15 = *(_QWORD *)(v13 + 8);
  v16 = swift_getKeyPath(&unk_100036208);
  v17 = swift_getKeyPath(&unk_100036230);
  swift_bridgeObjectRetain(v15);
  static Published.subscript.getter((_QWORD *)(v0 + 16), v35, v16, v17);
  swift_release(v17);
  swift_release(v16);
  v18 = *(_QWORD *)(v0 + 16);
  if (*(_QWORD *)(v18 + 16) && (v19 = sub_100027FC8(v14, v15), (v20 & 1) != 0))
  {
    v21 = *(_QWORD *)(v0 + 56);
    v36 = *(_QWORD *)(v0 + 64);
    v22 = v12;
    v24 = *(_QWORD *)(v0 + 40);
    v23 = *(_QWORD *)(v0 + 48);
    v25 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v19);
    swift_retain(v25);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v15);
    v26 = v24;
    v12 = v22;
    sub_1000134CC(v26, v23, v21, v36);
    swift_release(v25);
  }
  else
  {
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v15);
  }
  v27 = *(_QWORD *)(v0 + 40);
  v28 = *(_QWORD *)(v0 + 48);
  if (v34 == v27 && v8 == v28)
  {
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v8, v27, v28, 0);
    swift_bridgeObjectRelease(v8);
    if ((v29 & 1) == 0)
    {
      swift_bridgeObjectRelease(v11);
LABEL_15:
      objc_msgSend(*(id *)(*(_QWORD *)(v0 + 72)+ OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_hapticGenerator), "notificationOccurred:", 0);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  v30 = *(_QWORD *)(v0 + 56);
  v31 = *(_QWORD *)(v0 + 64);
  if (v12 != v30 || v11 != v31)
  {
    v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v11, v30, v31, 0);
    swift_bridgeObjectRelease(v11);
    if ((v32 & 1) != 0)
      return (*(uint64_t (**)(void))(v0 + 8))();
    goto LABEL_15;
  }
  swift_bridgeObjectRelease(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10001CD64(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(a1, "setTargetQueue:", *(_QWORD *)(a2 + OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_queue));
  v6 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  objc_msgSend(a1, "setServiceQuality:", v6);

  objc_msgSend(a1, "setInterface:", a3);
  objc_msgSend(a1, "setInterfaceTarget:", a2);
  v7 = swift_allocObject(&unk_100046270, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, a2);
  v16 = sub_100022D64;
  v17 = v7;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10001D150;
  v15 = &unk_100046288;
  v8 = _Block_copy(&v12);
  swift_release(v17);
  objc_msgSend(a1, "setActivationHandler:", v8);
  _Block_release(v8);
  v16 = sub_10001D1A0;
  v17 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10001D150;
  v15 = &unk_1000462B0;
  v9 = _Block_copy(&v12);
  objc_msgSend(a1, "setInterruptionHandler:", v9);
  _Block_release(v9);
  v10 = swift_allocObject(&unk_1000462E8, 24, 7);
  swift_unknownObjectUnownedInit(v10 + 16, a2);
  v16 = sub_100022D90;
  v17 = v10;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10001D150;
  v15 = &unk_100046300;
  v11 = _Block_copy(&v12);
  swift_release(v17);
  objc_msgSend(a1, "setInvalidationHandler:", v11);
  _Block_release(v11);
}

void sub_10001CF6C(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t Strong;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[32];
  _BYTE v19[24];

  v3 = a2 + 16;
  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100008930(v4, (uint64_t)qword_10004FBE0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BackgroundActivitySessionsController: connection activated from client!", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  swift_beginAccess(v3, v19, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v10 = (char *)Strong;
    v11 = objc_msgSend(a1, "remoteTarget");
    if (v11)
    {
      v12 = v11;
      _bridgeAnyObjectToAny(_:)(&v16, v11);
      swift_unknownObjectRelease(v12);
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }
    sub_10000F82C((uint64_t)&v16, (uint64_t)v18, &qword_10004FE20);
    sub_10000F82C((uint64_t)v18, (uint64_t)&v16, &qword_10004FE20);
    if (*((_QWORD *)&v17 + 1))
    {
      v13 = sub_1000088F0(&qword_10004FE28);
      if ((swift_dynamicCast(&v15, &v16, (char *)&type metadata for Any + 8, v13, 6) & 1) != 0)
      {
        v14 = *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient];
        *(_QWORD *)&v10[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = v15;

        swift_unknownObjectRelease(v14);
      }
      else
      {

      }
    }
    else
    {

      sub_1000164F8((uint64_t)&v16, &qword_10004FE20);
    }
  }
}

void sub_10001D150(uint64_t a1, void *a2)
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

id sub_10001D1A0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100008930(v2, (uint64_t)qword_10004FBE0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "BackgroundActivitySessionsController: connection interrupted, reconnecting", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  return objc_msgSend(a1, "activate");
}

uint64_t sub_10001D27C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  char *Strong;
  void *v10;
  char *v11;
  uint64_t v12;

  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100008930(v3, (uint64_t)qword_10004FBE0);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "BackgroundActivitySessionsController: connection invalidated", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  v8 = a2 + 16;
  Strong = (char *)swift_unknownObjectUnownedLoadStrong(v8);
  v10 = *(void **)&Strong[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection];
  *(_QWORD *)&Strong[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection] = 0;

  v11 = (char *)swift_unknownObjectUnownedLoadStrong(v8);
  v12 = *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient];
  *(_QWORD *)&v11[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = 0;

  return swift_unknownObjectRelease(v12);
}

uint64_t sub_10001D390(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_10001D44C(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint8_t *v36;
  uint64_t v37;
  void *v38;
  char *v39;
  uint64_t (*v40)(char *, uint64_t, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;

  v2 = v1;
  v4 = sub_1000088F0(&qword_10004F288);
  __chkstk_darwin(v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for APKDeviceLockState(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v41 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v12 = (char *)&v36 - v11;
  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v13 = type metadata accessor for Logger(0);
  sub_100008930(v13, (uint64_t)qword_10004FBE0);
  v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v14 = v40(v12, a1, v7);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(12, -1);
    v38 = v1;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc(32, -1);
    v37 = a1;
    v20 = v19;
    v43 = v19;
    v39 = v6;
    *(_DWORD *)v18 = 136315138;
    v36 = v18 + 4;
    v21 = sub_1000067D0(&qword_10004FD70, (uint64_t (*)(uint64_t))&type metadata accessor for APKDeviceLockState, (uint64_t)&protocol conformance descriptor for APKDeviceLockState);
    v22 = dispatch thunk of CustomStringConvertible.description.getter(v7, v21);
    v24 = v23;
    v42 = sub_10002785C(v22, v23, &v43);
    v6 = v39;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43);
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Lock state changed to %s", v18, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    v25 = v20;
    a1 = v37;
    swift_slowDealloc(v25, -1, -1);
    v26 = v18;
    v2 = v38;
    swift_slowDealloc(v26, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }

  v27 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 1, 1, v27);
  v28 = v41;
  v40(v41, a1, v7);
  type metadata accessor for MainActor(0);
  v29 = v2;
  v30 = static MainActor.shared.getter();
  v31 = *(unsigned __int8 *)(v8 + 80);
  v32 = (v31 + 40) & ~v31;
  v33 = (char *)swift_allocObject(&unk_1000461A8, v32 + v9, v31 | 7);
  *((_QWORD *)v33 + 2) = v30;
  *((_QWORD *)v33 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v33 + 4) = v29;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v33[v32], v28, v7);
  v34 = sub_100017918((uint64_t)v6, (uint64_t)&unk_10004FD68, (uint64_t)v33);
  return swift_release(v34);
}

uint64_t sub_10001D788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[4] = a4;
  v5[5] = a5;
  v6 = type metadata accessor for APKDeviceLockState(0);
  v5[6] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[7] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[8] = swift_task_alloc(v8);
  v5[9] = swift_task_alloc(v8);
  v9 = type metadata accessor for MainActor(0);
  v5[10] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001D82C, v10, v11);
}

uint64_t sub_10001D82C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 80));
  KeyPath = swift_getKeyPath(&unk_1000361C0);
  v3 = swift_getKeyPath(&unk_1000361E8);
  static Published.subscript.getter((_QWORD *)(v0 + 16), v1, KeyPath, v3);
  swift_release(KeyPath);
  swift_release(v3);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = (uint64_t)sub_100021BFC(v4);
  swift_bridgeObjectRelease(v4);
  v6 = swift_getKeyPath(&unk_100036208);
  v7 = swift_getKeyPath(&unk_100036230);
  static Published.subscript.getter((_QWORD *)(v0 + 24), v1, v6, v7);
  swift_release(v6);
  swift_release(v7);
  v8 = *(_QWORD *)(v0 + 24);
  v9 = sub_100021BFC(v8);
  swift_bridgeObjectRelease(v8);
  sub_10001F6A8((uint64_t)v9);
  v10 = v5;
  if (!((unint64_t)v5 >> 62))
  {
    v11 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v5);
    if (v11)
      goto LABEL_3;
LABEL_15:
    v31 = v10;
    v33 = *(_QWORD *)(v0 + 64);
    v32 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease_n(v31, 2);
    swift_task_dealloc(v32);
    swift_task_dealloc(v33);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v5 < 0)
    v30 = v5;
  else
    v30 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  result = _CocoaArrayWrapper.endIndex.getter(v30);
  v11 = result;
  if (!result)
    goto LABEL_15;
LABEL_3:
  if (v11 >= 1)
  {
    v13 = 0;
    v36 = v11;
    v37 = *(_QWORD *)(v0 + 56);
    v34 = v0;
    v35 = v10 & 0xC000000000000001;
    do
    {
      if (v35)
      {
        v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v10);
      }
      else
      {
        v14 = *(_QWORD *)(v10 + 8 * v13 + 32);
        swift_retain(v14);
      }
      v15 = *(_QWORD **)(v0 + 72);
      v17 = *(_QWORD *)(v0 + 40);
      v16 = *(_QWORD *)(v0 + 48);
      v18 = swift_getKeyPath(&unk_100036250);
      v19 = swift_getKeyPath(&unk_100036278);
      static Published.subscript.getter(v15, v14, v18, v19);
      swift_release(v18);
      swift_release(v19);
      v20 = sub_1000067D0(&qword_10004FD88, (uint64_t (*)(uint64_t))&type metadata accessor for APKDeviceLockState, (uint64_t)&protocol conformance descriptor for APKDeviceLockState);
      LOBYTE(v18) = dispatch thunk of static Equatable.== infix(_:_:)(v17, v15, v16, v20);
      v21 = *(void (**)(_QWORD *, uint64_t))(v37 + 8);
      v21(v15, v16);
      if ((v18 & 1) == 0)
      {
        v23 = *(_QWORD *)(v0 + 64);
        v22 = *(_QWORD **)(v0 + 72);
        v24 = *(_QWORD *)(v0 + 40);
        v25 = *(_QWORD *)(v0 + 48);
        v26 = v10;
        v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
        v27((uint64_t)v22, v24, v25);
        v28 = swift_getKeyPath(&unk_100036250);
        v29 = swift_getKeyPath(&unk_100036278);
        v27(v23, (uint64_t)v22, v25);
        v10 = v26;
        v0 = v34;
        swift_retain(v14);
        static Published.subscript.setter(v23, v14, v28, v29);
        v21(v22, v25);
      }
      swift_release(v14);
      ++v13;
    }
    while (v36 != v13);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001DB3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for APKDeviceLockState(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001DBB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for APKDeviceLockState(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_10004FD64);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_10000A4BC;
  return sub_10001D788(a1, v5, v6, v7, v8);
}

id sub_10001DC4C()
{
  id result;

  result = sub_10001DC68();
  qword_10004FBF8 = (uint64_t)result;
  return result;
}

id sub_10001DC68()
{
  NSString v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v0 = String._bridgeToObjectiveC()();
  v1 = objc_msgSend((id)objc_opt_self(BSMutableServiceInterface), "interfaceWithIdentifier:", v0);

  v2 = (void *)objc_opt_self(BSObjCProtocol);
  v3 = objc_msgSend(v2, "protocolForProtocol:", &OBJC_PROTOCOL___APKActivityProgressUIServer);
  objc_msgSend(v1, "setServer:", v3);

  v4 = objc_msgSend(v2, "protocolForProtocol:", &OBJC_PROTOCOL___APKActivityProgressUIClient);
  objc_msgSend(v1, "setClient:", v4);

  objc_msgSend(v1, "setClientMessagingExpectation:", 0);
  return v1;
}

uint64_t sub_10001DD70@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10001DDAC(a1, (uint64_t)&unk_100036330, (uint64_t)&unk_100036358, a2);
}

uint64_t sub_10001DD84(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001DE38(a1, a2, a3, a4, (uint64_t)&unk_100036330, (uint64_t)&unk_100036358);
}

uint64_t sub_10001DD98@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10001DDAC(a1, (uint64_t)&unk_100036378, (uint64_t)&unk_1000363A0, a2);
}

uint64_t sub_10001DDAC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  _QWORD v11[2];

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(v11, v6, KeyPath, v8);
  swift_release(KeyPath);
  result = swift_release(v8);
  v10 = v11[1];
  *a4 = v11[0];
  a4[1] = v10;
  return result;
}

uint64_t sub_10001DE24(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001DE38(a1, a2, a3, a4, (uint64_t)&unk_100036378, (uint64_t)&unk_1000363A0);
}

uint64_t sub_10001DE38(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  _QWORD v13[2];

  v8 = *a1;
  v7 = a1[1];
  v9 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v11 = swift_getKeyPath(a6);
  v13[0] = v8;
  v13[1] = v7;
  swift_bridgeObjectRetain(v7);
  swift_retain(v9);
  return static Published.subscript.setter(v13, v9, KeyPath, v11);
}

uint64_t sub_10001DEB4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100036298);
  v5 = swift_getKeyPath(&unk_1000362C0);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10001DF30(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100036298);
  v5 = swift_getKeyPath(&unk_1000362C0);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10001DFA0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100036250);
  v5 = swift_getKeyPath(&unk_100036278);
  static Published.subscript.getter(a2, v3, KeyPath, v5);
  swift_release(KeyPath);
  return swift_release(v5);
}

uint64_t sub_10001E008(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v16;

  v4 = type metadata accessor for APKDeviceLockState(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v16 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v16 - v9, a1, v4);
  v12 = *a2;
  KeyPath = swift_getKeyPath(&unk_100036250);
  v14 = swift_getKeyPath(&unk_100036278);
  v11(v8, (uint64_t)v10, v4);
  swift_retain(v12);
  static Published.subscript.setter(v8, v12, KeyPath, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

uint64_t sub_10001E10C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000362E0);
  v5 = swift_getKeyPath(&unk_100036308);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10001E188(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000362E0);
  v5 = swift_getKeyPath(&unk_100036308);
  v8 = v2;
  v6 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_10001E1FC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001E260;
  return v6(a1);
}

uint64_t sub_10001E260()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001E2AC(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_10001E2CC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001E2EC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E310(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10004FD7C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000A4BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10004FD78 + dword_10004FD78))(a1, v4);
}

Swift::Int sub_10001E380(uint64_t a1, uint64_t a2)
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
  sub_1000088F0((uint64_t *)&unk_10004EF30);
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
      swift_unknownObjectRetain(v33);
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

Swift::Int sub_10001E694(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;
  _QWORD v44[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000088F0((uint64_t *)&unk_10004FF40);
  v43 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v42 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v40 = v3;
  v41 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (v14 << 6);
      goto LABEL_34;
    }
    v24 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = (_QWORD *)(v5 + 64);
    v26 = *(_QWORD *)(v42 + 8 * v24);
    ++v14;
    if (!v26)
    {
      v14 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_36;
      v26 = *(_QWORD *)(v42 + 8 * v14);
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_36:
          swift_release(v5);
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v26 = *(_QWORD *)(v42 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            v14 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_45;
            if (v14 >= v41)
              goto LABEL_36;
            v26 = *(_QWORD *)(v42 + 8 * v14);
            ++v27;
            if (v26)
              goto LABEL_33;
          }
        }
        v14 = v27;
      }
    }
LABEL_33:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v14 << 6);
LABEL_34:
    v32 = 16 * v23;
    v33 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v32);
    v35 = *v33;
    v34 = v33[1];
    v36 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v32);
    v37 = *v36;
    v38 = v36[1];
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain(v33[1]);
      swift_bridgeObjectRetain(v38);
    }
    Hasher.init(_seed:)(v44, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v44, v35, v34);
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
      v28 = 0;
      v29 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v30 = v17 == v29;
        if (v17 == v29)
          v17 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v20 = v35;
    v20[1] = v34;
    v21 = (_QWORD *)(*(_QWORD *)(v8 + 56) + v19);
    *v21 = v37;
    v21[1] = v38;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v40;
  v25 = (_QWORD *)(v5 + 64);
  if ((v43 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_10001E9B8(uint64_t a1, uint64_t a2)
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
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t i;
  int v45;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_1000088F0((uint64_t *)&unk_10004EF20);
  v45 = a2;
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_43;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v43 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v41 = v2;
  v42 = (unint64_t)(v13 + 63) >> 6;
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
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v42)
      break;
    v24 = v43;
    v25 = v43[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v42)
        goto LABEL_36;
      v25 = v43[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v42)
        {
LABEL_36:
          swift_release(v10);
          v3 = v41;
          if ((v45 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = v43[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v19 >= v42)
              goto LABEL_36;
            v25 = v43[v19];
            ++v26;
            if (v25)
              goto LABEL_23;
          }
        }
        v19 = v26;
      }
    }
LABEL_23:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v7 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v45 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v28, v6);
      v29 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v22);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v28, v6);
      v29 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v22);
      swift_retain(v29);
    }
    v30 = *(_QWORD *)(v12 + 40);
    v31 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v30, v6, v31);
    v32 = -1 << *(_BYTE *)(v12 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v17 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v17 + 8 * v34);
      }
      while (v38 == -1);
      v20 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v9, v6);
    *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v20) = v29;
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release(v10);
  v3 = v41;
  v24 = v43;
  if ((v45 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v10 + 32);
  if (v39 >= 64)
    bzero(v24, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v39;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_43:
  result = swift_release(v10);
  *v3 = v12;
  return result;
}

Swift::Int sub_10001ED4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v4 = v3;
  v6 = *v3;
  if (*(_QWORD *)(*v3 + 24) <= a1)
    v7 = a1;
  else
    v7 = *(_QWORD *)(*v3 + 24);
  sub_1000088F0(a3);
  v38 = a2;
  v8 = static _DictionaryStorage.resize(original:capacity:move:)(v6, v7, a2);
  v9 = v8;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_43;
  v10 = 1 << *(_BYTE *)(v6 + 32);
  v37 = v6 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & *(_QWORD *)(v6 + 64);
  v36 = (unint64_t)(v10 + 63) >> 6;
  v13 = v8 + 64;
  result = swift_retain(v6);
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v21 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v36)
      break;
    v24 = (_QWORD *)(v6 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v36)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v36)
        {
LABEL_36:
          swift_release(v6);
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v36)
              goto LABEL_36;
            v25 = *(_QWORD *)(v37 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v12 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v22);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain(v31[1]);
      swift_retain(v34);
    }
    Hasher.init(_seed:)(v39, *(_QWORD *)(v9 + 40));
    String.hash(into:)(v39, v33, v32);
    result = Hasher._finalize()();
    v16 = -1 << *(_BYTE *)(v9 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v9 + 16);
  }
  swift_release(v6);
  v24 = (_QWORD *)(v6 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_43:
  result = swift_release(v6);
  *v4 = v9;
  return result;
}

uint64_t sub_10001F05C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100027FC8(a2, a3);
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
    sub_100028ADC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_10001E380(v15, a4 & 1);
  v21 = sub_100027FC8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
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

uint64_t sub_10001F1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_100027FC8(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_100028C90();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease(v21[1]);
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain(a4);
    }
    goto LABEL_14;
  }
  sub_10001E694(v17, a5 & 1);
  v23 = sub_100027FC8(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10001F32C(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1000280CC(a2);
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
      result = swift_release(*(_QWORD *)(v21 + 8 * v14));
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_100028E54();
    goto LABEL_7;
  }
  sub_10001E9B8(v17, a3 & 1);
  v23 = sub_1000280CC(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_10001F610(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_10001F488(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_10001F49C(a1, a2, a3, a4, (void (*)(void))sub_100029084, (uint64_t *)&unk_10004FF50);
}

uint64_t sub_10001F49C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t *a6)
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v9 = v6;
  v14 = *v6;
  v16 = sub_100027FC8(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];
      result = swift_release(*(_QWORD *)(v23 + 8 * v16));
      *(_QWORD *)(v23 + 8 * v16) = a1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a2;
    v27[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v28 = v22[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v22[2] = v30;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_10001ED4C(v19, a4 & 1, a6);
  v25 = sub_100027FC8(a2, a3);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10001F610(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for UUID(0);
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

uint64_t sub_10001F6A8(uint64_t a1)
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
    result = sub_1000219EC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
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

uint64_t sub_10001F860(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_100020D70(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void *sub_10001FA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void (*v27)(char *, uint64_t);
  uint64_t isStackAllocationSafe;
  char v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v32;
  size_t v33;
  void *v34;
  void *v35;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;

  v4 = sub_1000088F0(&qword_10004FB20);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v40 = (char *)&v37 - v12;
  if (*(_QWORD *)(a2 + 16))
  {
    v41 = a1;
    v42 = 0;
    v13 = *(_QWORD *)(a1 + 16);
    swift_bridgeObjectRetain(a1);
    if (v13)
    {
      v14 = 0;
      v38 = v6;
      v39 = (char *)(a2 + 56);
      while (1)
      {
        if (v14 >= v13)
          __break(1u);
        v15 = *(_QWORD *)(v8 + 72);
        v16 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
        v16(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + v15 * v14, v7);
        v42 = v14 + 1;
        v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
        v17(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
          break;
        v37 = v17;
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v40, v6, v7);
        v18 = *(_QWORD *)(a2 + 40);
        v19 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
        v20 = dispatch thunk of Hashable._rawHashValue(seed:)(v18, v7, v19);
        v21 = a2;
        v22 = -1 << *(_BYTE *)(a2 + 32);
        v23 = v20 & ~v22;
        if (((*(_QWORD *)&v39[(v23 >> 3) & 0xFFFFFFFFFFFFF8] >> v23) & 1) != 0)
        {
          v24 = ~v22;
          while (1)
          {
            v16(v11, *(_QWORD *)(v21 + 48) + v23 * v15, v7);
            v25 = sub_1000067D0(&qword_10004FF60, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
            v26 = dispatch thunk of static Equatable.== infix(_:_:)(v11, v40, v7, v25);
            v27 = *(void (**)(char *, uint64_t))(v8 + 8);
            v27(v11, v7);
            if ((v26 & 1) != 0)
              break;
            v23 = (v23 + 1) & v24;
            if (((*(_QWORD *)&v39[(v23 >> 3) & 0xFFFFFFFFFFFFF8] >> v23) & 1) == 0)
              goto LABEL_12;
          }
          isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v27)(v40, v7);
          v29 = *(_BYTE *)(v21 + 32);
          v30 = v29 & 0x3F;
          v31 = (1 << v29) + 63;
          v32 = v31 >> 6;
          v33 = 8 * (v31 >> 6);
          if (v30 <= 0xD
            || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v31 >> 6), 8),
                (_DWORD)isStackAllocationSafe))
          {
            __chkstk_darwin(isStackAllocationSafe);
            memcpy((char *)&v37 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0), v39, v33);
            v34 = sub_1000204C0((unint64_t *)((char *)&v37 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0)), v32, v21, v23, &v41);
            swift_release(v21);
            swift_bridgeObjectRelease(v41);
          }
          else
          {
            v35 = (void *)swift_slowAlloc(v33, -1);
            memcpy(v35, v39, v33);
            v34 = sub_1000204C0((unint64_t *)v35, v32, v21, v23, &v41);
            swift_release(v21);
            swift_bridgeObjectRelease(v41);
            swift_slowDealloc(v35, -1, -1);
          }
          return v34;
        }
        v27 = *(void (**)(char *, uint64_t))(v8 + 8);
LABEL_12:
        v27(v40, v7);
        a1 = v41;
        v14 = v42;
        v13 = *(_QWORD *)(v41 + 16);
        a2 = v21;
        v6 = v38;
        if (v42 == v13)
        {
          v37(v38, 1, 1, v7);
          break;
        }
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    }
    swift_bridgeObjectRelease(a1);
    sub_1000164F8((uint64_t)v6, &qword_10004FB20);
  }
  else
  {
    swift_release(a2);
    return &_swiftEmptySetSingleton;
  }
  return (void *)a2;
}

uint64_t sub_10001FE78(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_1000088F0((uint64_t *)&unk_10004FF70);
  v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 1);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_39;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v39 = (_QWORD *)(v7 + 56);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v37 = v2;
  v38 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  result = swift_retain(v7);
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v19 = v18 | (v16 << 6);
      goto LABEL_26;
    }
    v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
    if (v20 >= v38)
      goto LABEL_35;
    v21 = v39[v20];
    ++v16;
    if (!v21)
    {
      v16 = v20 + 1;
      if (v20 + 1 >= v38)
        goto LABEL_35;
      v21 = v39[v16];
      if (!v21)
      {
        v16 = v20 + 2;
        if (v20 + 2 >= v38)
          goto LABEL_35;
        v21 = v39[v16];
        if (!v21)
          break;
      }
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_26:
    v23 = v7;
    v24 = *(_QWORD *)(v7 + 48);
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
    v26(v6, v24 + v25 * v19, v4);
    v27 = *(_QWORD *)(v9 + 40);
    v28 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
    v29 = -1 << *(_BYTE *)(v9 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v14 + 8 * (v30 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_40;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v14 + 8 * v31);
      }
      while (v35 == -1);
      v17 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(_QWORD *)(v9 + 48) + v17 * v25, v6, v4);
    ++*(_QWORD *)(v9 + 16);
    v7 = v23;
  }
  v22 = v20 + 3;
  if (v22 < v38)
  {
    v21 = v39[v22];
    if (!v21)
    {
      while (1)
      {
        v16 = v22 + 1;
        if (__OFADD__(v22, 1))
          goto LABEL_41;
        if (v16 >= v38)
          goto LABEL_35;
        v21 = v39[v16];
        ++v22;
        if (v21)
          goto LABEL_25;
      }
    }
    v16 = v22;
    goto LABEL_25;
  }
LABEL_35:
  swift_release(v7);
  v2 = v37;
  v36 = 1 << *(_BYTE *)(v7 + 32);
  if (v36 > 63)
    bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v39 = -1 << v36;
  *(_QWORD *)(v7 + 16) = 0;
LABEL_39:
  result = swift_release(v7);
  *v2 = v9;
  return result;
}

Swift::Int sub_1000201E4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000088F0(&qword_10004FF68);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

void *sub_1000204C0(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  void (*v27)(char *, unint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;

  v41 = a2;
  v9 = sub_1000088F0(&qword_10004FB20);
  __chkstk_darwin(v9);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (void *)__chkstk_darwin(v13);
  v19 = *(_QWORD *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v42 = a1;
  v43 = v19 - 1;
  v20 = *a5;
  v21 = a5[1];
  v22 = *(_QWORD *)(*a5 + 16);
  if (v21 == v22)
  {
    v23 = v41;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v11, 1, 1, v12);
LABEL_22:
    sub_1000164F8((uint64_t)v11, &qword_10004FB20);
    swift_retain(a3);
    return (void *)sub_10002086C(v42, v23, v43, a3);
  }
  v47 = a3 + 56;
  v48 = v18;
  v24 = v18;
  v45 = v11;
  v46 = a5;
  v49 = (char *)&v40 - v17;
  while (v21 < v22)
  {
    v26 = *(_QWORD *)(v24 + 72);
    v27 = *(void (**)(char *, unint64_t, uint64_t))(v24 + 16);
    v27(v11, v20 + ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80)) + v26 * v21, v12);
    a5[1] = v21 + 1;
    v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
    v44(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v11, 1, v12) == 1)
    {
      v23 = v41;
      goto LABEL_22;
    }
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v49, v11, v12);
    v28 = *(_QWORD *)(a3 + 40);
    v29 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v30 = dispatch thunk of Hashable._rawHashValue(seed:)(v28, v12, v29);
    v31 = a3;
    v32 = -1 << *(_BYTE *)(a3 + 32);
    v33 = v30 & ~v32;
    if (((*(_QWORD *)(v47 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
    {
      v25 = *(uint64_t (**)(char *, uint64_t))(v24 + 8);
LABEL_5:
      result = (void *)v25(v49, v12);
      a3 = v31;
      a5 = v46;
      goto LABEL_6;
    }
    v34 = ~v32;
    while (1)
    {
      v27(v15, *(_QWORD *)(v31 + 48) + v33 * v26, v12);
      v35 = sub_1000067D0(&qword_10004FF60, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v36 = dispatch thunk of static Equatable.== infix(_:_:)(v15, v49, v12, v35);
      v25 = *(uint64_t (**)(char *, uint64_t))(v48 + 8);
      v25(v15, v12);
      if ((v36 & 1) != 0)
        break;
      v33 = (v33 + 1) & v34;
      if (((*(_QWORD *)(v47 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
        goto LABEL_5;
    }
    result = (void *)v25(v49, v12);
    v37 = (v33 >> 3) & 0x1FFFFFFFFFFFFFF8;
    v38 = *(unint64_t *)((char *)v42 + v37);
    *(unint64_t *)((char *)v42 + v37) = v38 & ~(1 << v33);
    a5 = v46;
    if ((v38 & (1 << v33)) == 0)
    {
      a3 = v31;
LABEL_6:
      v24 = v48;
      goto LABEL_7;
    }
    v39 = v43 - 1;
    v24 = v48;
    if (__OFSUB__(v43, 1))
      goto LABEL_25;
    a3 = v31;
    --v43;
    if (!v39)
      return &_swiftEmptySetSingleton;
LABEL_7:
    v20 = *a5;
    v21 = a5[1];
    v22 = *(_QWORD *)(*a5 + 16);
    v11 = v45;
    if (v21 == v22)
    {
      v23 = v41;
      v44(v45, 1, 1, v12);
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10002086C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release(a4);
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  v40 = v9;
  sub_1000088F0((uint64_t *)&unk_10004FF70);
  result = static _SetStorage.allocate(capacity:)(a3);
  v12 = result;
  v38 = a1;
  v39 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 56;
  v17 = v40;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v20 >= v39)
      {
LABEL_37:
        swift_release(a4);
        return v12;
      }
      v21 = v38[v20];
      ++v15;
      if (!v21)
      {
        v15 = v20 + 1;
        if (v20 + 1 >= v39)
          goto LABEL_37;
        v21 = v38[v15];
        if (!v21)
        {
          v15 = v20 + 2;
          if (v20 + 2 >= v39)
            goto LABEL_37;
          v21 = v38[v15];
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v39)
              goto LABEL_37;
            v21 = v38[v22];
            if (!v21)
            {
              while (1)
              {
                v15 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v15 >= v39)
                  goto LABEL_37;
                v21 = v38[v15];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v15 = v22;
          }
        }
      }
LABEL_24:
      v14 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v15 << 6);
    }
    v23 = a4;
    v24 = *(_QWORD *)(a4 + 48);
    v25 = *(_QWORD *)(v17 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v11, v24 + v25 * v19, v8);
    v26 = *(_QWORD *)(v12 + 40);
    v27 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v26, v8, v27);
    v28 = -1 << *(_BYTE *)(v12 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) != 0)
    {
      v31 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      v17 = v40;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v28) >> 6;
      v17 = v40;
      do
      {
        if (++v30 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v34 = v30 == v33;
        if (v30 == v33)
          v30 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v30);
      }
      while (v35 == -1);
      v31 = __clz(__rbit64(~v35)) + (v30 << 6);
    }
    *(_QWORD *)(v16 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(_QWORD *)(v12 + 48) + v31 * v25, v11, v8);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v23;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100020B6C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = a1;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10001FE78(v12);
  }
  else
  {
    if (v11 > v10)
    {
      sub_100020F08();
      goto LABEL_12;
    }
    sub_1000212DC(v12);
  }
  v13 = *v3;
  v14 = *(_QWORD *)(*v3 + 40);
  v15 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  v17 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v18 = ~v17;
    v19 = *(_QWORD *)(v7 + 72);
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(_QWORD *)(v13 + 48) + v19 * a2, v6);
      v21 = sub_1000067D0(&qword_10004FF60, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v18;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v23 = v30;
  v24 = *v29;
  *(_QWORD *)(*v29 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v7 + 72) * a2, v23, v6);
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (!v27)
  {
    *(_QWORD *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

uint64_t sub_100020D70(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_1000201E4(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_10002112C();
      goto LABEL_22;
    }
    sub_100021604(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_100020F08()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000088F0((uint64_t *)&unk_10004FF70);
  v6 = *v0;
  v7 = static _SetStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release(v6);
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_10002112C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1000088F0(&qword_10004FF68);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000212DC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_1000088F0((uint64_t *)&unk_10004FF70);
  v9 = static _SetStorage.resize(original:capacity:move:)(v8, a1, 0);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release(v8);
LABEL_37:
    *v2 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 56);
  v35 = v2;
  v36 = v8 + 56;
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v37 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 56;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_26;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v21 >= v37)
      goto LABEL_35;
    v22 = *(_QWORD *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v37)
        goto LABEL_35;
      v22 = *(_QWORD *)(v36 + 8 * v17);
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v37)
          goto LABEL_35;
        v22 = *(_QWORD *)(v36 + 8 * v17);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v14 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_26:
    v24 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v24 * v20, v4);
    v25 = *(_QWORD *)(v10 + 40);
    v26 = sub_1000067D0(&qword_10004FEA0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v25, v4, v26);
    v27 = -1 << *(_BYTE *)(v10 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v32 = v29 == v31;
        if (v29 == v31)
          v29 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v15 + 8 * v29);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v18 * v24, v7, v4);
    ++*(_QWORD *)(v10 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_35:
    result = swift_release_n(v8, 2);
    v2 = v35;
    goto LABEL_37;
  }
  v22 = *(_QWORD *)(v36 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v37)
      goto LABEL_35;
    v22 = *(_QWORD *)(v36 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_39:
  __break(1u);
  return result;
}

Swift::Int sub_100021604(uint64_t a1)
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
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000088F0(&qword_10004FF68);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

void (*sub_1000218B0(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_100021930(v6, a2, a3);
  return sub_100021904;
}

void sub_100021904(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_100021930(uint64_t *result, unint64_t a2, uint64_t a3)
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
    return (uint64_t *)sub_10002199C;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002199C(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t sub_1000219A4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100018CC8(a1, (uint64_t)&unk_1000361C0, (uint64_t)&unk_1000361E8, a2);
}

uint64_t sub_1000219C8(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100018D54(a1, a2, a3, a4, (uint64_t)&unk_1000361C0, (uint64_t)&unk_1000361E8);
}

uint64_t sub_1000219EC(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_100008E7C(&qword_10004FD98, &qword_10004FD90, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_1000088F0(&qword_10004FD90);
          v13 = sub_1000218B0(v18, i, a3);
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
    type metadata accessor for BackgroundActivitySession(0);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_QWORD *sub_100021BFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_1000088F0(&qword_10004FDA0);
  v4 = (_QWORD *)swift_allocObject(v3, 8 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 25;
  v4[2] = v1;
  v4[3] = (2 * (v6 >> 3)) | 1;
  v7 = sub_100021D3C((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100021D34(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_100021CE4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100018CC8(a1, (uint64_t)&unk_100036208, (uint64_t)&unk_100036230, a2);
}

uint64_t sub_100021D08(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100018D54(a1, a2, a3, a4, (uint64_t)&unk_100036208, (uint64_t)&unk_100036230);
}

uint64_t sub_100021D34(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100021D3C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      swift_retain(v20);
      goto LABEL_38;
    }
    ++v11;
    result = swift_retain(v20);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100021F44(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_100021FAC;
  return v5(v2 + 16);
}

uint64_t sub_100021FAC()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_100021FFC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[19] = a1;
  v2[20] = a2;
  v3 = sub_1000088F0(&qword_10004F288);
  v2[21] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v2[22] = v4;
  v2[23] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v2[24] = v5;
  v2[25] = v6;
  return swift_task_switch(sub_100022090, v5, v6);
}

uint64_t sub_100022090()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0 + 2;
  v2 = v0[20];
  v3 = objc_msgSend((id)objc_opt_self(ISImageDescriptor), "imageDescriptorNamed:", kISImageDescriptorHomeScreen);
  v0[26] = v3;
  v4 = objc_allocWithZone((Class)ISIcon);
  swift_bridgeObjectRetain(v2);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  v6 = objc_msgSend(v4, "initWithType:", v5);
  v0[27] = v6;

  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_1000221C0;
  v7 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v8 = v0 + 10;
  v8[1] = 0x40000000;
  v8[2] = sub_10001A2EC;
  v8[3] = &unk_1000463A0;
  v8[4] = v7;
  objc_msgSend(v6, "getImageForImageDescriptor:completion:", v3, v8);
  return swift_continuation_await(v1);
}

uint64_t sub_1000221C0()
{
  uint64_t v0;

  return swift_task_switch(sub_100022204, *(_QWORD *)(*(_QWORD *)v0 + 192), *(_QWORD *)(*(_QWORD *)v0 + 200));
}

void sub_100022204()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;

  v1 = *(void **)(v0 + 120);
  *(_QWORD *)(v0 + 224) = v1;
  if (!v1)
    goto LABEL_4;
  v2 = v1;
  if ((objc_msgSend(v2, "placeholder") & 1) != 0)
  {

LABEL_4:
    v4 = *(void **)(v0 + 208);
    v3 = *(void **)(v0 + 216);
    v5 = *(_QWORD *)(v0 + 168);
    v6 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
    v7 = v3;
    v8 = v4;
    v9 = static MainActor.shared.getter();
    v10 = (_QWORD *)swift_allocObject(&unk_1000463C8, 48, 7);
    v10[2] = v9;
    v10[3] = &protocol witness table for MainActor;
    v10[4] = v7;
    v10[5] = v8;
    v11 = sub_100017A64(v5, (uint64_t)&unk_10004FE80, (uint64_t)v10);
    *(_QWORD *)(v0 + 232) = v11;
    v12 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
    *(_QWORD *)(v0 + 240) = v12;
    v13 = sub_1000088F0(&qword_10004FE88);
    *v12 = v0;
    v12[1] = sub_1000223D4;
    Task<>.value.getter(v0 + 128, v11, v13);
    return;
  }
  swift_release(*(_QWORD *)(v0 + 184));
  v14 = objc_msgSend(v2, "CGImage");
  if (v14)
  {
    v15 = v14;
    v17 = *(void **)(v0 + 208);
    v16 = *(void **)(v0 + 216);
    objc_msgSend(v2, "scale");
    v19 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:scale:orientation:", v15, 0, v18);

    swift_task_dealloc(*(_QWORD *)(v0 + 168));
    (*(void (**)(id))(v0 + 8))(v19);
  }
  else
  {

    __break(1u);
  }
}

uint64_t sub_1000223D4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 232);
  swift_task_dealloc(*(_QWORD *)(*v0 + 240));
  swift_release(v2);
  return swift_task_switch(sub_100022428, *(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 200));
}

void sub_100022428()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  unint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v1 = *(void **)(v0 + 224);
  swift_release(*(_QWORD *)(v0 + 184));

  v2 = *(void **)(v0 + 128);
  if (!v2)
  {
    if (qword_10004ED00 != -1)
      swift_once(&qword_10004ED00, sub_100018BCC);
    v13 = *(_QWORD *)(v0 + 160);
    v14 = type metadata accessor for Logger(0);
    sub_100008930(v14, (uint64_t)qword_10004FBE0);
    v15 = swift_bridgeObjectRetain_n(v13, 2);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(void **)(v0 + 208);
    v20 = *(_QWORD *)(v0 + 160);
    if (v18)
    {
      v21 = *(_QWORD *)(v0 + 152);
      v31 = *(void **)(v0 + 216);
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      v32 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain(v20);
      *(_QWORD *)(v0 + 136) = sub_10002785C(v21, v20, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144);
      swift_bridgeObjectRelease_n(v20, 3);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Could not prepare image for type %s", v22, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v20, 2);
    }
    v24 = 0;
    goto LABEL_17;
  }
  v3 = v2;
  if (objc_msgSend(v3, "placeholder"))
  {
    if (qword_10004ED00 != -1)
      swift_once(&qword_10004ED00, sub_100018BCC);
    v4 = *(_QWORD *)(v0 + 160);
    v5 = type metadata accessor for Logger(0);
    sub_100008930(v5, (uint64_t)qword_10004FBE0);
    v6 = swift_bridgeObjectRetain_n(v4, 2);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.error.getter();
    v9 = os_log_type_enabled(v7, v8);
    v10 = *(_QWORD *)(v0 + 160);
    if (v9)
    {
      v30 = *(_QWORD *)(v0 + 152);
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      v32 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain(v10);
      *(_QWORD *)(v0 + 144) = sub_10002785C(v30, v10, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152);
      swift_bridgeObjectRelease_n(v10, 3);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Final image for type %s is still a placeholder", v11, 0xCu);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 160), 2);
    }

  }
  v25 = objc_msgSend(v3, "CGImage");
  if (v25)
  {
    v26 = v25;
    v28 = *(void **)(v0 + 208);
    v27 = *(void **)(v0 + 216);
    objc_msgSend(v3, "scale");
    v24 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:scale:orientation:", v26, 0, v29);

LABEL_17:
    swift_task_dealloc(*(_QWORD *)(v0 + 168));
    (*(void (**)(id))(v0 + 8))(v24);
    return;
  }

  __break(1u);
}

void sub_100022844(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  void **v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void ***v9;
  void **v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSString v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char *v21;
  id v22;
  void *v23;
  void **v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  void **aBlock;
  _QWORD v37[4];
  uint64_t v38;

  v2 = v1;
  if (qword_10004ED00 != -1)
    swift_once(&qword_10004ED00, sub_100018BCC);
  v4 = type metadata accessor for Logger(0);
  sub_100008930(v4, (uint64_t)qword_10004FBE0);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (void ***)swift_slowAlloc(8, -1);
    v32 = v1;
    *(_DWORD *)v8 = 138412290;
    aBlock = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v37);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BackgroundActivitySessionsController received a connection! %@", v8, 0xCu);
    v11 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  if (qword_10004ED10 != -1)
    swift_once(&qword_10004ED10, sub_10001DC4C);
  v12 = (void *)qword_10004FBF8;
  v13 = objc_msgSend(v5, "remoteProcess", v32);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "hasEntitlement:", v14);

  if (v15)
  {
    v17 = swift_allocObject(&unk_1000461F8, 32, 7);
    *(_QWORD *)(v17 + 16) = v2;
    *(_QWORD *)(v17 + 24) = v12;
    v18 = swift_allocObject(&unk_100046220, 32, 7);
    *(_QWORD *)(v18 + 16) = sub_100022D10;
    *(_QWORD *)(v18 + 24) = v17;
    v37[3] = sub_10000A35C;
    v38 = v18;
    aBlock = _NSConcreteStackBlock;
    v37[0] = 1107296256;
    v37[1] = sub_1000195B8;
    v37[2] = &unk_100046238;
    v19 = _Block_copy(&aBlock);
    v20 = v38;
    v21 = v2;
    v22 = v12;
    swift_retain(v18);
    swift_release(v20);
    objc_msgSend(v5, "configureConnection:", v19);
    _Block_release(v19);
    LOBYTE(v19) = swift_isEscapingClosureAtFileLocation(v18, "", 113, 297, 34, 1);
    swift_release(v18);
    if ((v19 & 1) == 0)
    {
      objc_msgSend(v5, "activate");
      v23 = *(void **)&v21[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection];
      *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_connection] = v5;
      v24 = v5;

      v25 = objc_msgSend(v24, "remoteTarget");
      if (v25)
      {
        v26 = v25;
        _bridgeAnyObjectToAny(_:)(&v34, v25);
        swift_unknownObjectRelease(v26);
      }
      else
      {
        v34 = 0u;
        v35 = 0u;
      }
      sub_10000F82C((uint64_t)&v34, (uint64_t)&aBlock, &qword_10004FE20);
      sub_10000F82C((uint64_t)&aBlock, (uint64_t)&v34, &qword_10004FE20);
      if (*((_QWORD *)&v35 + 1))
      {
        v30 = sub_1000088F0(&qword_10004FE28);
        if ((swift_dynamicCast(&v33, &v34, (char *)&type metadata for Any + 8, v30, 6) & 1) != 0)
        {
          v31 = *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient];
          *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = v33;
LABEL_21:
          swift_release(v17);
          swift_unknownObjectRelease(v31);
          return;
        }
      }
      else
      {
        sub_1000164F8((uint64_t)&v34, &qword_10004FE20);
      }
      v31 = *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient];
      *(_QWORD *)&v21[OBJC_IVAR____TtC18ActivityProgressUI36BackgroundActivitySessionsController_activityProgressUIClient] = 0;
      goto LABEL_21;
    }
    __break(1u);
  }
  else
  {
    v27 = Logger.logObject.getter(v16);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "BackgroundActivitySessionsController got a connection from an un-entitled process!", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

  }
}

uint64_t sub_100022CE4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100022D10(void *a1)
{
  uint64_t v1;

  sub_10001CD64(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100022D18()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022D28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100022D38(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100022D40()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100022D64(void *a1)
{
  uint64_t v1;

  sub_10001CF6C(a1, v1);
}

uint64_t sub_100022D6C()
{
  uint64_t v0;

  swift_unknownObjectUnownedDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022D90(uint64_t a1)
{
  uint64_t v1;

  return sub_10001D27C(a1, v1);
}

uint64_t sub_100022D98()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));

  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100022DDC(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_10004FE3C);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_10000A4BC;
  return sub_10001C950(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100022E7C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10001DDAC(a1, (uint64_t)&unk_100036330, (uint64_t)&unk_100036358, a2);
}

uint64_t sub_100022EA0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001DE38(a1, a2, a3, a4, (uint64_t)&unk_100036330, (uint64_t)&unk_100036358);
}

uint64_t sub_100022EC4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10001DDAC(a1, (uint64_t)&unk_100036378, (uint64_t)&unk_1000363A0, a2);
}

uint64_t sub_100022EE8(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10001DE38(a1, a2, a3, a4, (uint64_t)&unk_100036378, (uint64_t)&unk_1000363A0);
}

uint64_t sub_100022F0C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022F40(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10004FE4C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000A4BC;
  return sub_10001C0EC(a1, v4, v5, v7, v6);
}

uint64_t sub_100022FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 80) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_100023080(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  type metadata accessor for UUID(0);
  v11 = v1[2];
  v10 = v1[3];
  v9 = v1[4];
  v3 = v1[6];
  v8 = v1[5];
  v4 = v1[7];
  v5 = v1[8];
  v6 = (_QWORD *)swift_task_alloc(dword_10004FE5C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000A2F8;
  return sub_10001B448(a1, v11, v10, v9, v8, v3, v4, v5);
}

uint64_t sub_10002317C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000231B0(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10004FE7C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000A4BC;
  return sub_10001A33C(a1, v4, v5, v7, v6);
}

uint64_t sub_100023228(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10004FE94);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000A2F8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10004FE90 + dword_10004FE90))(a1, v4);
}

unint64_t sub_100023298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004FB48;
  if (!qword_10004FB48)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10004FB48);
  }
  return result;
}

id sub_1000232D4(void *a1)
{
  uint64_t v1;

  return sub_10001950C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1000232DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t View.systemApertureAccessoryLayoutMode(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_10002332C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(_QWORD *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  uint64_t v12;

  v2 = type metadata accessor for LayoutSubviews(0);
  v3 = sub_1000067D0(&qword_100050198, (uint64_t (*)(uint64_t))&type metadata accessor for LayoutSubviews, (uint64_t)&protocol conformance descriptor for LayoutSubviews);
  dispatch thunk of Collection.startIndex.getter(&v12, v2, v3);
  dispatch thunk of Collection.endIndex.getter(v11, v2, v3);
  if (v12 == v11[0])
  {
    v4 = type metadata accessor for LayoutSubview(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
  else
  {
    v6 = (void (*)(_QWORD *, _QWORD))dispatch thunk of Collection.subscript.read(v11, &v12, v2, v3);
    v8 = v7;
    v9 = type metadata accessor for LayoutSubview(0);
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a1, v8, v9);
    v6(v11, 0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
}

uint64_t sub_100023444(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 != *(_QWORD *)a2)
    return 0;
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return *(unsigned __int8 *)(a1 + 16) ^ *(unsigned __int8 *)(a2 + 16) ^ 1u;
  return 0;
}

double sub_100023480@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  double result;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];

  KeyPath = swift_getKeyPath(&unk_100036758);
  v4 = swift_getKeyPath(&unk_100036780);
  static Published.subscript.getter(v8, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  result = *(double *)v8;
  v6 = v8[1];
  v7 = v8[2];
  *a1 = v8[0];
  a1[1] = v6;
  a1[2] = v7;
  return result;
}

uint64_t sub_100023500(double *a1, double *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return static EdgeInsets.== infix(_:_:)(a1[2], a1[3], a1[4], a1[5], a2[2], a2[3], a2[4], a2[5]);
  else
    return 0;
}

uint64_t sub_100023530()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100036710);
  v2 = swift_getKeyPath(&unk_100036738);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_1000235A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC18ActivityProgressUI29APUISystemApertureLayoutState__metrics;
  v2 = sub_1000088F0(&qword_100050150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC18ActivityProgressUI29APUISystemApertureLayoutState__context;
  v4 = sub_1000088F0(&qword_100050158);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100023624@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for APUISystemApertureLayoutState(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100023660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static DynamicProperty._makeProperty<A>(in:container:fieldOffset:inputs:)(a1, a2, a3, a4, a6, a5);
}

uint64_t sub_100023678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  ValueMetadata *v20;
  char v21;
  char v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  _OWORD *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t OpaqueTypeConformance2;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  _OWORD *v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  ValueMetadata *v66;
  uint64_t v67;
  unint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  char v73;

  v63 = a1;
  v64 = a2;
  v3 = sub_1000088F0(&qword_1000500E0);
  __chkstk_darwin(v3);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000088F0(&qword_1000500E8);
  __chkstk_darwin(v6);
  v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_1000088F0(&qword_1000500F0);
  v9 = *(_QWORD *)(v62 - 8);
  v10 = __chkstk_darwin(v62);
  v61 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v55 - v12;
  v14 = *(_QWORD *)v2;
  v15 = *(_BYTE *)(v2 + 8);
  sub_10002492C(*(_QWORD *)v2, v15);
  v16 = sub_100024E7C(v14, v15);
  sub_10002493C(v14, v15);
  if ((v16 & 1) == 0)
  {
    v28 = *(_OWORD *)(v2 + 32);
    v69 = *(_OWORD *)(v2 + 16);
    v70 = v28;
    v72 = *(_QWORD *)(v2 + 16);
    v73 = *(_BYTE *)(v2 + 24);
    v71 = v28;
    v29 = *(_QWORD *)(v2 + 56);
    v30 = (_OWORD *)swift_allocObject(&unk_1000467F0, 80, 7);
    v31 = *(_OWORD *)(v2 + 16);
    v30[1] = *(_OWORD *)v2;
    v30[2] = v31;
    v32 = *(_OWORD *)(v2 + 48);
    v30[3] = *(_OWORD *)(v2 + 32);
    v30[4] = v32;
    v33 = sub_1000088F0(&qword_1000500F8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v5, v63, v33);
    v34 = &v5[*(int *)(v3 + 36)];
    *(_QWORD *)v34 = 0;
    *((_QWORD *)v34 + 1) = 0;
    *((_QWORD *)v34 + 2) = sub_100025038;
    *((_QWORD *)v34 + 3) = v30;
    sub_100009050((uint64_t)v5, (uint64_t)v8, &qword_1000500E0);
    swift_storeEnumTagMultiPayload(v8, v6, 1);
    sub_10002492C(v14, v15);
    sub_100025058((uint64_t)&v72);
    sub_100025084(&v71);
    v35 = sub_100008E7C(&qword_100050100, &qword_1000500F8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v36 = sub_1000250AC();
    swift_retain(v29);
    v65 = v33;
    v66 = &type metadata for APUISystemApertureLayoutState.Context;
    v67 = v35;
    v68 = v36;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v65, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
    v38 = sub_1000250F0();
    _ConditionalContent<>.init(storage:)(v8, v62, v3, OpaqueTypeConformance2, v38);
    return sub_1000164F8((uint64_t)v5, &qword_1000500E0);
  }
  v57 = v13;
  v58 = v9;
  v59 = v6;
  v56 = v8;
  v17 = v62;
  v18 = *(_QWORD *)(v2 + 16);
  v19 = *(_QWORD *)(v2 + 32);
  v20 = *(ValueMetadata **)(v2 + 40);
  v21 = *(_BYTE *)(v2 + 24) & 1;
  sub_10002492C(v18, v21);
  v22 = sub_100024E7C(v18, v21);
  sub_10002493C(v18, v21);
  v60 = v3;
  if ((v22 & 1) != 0)
  {
    if (!v19)
    {
      v53 = type metadata accessor for APUISystemApertureLayoutState(0);
      v54 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
      result = EnvironmentObject.error()(0, v20, v53, v54);
      __break(1u);
      return result;
    }
    KeyPath = swift_getKeyPath(&unk_100036710);
    v24 = swift_getKeyPath(&unk_100036738);
    v25 = swift_retain(v19);
    static Published.subscript.getter(&v69, v25, KeyPath, v24);
    swift_release(v19);
    swift_release(KeyPath);
    swift_release(v24);
    v26 = v69;
    v27 = v70;
  }
  else
  {
    v27 = 0;
    v26 = 0uLL;
  }
  v69 = v26;
  LOBYTE(v70) = v27;
  v65 = v19;
  v66 = v20;
  v40 = *(_QWORD *)(v2 + 56);
  v41 = (_OWORD *)swift_allocObject(&unk_100046818, 80, 7);
  v42 = *(_OWORD *)(v2 + 16);
  v41[1] = *(_OWORD *)v2;
  v41[2] = v42;
  v43 = *(_OWORD *)(v2 + 48);
  v41[3] = *(_OWORD *)(v2 + 32);
  v41[4] = v43;
  sub_10002492C(v14, v15);
  sub_10002492C(v18, v21);
  sub_100025084(&v65);
  swift_retain(v40);
  v44 = sub_1000088F0(&qword_1000500F8);
  v45 = sub_100008E7C(&qword_100050100, &qword_1000500F8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
  v46 = sub_1000250AC();
  v47 = v61;
  View.onChange<A>(of:initial:_:)(&v69, 0, sub_1000251BC, v41, v44, &type metadata for APUISystemApertureLayoutState.Context, v45, v46);
  swift_release(v41);
  v49 = v57;
  v48 = v58;
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v57, v47, v17);
  v50 = v56;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v56, v49, v17);
  swift_storeEnumTagMultiPayload(v50, v59, 0);
  *(_QWORD *)&v69 = v44;
  *((_QWORD *)&v69 + 1) = &type metadata for APUISystemApertureLayoutState.Context;
  *(_QWORD *)&v70 = v45;
  *((_QWORD *)&v70 + 1) = v46;
  v51 = swift_getOpaqueTypeConformance2(&v69, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v52 = sub_1000250F0();
  _ConditionalContent<>.init(storage:)(v50, v17, v60, v51, v52);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v49, v17);
}

uint64_t sub_100023B90()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t View.onDismiss(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  KeyPath = swift_getKeyPath(&unk_1000363E0);
  v9 = swift_getKeyPath(&unk_1000363E0);
  v10 = type metadata accessor for APUISystemApertureLayoutState(0);
  v11 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  swift_retain(a2);
  v12 = EnvironmentObject.init()(v10, v11);
  v15 = KeyPath;
  v16 = 0;
  v17 = v9;
  v18 = 0;
  v19 = v12;
  v20 = v13;
  v21 = a1;
  v22 = a2;
  View.modifier<A>(_:)(&v15, a3, &type metadata for APUISystemApertureDismissalModifier, a4);
  swift_release(a2);
  swift_release(v9);
  swift_release(KeyPath);
  return swift_release(v12);
}

uint64_t type metadata accessor for APUISystemApertureLayoutState(uint64_t a1)
{
  uint64_t result;

  result = qword_10004FFC8;
  if (!qword_10004FFC8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for APUISystemApertureLayoutState);
  return result;
}

uint64_t sub_100023CFC(uint64_t a1, char a2, double a3, double a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  _BYTE v27[32];

  v12 = sub_1000088F0(&qword_100050190);
  __chkstk_darwin(v12);
  v14 = &v27[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = type metadata accessor for LayoutSubview(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = &v27[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002332C((uint64_t)v14);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    return sub_1000164F8((uint64_t)v14, &qword_100050190);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v16 + 32))(v18, v14, v15);
  v27[24] = a2 & 1;
  v27[16] = a6 & 1;
  v20 = LayoutSubview.sizeThatFits(_:)(a1);
  v21 = *(double *)(v6 + 8) - *(double *)(v6 + 16) + a4;
  v22 = v20;
  v24 = v23;
  v25 = static UnitPoint.topLeading.getter();
  v27[8] = 0;
  v27[0] = 0;
  LayoutSubview.place(at:anchor:proposal:)(*(_QWORD *)&v22, 0, v24, 0, a3, v21, v25, v26);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v16 + 8))(v18, v15);
}

double sub_100023EAC(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_100025B9C(a1, a2 & 1, a3, a4 & 1);
}

uint64_t sub_100023EC4(uint64_t a1, char a2, uint64_t a3, char a4, double a5, double a6)
{
  return sub_100023CFC(a1, a2 & 1, a5, a6, a3, a4 & 1);
}

uint64_t sub_100023EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100023F34(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_100023F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100023F34(a1, a2, a3, a4, a5, a6, a7, a8, a9, (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_100023F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_100023F70(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_100021904;
}

uint64_t sub_100023FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  __n128 v19;
  __n128 v20;
  uint64_t KeyPath;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t result;
  void (*v33)(char *, uint64_t, uint64_t, __n128, __n128);
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[3];

  v38 = a5;
  v39 = a1;
  v41 = a6;
  v9 = sub_1000088F0(&qword_100050118);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000088F0(&qword_100050120);
  __chkstk_darwin(v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_1000088F0(&qword_100050128);
  __chkstk_darwin(v40);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3 &= 1u;
  sub_10002492C(a2, a3);
  v18 = sub_100024E7C(a2, a3);
  sub_10002493C(a2, a3);
  if ((v18 & 1) != 0)
  {
    if (!a4)
    {
      v36 = type metadata accessor for APUISystemApertureLayoutState(0);
      v37 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
      result = EnvironmentObject.error()(0, v38, v36, v37);
      __break(1u);
      return result;
    }
    KeyPath = swift_getKeyPath(&unk_100036758);
    v22 = swift_getKeyPath(&unk_100036780);
    v23 = swift_retain(a4);
    static Published.subscript.getter(v42, v23, KeyPath, v22);
    swift_release(a4);
    swift_release(KeyPath);
    swift_release(v22);
    v20.n128_u64[0] = *(_QWORD *)&v42[0];
    v19.n128_u64[0] = 1.0;
    if (*(double *)v42 >= 1.0)
    {
      v20.n128_u64[0] = *((_QWORD *)&v42[0] + 1);
      if (*((double *)v42 + 1) >= 1.0)
      {
        v24 = swift_getKeyPath(&unk_100036758);
        v25 = swift_getKeyPath(&unk_100036780);
        v26 = swift_retain(a4);
        static Published.subscript.getter(v42, v26, v24, v25);
        swift_release(a4);
        swift_release(v24);
        swift_release(v25);
        v27 = v42[1];
        v28 = v42[2];
        *(_OWORD *)v17 = v42[0];
        *((_OWORD *)v17 + 1) = v27;
        *((_OWORD *)v17 + 2) = v28;
        v29 = v40;
        (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(&v17[*(int *)(v40 + 44)], v39, v9);
        sub_100009050((uint64_t)v17, (uint64_t)v15, &qword_100050128);
        swift_storeEnumTagMultiPayload(v15, v13, 0);
        v30 = sub_1000253C0();
        v31 = sub_100008E7C(&qword_100050148, &qword_100050118, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
        _ConditionalContent<>.init(storage:)(v15, v29, v9, v30, v31);
        return sub_1000164F8((uint64_t)v17, &qword_100050128);
      }
    }
  }
  v33 = *(void (**)(char *, uint64_t, uint64_t, __n128, __n128))(v10 + 16);
  v33(v12, v39, v9, v19, v20);
  ((void (*)(char *, char *, uint64_t))v33)(v15, v12, v9);
  swift_storeEnumTagMultiPayload(v15, v13, 1);
  v34 = sub_1000253C0();
  v35 = sub_100008E7C(&qword_100050148, &qword_100050118, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
  _ConditionalContent<>.init(storage:)(v15, v40, v9, v34, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100024328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100023FD0(a1, *(_QWORD *)v2, *(_BYTE *)(v2 + 8), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

BOOL static APUISystemApertureVerticalPlacement.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void APUISystemApertureVerticalPlacement.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

BOOL sub_100024378(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_100024394()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int _s18ActivityProgressUI37APUISystemApertureAccessoryLayoutModeO9hashValueSivg_0(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

Swift::Int sub_100024404()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_100024448(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t View.systemApertureVerticalPlacement(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  KeyPath = swift_getKeyPath(&unk_1000363E0);
  v6 = type metadata accessor for APUISystemApertureLayoutState(0);
  v7 = sub_1000067D0((unint64_t *)&qword_10004F360, type metadata accessor for APUISystemApertureLayoutState, (uint64_t)&unk_1000366D4);
  v8 = EnvironmentObject.init()(v6, v7);
  v11 = KeyPath;
  v12 = 0;
  v13 = v8;
  v14 = v9;
  View.modifier<A>(_:)(&v11, a2, &type metadata for APUISystemApertureVerticalPlacementViewModifier, a3);
  swift_release(KeyPath);
  return swift_release(v8);
}

unint64_t sub_100024548()
{
  unint64_t result;

  result = qword_10004FF80;
  if (!qword_10004FF80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for APUISystemApertureVerticalPlacement, &type metadata for APUISystemApertureVerticalPlacement);
    atomic_store(result, (unint64_t *)&qword_10004FF80);
  }
  return result;
}

unint64_t sub_100024590()
{
  unint64_t result;

  result = qword_10004FF88;
  if (!qword_10004FF88)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for APUISystemApertureAccessoryLayoutMode, &type metadata for APUISystemApertureAccessoryLayoutMode);
    atomic_store(result, (unint64_t *)&qword_10004FF88);
  }
  return result;
}

uint64_t sub_1000245D4()
{
  return type metadata accessor for APUISystemApertureLayoutState(0);
}

void sub_1000245DC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  sub_1000153BC(319, &qword_10004FFD8, (uint64_t)&type metadata for APUISystemApertureLayoutState.Metrics);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000153BC(319, (unint64_t *)&unk_10004FFE0, (uint64_t)&type metadata for APUISystemApertureLayoutState.Context);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 2, v6, a1 + 80);
    }
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for APUISystemApertureVerticalPlacement(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_100024698(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000246A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureVerticalPlacement()
{
  return &type metadata for APUISystemApertureVerticalPlacement;
}

uint64_t _s18ActivityProgressUI35APUISystemApertureVerticalPlacementOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18ActivityProgressUI35APUISystemApertureVerticalPlacementOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100024798 + 4 * byte_1000363D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000247CC + 4 * byte_1000363D0[v4]))();
}

uint64_t sub_1000247CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000247D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000247DCLL);
  return result;
}

uint64_t sub_1000247E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000247F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1000247F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000247FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureAccessoryLayoutMode()
{
  return &type metadata for APUISystemApertureAccessoryLayoutMode;
}

uint64_t sub_100024818(_QWORD *a1)
{
  return sub_10002488C(a1, (uint64_t)&type metadata for APUISystemApertureDismissalModifier, (void (*)(void))sub_10002482C);
}

unint64_t sub_10002482C()
{
  unint64_t result;

  result = qword_1000500D0;
  if (!qword_1000500D0)
  {
    result = swift_getWitnessTable(&unk_100036684, &type metadata for APUISystemApertureDismissalModifier);
    atomic_store(result, (unint64_t *)&qword_1000500D0);
  }
  return result;
}

uint64_t sub_100024870(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_100024878(_QWORD *a1)
{
  return sub_10002488C(a1, (uint64_t)&type metadata for APUISystemApertureVerticalPlacementViewModifier, (void (*)(void))sub_1000248E8);
}

uint64_t sub_10002488C(_QWORD *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;

  v4 = type metadata accessor for ModifiedContent(255, *a1, a2);
  a3();
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v4);
}

unint64_t sub_1000248E8()
{
  unint64_t result;

  result = qword_1000500D8;
  if (!qword_1000500D8)
  {
    result = swift_getWitnessTable(&unk_100036634, &type metadata for APUISystemApertureVerticalPlacementViewModifier);
    atomic_store(result, (unint64_t *)&qword_1000500D8);
  }
  return result;
}

uint64_t sub_10002492C(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

uint64_t sub_10002493C(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureVerticalPlacementViewModifier()
{
  return &type metadata for APUISystemApertureVerticalPlacementViewModifier;
}

uint64_t destroy for APUISystemApertureDismissalModifier(uint64_t a1)
{
  sub_10002493C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_10002493C(*(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  return swift_release(*(_QWORD *)(a1 + 56));
}

uint64_t initializeWithCopy for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10002492C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  sub_10002492C(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  swift_retain(v8);
  swift_retain(v11);
  return a1;
}

uint64_t assignWithCopy for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10002492C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_10002493C(v6, v7);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_BYTE *)(a2 + 24);
  sub_10002492C(v8, v9);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  sub_10002493C(v10, v11);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v13;
  swift_retain(v13);
  swift_release(v12);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v15 = *(_QWORD *)(a2 + 48);
  v14 = *(_QWORD *)(a2 + 56);
  v16 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v14;
  swift_retain(v14);
  swift_release(v16);
  return a1;
}

__n128 initializeWithTake for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for APUISystemApertureDismissalModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_10002493C(v6, v7);
  v8 = *((_BYTE *)a2 + 24);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_BYTE *)(a1 + 24) = v8;
  sub_10002493C(v9, v10);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_release(v11);
  *(_QWORD *)(a1 + 40) = a2[5];
  v12 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  swift_release(v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureDismissalModifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureDismissalModifier(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureDismissalModifier()
{
  return &type metadata for APUISystemApertureDismissalModifier;
}

__n128 initializeBufferWithCopyOfBuffer for APUISystemApertureLayoutState.Context(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureLayoutState.Context(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureLayoutState.Context(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureLayoutState.Context()
{
  return &type metadata for APUISystemApertureLayoutState.Context;
}

__n128 initializeWithCopy for APUISystemApertureLayoutState.Metrics(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for APUISystemApertureLayoutState.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for APUISystemApertureLayoutState.Metrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureLayoutState.Metrics()
{
  return &type metadata for APUISystemApertureLayoutState.Metrics;
}

uint64_t sub_100024D58(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C1D0, 1);
}

uint64_t sub_100024D68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C1A8, 1);
}

double sub_100024D78@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v6;
  double result;
  __int128 v8;
  char v9;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100036710);
  v5 = swift_getKeyPath(&unk_100036738);
  static Published.subscript.getter(&v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  v6 = v9;
  result = *(double *)&v8;
  *(_OWORD *)a2 = v8;
  *(_BYTE *)(a2 + 16) = v6;
  return result;
}

uint64_t sub_100024DFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  _QWORD v9[2];
  char v10;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *a2;
  KeyPath = swift_getKeyPath(&unk_100036710);
  v7 = swift_getKeyPath(&unk_100036738);
  v9[0] = v2;
  v9[1] = v3;
  v10 = v4;
  swift_retain(v5);
  return static Published.subscript.setter(v9, v5, KeyPath, v7);
}

uint64_t sub_100024E7C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_10002785C(1819242306, 0xE400000000000000, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(&v16, v7, a1);
  sub_10002493C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_100025038()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_100025058(uint64_t a1)
{
  sub_10002492C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

_QWORD *sub_100025084(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

unint64_t sub_1000250AC()
{
  unint64_t result;

  result = qword_100050108;
  if (!qword_100050108)
  {
    result = swift_getWitnessTable(&unk_10003660C, &type metadata for APUISystemApertureLayoutState.Context);
    atomic_store(result, (unint64_t *)&qword_100050108);
  }
  return result;
}

unint64_t sub_1000250F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050110;
  if (!qword_100050110)
  {
    v1 = sub_100008B84(&qword_1000500E0);
    sub_100008E7C(&qword_100050100, &qword_1000500F8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050110);
  }
  return result;
}

uint64_t sub_100025178()
{
  uint64_t v0;

  sub_10002493C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  sub_10002493C(*(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000251BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (*(_QWORD *)a2 == 3 && *(_BYTE *)(a2 + 16) != 0)
    return (*(uint64_t (**)(void))(v2 + 64))();
  return result;
}

uint64_t sub_1000251F8(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain(a1);
  }
  else
  {
    v8 = swift_retain(a1);
    v9 = static os_log_type_t.fault.getter(v8);
    v10 = static Log.runtimeIssuesLog.getter();
    v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      v15 = sub_10002785C(0xD00000000000002FLL, 0x800000010003ABD0, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(&v16, v7, a1);
    sub_100025464(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }
  return a1;
}

unint64_t sub_1000253C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050130;
  if (!qword_100050130)
  {
    v1 = sub_100008B84(&qword_100050128);
    sub_100008E7C(&qword_100050138, &qword_100050140, (uint64_t)&protocol conformance descriptor for _LayoutRoot<A>);
    sub_100008E7C(&qword_100050148, &qword_100050118, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _VariadicView.Tree<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050130);
  }
  return result;
}

uint64_t sub_100025464(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_unknownObjectRelease(a1);
  else
    return swift_release(a1);
}

id sub_100025470(void *a1, uint64_t a2)
{
  id v4;
  id result;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(double *, _QWORD);
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(double *, _QWORD);
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(double *, _QWORD);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(double *, _QWORD);
  uint64_t v35;
  double v36[6];

  v4 = objc_msgSend(a1, "activeLayoutMode");
  result = objc_msgSend(a1, "view");
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, "SBUISA_systemApertureObstructedAreaLayoutGuide");

    objc_msgSend(v7, "layoutFrame");
    v9 = v8;
    v11 = v10;

    if (v4 == (id)4)
    {
      KeyPath = swift_getKeyPath(&unk_100036758);
      v13 = swift_getKeyPath(&unk_100036780);
      static Published.subscript.getter(v36, a2, KeyPath, v13);
      swift_release(KeyPath);
      swift_release(v13);
      if (v36[0] != v9 || v36[1] != v11)
      {
        v15 = swift_getKeyPath(&unk_100036758);
        v16 = swift_getKeyPath(&unk_100036780);
        v17 = (void (*)(double *, _QWORD))static Published.subscript.modify(v36, a2, v15, v16);
        *v18 = v9;
        v18[1] = v11;
        v17(v36, 0);
        swift_release(v15);
        swift_release(v16);
      }
    }
    v19 = swift_getKeyPath(&unk_100036710);
    v20 = swift_getKeyPath(&unk_100036738);
    static Published.subscript.getter(v36, a2, v19, v20);
    swift_release(v19);
    result = (id)swift_release(v20);
    if (*(id *)&v36[0] != v4)
    {
      v21 = swift_getKeyPath(&unk_100036710);
      v22 = swift_getKeyPath(&unk_100036738);
      v23 = (void (*)(double *, _QWORD))static Published.subscript.modify(v36, a2, v21, v22);
      *v24 = v4;
      v23(v36, 0);
      swift_release(v21);
      swift_release(v22);
      v25 = objc_msgSend(a1, "systemApertureElementContext");
      v26 = objc_msgSend(v25, "transitionContext");
      result = (id)swift_unknownObjectRelease(v25);
      if (v26)
      {
        v27 = objc_msgSend(v26, "fromLayoutMode");
        v28 = swift_getKeyPath(&unk_100036710);
        v29 = swift_getKeyPath(&unk_100036738);
        v30 = (void (*)(double *, _QWORD))static Published.subscript.modify(v36, a2, v28, v29);
        *(_QWORD *)(v31 + 8) = v27;
        v30(v36, 0);
        swift_release(v28);
        swift_release(v29);
        LOBYTE(v27) = objc_msgSend(v26, "isUserInitiated");
        v32 = swift_getKeyPath(&unk_100036710);
        v33 = swift_getKeyPath(&unk_100036738);
        v34 = (void (*)(double *, _QWORD))static Published.subscript.modify(v36, a2, v32, v33);
        *(_BYTE *)(v35 + 16) = (_BYTE)v27;
        v34(v36, 0);

        swift_release(v32);
        return (id)swift_release(v33);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureVerticalPlacementLayout()
{
  return &type metadata for APUISystemApertureVerticalPlacementLayout;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwxx_0(uint64_t a1)
{
  sub_10002493C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 16));
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10002492C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  swift_retain(v6);
  return a1;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10002492C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_10002493C(v6, v7);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  swift_retain(v9);
  swift_release(v8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwta_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_10002493C(v6, v7);
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_release(v8);
  *(_QWORD *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s18ActivityProgressUI47APUISystemApertureVerticalPlacementViewModifierVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for APUISystemApertureLayoutMode()
{
  return &type metadata for APUISystemApertureLayoutMode;
}

unint64_t sub_1000259BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100050160;
  if (!qword_100050160)
  {
    v1 = sub_100008B84(&qword_100050168);
    v2[0] = sub_100008B84(&qword_1000500F8);
    v2[1] = &type metadata for APUISystemApertureLayoutState.Context;
    v2[2] = sub_100008E7C(&qword_100050100, &qword_1000500F8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v2[3] = sub_1000250AC();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
    sub_1000250F0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050160);
  }
  return result;
}

unint64_t sub_100025A88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050170;
  if (!qword_100050170)
  {
    v1 = sub_100008B84(&qword_100050178);
    sub_1000253C0();
    sub_100008E7C(&qword_100050148, &qword_100050118, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050170);
  }
  return result;
}

unint64_t sub_100025B10()
{
  unint64_t result;

  result = qword_100050180;
  if (!qword_100050180)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyAnimatableData, &type metadata for EmptyAnimatableData);
    atomic_store(result, (unint64_t *)&qword_100050180);
  }
  return result;
}

unint64_t sub_100025B58()
{
  unint64_t result;

  result = qword_100050188;
  if (!qword_100050188)
  {
    result = swift_getWitnessTable(&unk_100036828, &type metadata for APUISystemApertureVerticalPlacementLayout);
    atomic_store(result, (unint64_t *)&qword_100050188);
  }
  return result;
}

double sub_100025B9C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  double v14;
  _BYTE v16[16];

  v7 = sub_1000088F0(&qword_100050190);
  __chkstk_darwin(v7);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LayoutSubview(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v16[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002332C((uint64_t)v9);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1000164F8((uint64_t)v9, &qword_100050190);
    return 0.0;
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 32))(v13, v9, v10);
    v16[8] = a2 & 1;
    v16[0] = a4 & 1;
    v14 = LayoutSubview.sizeThatFits(_:)(a1);
    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v14;
}

uint64_t sub_100025D30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_1000501A0);
  v1 = sub_100008930(v0, (uint64_t)qword_1000501A0);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t APUIRemoteAlertPresentationRequest.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t APUIRemoteAlertPresentationRequest.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(v2[1]);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.id.modify())()
{
  return nullsub_1;
}

id APUIRemoteAlertPresentationRequest.viewControllerToPresent.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void APUIRemoteAlertPresentationRequest.viewControllerToPresent.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
}

uint64_t (*APUIRemoteAlertPresentationRequest.viewControllerToPresent.modify())()
{
  return nullsub_1;
}

uint64_t APUIRemoteAlertPresentationRequest.animated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t APUIRemoteAlertPresentationRequest.animated.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.animated.modify())()
{
  return nullsub_1;
}

uint64_t APUIRemoteAlertPresentationRequest.contentOverlaysStatusBar.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t APUIRemoteAlertPresentationRequest.contentOverlaysStatusBar.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 25) = result;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.contentOverlaysStatusBar.modify())()
{
  return nullsub_1;
}

uint64_t APUIRemoteAlertPresentationRequest.supportedInterfaceOrientations.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t APUIRemoteAlertPresentationRequest.supportedInterfaceOrientations.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*APUIRemoteAlertPresentationRequest.supportedInterfaceOrientations.modify())()
{
  return nullsub_1;
}

uint64_t sub_100025ED0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t APUIRemoteAlertPresentationHandle.onDismiss.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  swift_beginAccess(v0 + 64, v3, 0, 0);
  v1 = *(_QWORD *)(v0 + 64);
  sub_100025F28(v1, *(_QWORD *)(v0 + 72));
  return v1;
}

uint64_t sub_100025F28(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t APUIRemoteAlertPresentationHandle.onDismiss.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[24];

  swift_beginAccess(v2 + 64, v8, 1, 0);
  v5 = *(_QWORD *)(v2 + 64);
  v6 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return sub_10000A468(v5, v6);
}

void *APUIRemoteAlertPresentationHandle.onDismiss.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 64, a1, 33, 0);
  return &j__swift_endAccess;
}

void APUIRemoteAlertPresentationHandle.dismiss(animated:completion:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t aBlock[5];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = v3;
  if (qword_10004ED18 != -1)
    swift_once(&qword_10004ED18, sub_100025D30);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100008930(v8, (uint64_t)qword_1000501A0);
  v10 = swift_retain(v4);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v34 = a2;
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = v9;
    v14 = swift_slowAlloc(32, -1);
    *(_DWORD *)v13 = 136315138;
    v15 = a1;
    v35 = a3;
    aBlock[0] = v14;
    v16 = *(_QWORD *)(v4 + 16);
    v17 = *(_QWORD *)(v4 + 24);
    swift_bridgeObjectRetain(v17);
    v18 = v16;
    a1 = v15;
    v38 = sub_10002785C(v18, v17, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
    swift_release(v4);
    v19 = v17;
    a3 = v35;
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Received request to dismiss remote alert with ID: %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    v20 = v13;
    a2 = v34;
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

    swift_release(v4);
  }
  v21 = *(id *)(v4 + 32);
  v22 = objc_msgSend(v21, "presentingViewController");

  if (v22)
  {
    if ((*(_BYTE *)(v4 + 81) & 1) == 0)
    {
      *(_BYTE *)(v4 + 81) = 1;
      v23 = swift_allocObject(&unk_100046A90, 32, 7);
      *(_QWORD *)(v23 + 16) = a2;
      *(_QWORD *)(v23 + 24) = a3;
      aBlock[4] = (uint64_t)sub_100027ED8;
      v37 = v23;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000134A0;
      aBlock[3] = (uint64_t)&unk_100046AA8;
      v24 = _Block_copy(aBlock);
      v25 = v37;
      sub_100025F28(a2, a3);
      swift_release(v25);
      objc_msgSend(v21, "dismissViewControllerAnimated:completion:", a1 & 1, v24);
      _Block_release(v24);
    }
  }
  else
  {
    v26 = swift_retain(v4);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      aBlock[0] = v30;
      *(_DWORD *)v29 = 136315138;
      v31 = *(_QWORD *)(v4 + 16);
      v32 = *(_QWORD *)(v4 + 24);
      swift_bridgeObjectRetain(v32);
      v38 = sub_10002785C(v31, v32, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
      swift_release(v4);
      swift_bridgeObjectRelease(v32);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Invalidating handle for remote alert which is not yet presented with ID: %s", v29, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

    }
    else
    {

      swift_release(v4);
    }
    objc_msgSend(*(id *)(v4 + 56), "invalidate", v33);
  }

}

uint64_t APUIRemoteAlertPresentationHandle.deinit()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);

  swift_bridgeObjectRelease(v1);
  sub_10000A468(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  return v0;
}

uint64_t APUIRemoteAlertPresentationHandle.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);

  swift_bridgeObjectRelease(v1);
  sub_10000A468(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  return swift_deallocClassInstance(v0, 82, 7);
}

id sub_100026410()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for APUIRemoteAlertPresentationManager()), "init");
  static APUIRemoteAlertPresentationManager.shared = (uint64_t)result;
  return result;
}

id APUISystemApertureElementTransitionCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

uint64_t *APUIRemoteAlertPresentationManager.shared.unsafeMutableAddressor()
{
  if (qword_10004ED20 != -1)
    swift_once(&qword_10004ED20, sub_100026410);
  return &static APUIRemoteAlertPresentationManager.shared;
}

id static APUIRemoteAlertPresentationManager.shared.getter()
{
  if (qword_10004ED20 != -1)
    swift_once(&qword_10004ED20, sub_100026410);
  return (id)static APUIRemoteAlertPresentationManager.shared;
}

uint64_t APUIRemoteAlertPresentationManager.present(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  id v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40[3];

  v2 = v1;
  if (qword_10004ED18 != -1)
    swift_once(&qword_10004ED18, sub_100025D30);
  v4 = type metadata accessor for Logger(0);
  sub_100008930(v4, (uint64_t)qword_1000501A0);
  v6 = *a1;
  v5 = a1[1];
  v38 = a1;
  v7 = (void *)a1[2];
  swift_bridgeObjectRetain_n(v5, 4);
  v8 = v7;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  v37 = v6;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(22, -1);
    v34 = (_QWORD *)swift_slowAlloc(8, -1);
    v35 = swift_slowAlloc(32, -1);
    v40[0] = v35;
    *(_DWORD *)v11 = 136315394;
    swift_bridgeObjectRetain(v5);
    v39 = sub_10002785C(v6, v5, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40);

    swift_bridgeObjectRelease_n(v5, 3);
    *(_WORD *)(v11 + 12) = 2112;
    v39 = (uint64_t)v8;
    v12 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40);
    *v34 = v8;

    swift_bridgeObjectRelease_n(v5, 2);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Asked to present remote alert using request: %s view controller to present: %@", (uint8_t *)v11, 0x16u);
    v13 = sub_1000088F0(&qword_10004FE30);
    swift_arrayDestroy(v34, 1, v13);
    swift_slowDealloc(v34, -1, -1);
    swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v5, 4);
  }
  v14 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityOfCurrentProcess");
  if (v14)
  {
    v15 = v14;
    v16 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    swift_bridgeObjectRetain(v5);
    v17 = v15;
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
    v36 = objc_msgSend(v16, "initWithSceneProvidingProcess:configurationIdentifier:", v17, v18);

    v19 = objc_msgSend((id)objc_opt_self(SBSRemoteAlertHandle), "newHandleWithDefinition:configurationContext:", v36, 0);
    v20 = type metadata accessor for APUIRemoteAlertPresentationHandle();
    v21 = swift_allocObject(v20, 82, 7);
    *(_QWORD *)(v21 + 64) = 0;
    *(_QWORD *)(v21 + 72) = 0;
    *(_WORD *)(v21 + 80) = 0;
    v22 = *((_OWORD *)v38 + 1);
    *(_OWORD *)(v21 + 16) = *(_OWORD *)v38;
    *(_OWORD *)(v21 + 32) = v22;
    *(_QWORD *)(v21 + 48) = v38[4];
    *(_QWORD *)(v21 + 56) = v19;
    v23 = v2;
    v24 = (uint64_t *)(v2
                    + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
    swift_beginAccess(v24, v40, 33, 0);
    swift_bridgeObjectRetain_n(v5, 2);
    v25 = v8;
    v26 = v19;
    swift_retain(v21);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v24);
    v39 = *v24;
    *v24 = 0x8000000000000000;
    sub_10001F488(v21, v37, v5, isUniquelyReferenced_nonNull_native);
    v28 = *v24;
    *v24 = v39;
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v28);
    swift_endAccess(v40);
    v29 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertActivationContext), "init");
    objc_msgSend(v29, "setInitialSupportedInterfaceOrientations:", v38[4]);
    objc_msgSend(v26, "registerObserver:", v23);
    objc_msgSend(v26, "activateWithContext:", v29);

  }
  else
  {
    v30 = Logger.logObject.getter(0);
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to get process identity of the current process, dropping request to present view controller", v32, 2u);
      swift_slowDealloc(v32, -1, -1);
    }

    return 0;
  }
  return v21;
}

uint64_t APUIRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:)(void *a1, char a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v20[3];
  char v21;
  char v22;
  uint64_t v23;

  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1;
  v13 = UUID.init()(v12);
  v14 = UUID.uuidString.getter(v13);
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v20[0] = v14;
  v20[1] = v16;
  v20[2] = (uint64_t)v12;
  v21 = a2;
  v22 = a3;
  v23 = a4;
  v17 = APUIRemoteAlertPresentationManager.present(_:)(v20);

  swift_bridgeObjectRelease(v16);
  return v17;
}

uint64_t APUIRemoteAlertPresentationManager.present(_:animated:contentOverlaysStatusBar:supportedInterfaceOrientations:onDismiss:)(void *a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27[24];
  uint64_t v28[3];
  char v29;
  char v30;
  uint64_t v31;

  v25 = a5;
  v26 = a6;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1;
  v15 = UUID.init()(v14);
  v16 = UUID.uuidString.getter(v15);
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v28[0] = v16;
  v28[1] = v18;
  v28[2] = (uint64_t)v14;
  v29 = a2;
  v30 = a3;
  v31 = a4;
  v19 = APUIRemoteAlertPresentationManager.present(_:)(v28);

  result = swift_bridgeObjectRelease(v18);
  if (v19)
  {
    swift_beginAccess(v19 + 64, v27, 1, 0);
    v21 = *(_QWORD *)(v19 + 64);
    v22 = *(_QWORD *)(v19 + 72);
    v23 = v25;
    v24 = v26;
    *(_QWORD *)(v19 + 64) = v25;
    *(_QWORD *)(v19 + 72) = v24;
    sub_100025F28(v23, v24);
    sub_10000A468(v21, v22);
    return swift_release(v19);
  }
  return result;
}

uint64_t APUIRemoteAlertPresentationManager.presentationHandle(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  _BYTE v11[24];

  v5 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess(v5, v11, 0, 0);
  v6 = *v5;
  if (!*(_QWORD *)(v6 + 16))
    return 0;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v6);
  v7 = sub_100027FC8(a1, a2);
  if ((v8 & 1) != 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    swift_retain(v9);
  }
  else
  {
    v9 = 0;
  }
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v6);
  return v9;
}

void __swiftcall APUIRemoteAlertPresentationManager.presentationRequest(for:)(ActivityProgressUI::APUIRemoteAlertPresentationRequest_optional *__return_ptr retstr, Swift::String a2)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  Swift::UInt v17;
  objc_class *v18;
  uint64_t v19;
  _BYTE v20[24];

  object = a2._object;
  countAndFlagsBits = a2._countAndFlagsBits;
  v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess(v6, v20, 0, 0);
  v7 = *v6;
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
    v13 = 0;
    v12 = 0;
    v18 = 0;
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain(object);
  swift_bridgeObjectRetain(v7);
  v9 = sub_100027FC8(countAndFlagsBits, (uint64_t)object);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease(object);
    swift_bridgeObjectRelease(v7);
    v13 = 0;
    v12 = 0;
    v18 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v9);
  swift_retain(v11);
  swift_bridgeObjectRelease(object);
  swift_bridgeObjectRelease(v7);
  v13 = *(_QWORD *)(v11 + 16);
  v12 = *(void **)(v11 + 24);
  v14 = *(void **)(v11 + 32);
  v15 = *(unsigned __int8 *)(v11 + 40);
  v16 = *(unsigned __int8 *)(v11 + 41);
  v17 = *(_QWORD *)(v11 + 48);
  swift_bridgeObjectRetain(v12);
  v18 = v14;
  swift_release(v11);
  v19 = 256;
  if (!v16)
    v19 = 0;
  v8 = v19 | v15;
LABEL_9:
  retstr->value.id._countAndFlagsBits = v13;
  retstr->value.id._object = v12;
  retstr->value.viewControllerToPresent.super.super.isa = v18;
  *(_QWORD *)&retstr->value.animated = v8;
  retstr->value.supportedInterfaceOrientations.rawValue = v17;
}

id APUIRemoteAlertPresentationManager.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID;
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_100004D80((uint64_t)&_swiftEmptyArrayStorage);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for APUIRemoteAlertPresentationManager();
  return objc_msgSendSuper2(&v4, "init");
}

id APUIRemoteAlertPresentationManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUIRemoteAlertPresentationManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void APUIRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(void *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17[2];
  _BYTE v18[24];

  v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess(v3, v18, 0, 0);
  v4 = *v3;
  v5 = a1;
  v6 = swift_bridgeObjectRetain(v4);
  v7 = sub_10002923C(v6, (uint64_t)v5);
  swift_bridgeObjectRelease(v4);

  if (v7)
  {
    if (qword_10004ED18 != -1)
      swift_once(&qword_10004ED18, sub_100025D30);
    v8 = type metadata accessor for Logger(0);
    sub_100008930(v8, (uint64_t)qword_1000501A0);
    v9 = swift_retain(v7);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v17[0] = v13;
      *(_DWORD *)v12 = 136315138;
      v14 = *(_QWORD *)(v7 + 16);
      v15 = *(_QWORD *)(v7 + 24);
      swift_bridgeObjectRetain(v15);
      v16 = sub_10002785C(v14, v15, v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, v17);
      swift_release(v7);
      swift_bridgeObjectRelease(v15);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "RemoteAlertPresentationManager did activate alert for request: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
      swift_release(v7);

    }
    else
    {

      swift_release_n(v7, 2);
    }
  }
}

void APUIRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(void *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17[2];
  _BYTE v18[24];

  v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess(v3, v18, 0, 0);
  v4 = *v3;
  v5 = a1;
  v6 = swift_bridgeObjectRetain(v4);
  v7 = sub_10002923C(v6, (uint64_t)v5);
  swift_bridgeObjectRelease(v4);

  if (v7)
  {
    if (qword_10004ED18 != -1)
      swift_once(&qword_10004ED18, sub_100025D30);
    v8 = type metadata accessor for Logger(0);
    sub_100008930(v8, (uint64_t)qword_1000501A0);
    v9 = swift_retain(v7);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v17[0] = v13;
      *(_DWORD *)v12 = 136315138;
      v14 = *(_QWORD *)(v7 + 16);
      v15 = *(_QWORD *)(v7 + 24);
      swift_bridgeObjectRetain(v15);
      v16 = sub_10002785C(v14, v15, v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, v17);
      swift_release(v7);
      swift_bridgeObjectRelease(v15);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "RemoteAlertPresentationManager did deactivate for request: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);

    }
    else
    {

      swift_release(v7);
    }
    objc_msgSend(v5, "invalidate");
    swift_release(v7);
  }
}

void APUIRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];
  _BYTE v33[24];

  v5 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID);
  swift_beginAccess(v2 + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID, v33, 0, 0);
  v6 = *v5;
  v7 = a1;
  v8 = swift_bridgeObjectRetain(v6);
  v9 = sub_10002923C(v8, (uint64_t)v7);
  swift_bridgeObjectRelease(v6);

  if (v9)
  {
    if (qword_10004ED18 != -1)
      swift_once(&qword_10004ED18, sub_100025D30);
    v10 = type metadata accessor for Logger(0);
    sub_100008930(v10, (uint64_t)qword_1000501A0);
    swift_retain(v9);
    swift_errorRetain(a2);
    swift_retain(v9);
    v11 = swift_errorRetain(a2);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc(22, -1);
      v15 = (uint64_t *)swift_slowAlloc(8, -1);
      v29 = swift_slowAlloc(32, -1);
      v32[0] = v29;
      *(_DWORD *)v14 = 136315394;
      v16 = *(_QWORD *)(v9 + 16);
      v17 = *(_QWORD *)(v9 + 24);
      swift_bridgeObjectRetain(v17);
      v30 = sub_10002785C(v16, v17, v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
      swift_release_n(v9, 2);
      swift_bridgeObjectRelease(v17);
      *(_WORD *)(v14 + 12) = 2112;
      if (a2)
      {
        swift_errorRetain(a2);
        v18 = _swift_stdlib_bridgeErrorToNSError(a2);
        v30 = v18;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
      }
      else
      {
        v30 = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
        v18 = 0;
      }
      *v15 = v18;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "RemoteAlertPresentationManager did invalidate for request: %s with error: %@", (uint8_t *)v14, 0x16u);
      v19 = sub_1000088F0(&qword_10004FE30);
      swift_arrayDestroy(v15, 1, v19);
      swift_slowDealloc(v15, -1, -1);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v14, -1, -1);
    }
    else
    {
      swift_release_n(v9, 2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }

    v20 = *(_QWORD *)(v9 + 16);
    v21 = *(_QWORD *)(v9 + 24);
    swift_beginAccess(v5, v32, 33, 0);
    swift_bridgeObjectRetain(v21);
    v22 = sub_1000285A0(v20, v21, (uint64_t *)&unk_10004FF50);
    swift_endAccess(v32);
    swift_bridgeObjectRelease(v21);
    swift_release(v22);
    v23 = *(_BYTE *)(v9 + 80);
    *(_BYTE *)(v9 + 80) = 1;
    if ((v23 & 1) == 0)
    {
      swift_beginAccess(v9 + 64, v32, 1, 0);
      v24 = *(void (**)(uint64_t))(v9 + 64);
      if (v24)
      {
        v25 = *(_QWORD *)(v9 + 72);
        v26 = swift_retain(v25);
        v24(v26);
        sub_10000A468((uint64_t)v24, v25);
        v27 = *(_QWORD *)(v9 + 64);
      }
      else
      {
        v27 = 0;
      }
      v28 = *(_QWORD *)(v9 + 72);
      *(_QWORD *)(v9 + 64) = 0;
      *(_QWORD *)(v9 + 72) = 0;
      sub_10000A468(v27, v28);
    }
    swift_release(v9);
  }
}

uint64_t sub_100027780(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100027790(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000277C4(uint64_t (*a1)(void))
{
  uint64_t result;

  result = a1();
  if (result)
    return _swift_stdlib_bridgeErrorToNSError(result);
  return result;
}

uint64_t sub_1000277EC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
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
  v9 = sub_10002785C(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_10002785C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10002792C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10001649C((uint64_t)v12, *a3);
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
      sub_10001649C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000156F0(v12);
  return v7;
}

uint64_t sub_10002792C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100027AE4(a5, a6);
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

uint64_t sub_100027AE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100027B78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100027D50(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100027D50(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100027B78(uint64_t a1, unint64_t a2)
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
      v5 = sub_100027CEC(v4, 0);
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

_QWORD *sub_100027CEC(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000088F0((uint64_t *)&unk_1000503A0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100027D50(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000088F0((uint64_t *)&unk_1000503A0);
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

_BYTE **sub_100027E9C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_100027EAC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100027ED8()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_100027F00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100027F10(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100027F18(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
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

unint64_t sub_100027FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100028130(a1, a2, v5);
}

uint64_t type metadata accessor for APUIRemoteAlertPresentationManager()
{
  return objc_opt_self(_TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager);
}

unint64_t sub_10002804C(uint64_t a1)
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
  return sub_100028210(a1, v7);
}

unint64_t sub_1000280CC(uint64_t a1)
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
  v6 = sub_10002960C(&qword_10004FEA0, (uint64_t)&protocol conformance descriptor for UUID);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100028384(a1, v7);
}

unint64_t sub_100028130(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100028210(uint64_t a1, uint64_t a2)
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

unint64_t sub_100028384(uint64_t a1, uint64_t a2)
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
      v14 = sub_10002960C(&qword_10004FF60, (uint64_t)&protocol conformance descriptor for UUID);
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

uint64_t sub_1000284BC(uint64_t a1, uint64_t a2)
{
  return sub_1000285A0(a1, a2, &qword_10004EF10);
}

uint64_t sub_1000284C8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  v5 = sub_1000280CC(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100028E54();
    v8 = v14;
  }
  v9 = *(_QWORD *)(v8 + 48);
  v10 = type metadata accessor for UUID(0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v5, v10);
  v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v5);
  sub_10002867C(v5, v8);
  v12 = *v2;
  *v2 = v8;
  swift_bridgeObjectRelease(v12);
  return v11;
}

uint64_t sub_1000285A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = v3;
  v8 = *v5;
  swift_bridgeObjectRetain(*v5);
  v9 = sub_100027FC8(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v5);
  v12 = *v5;
  v16 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100029090(a3);
    v12 = v16;
  }
  swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
  v13 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v9);
  sub_100028908(v9, v12);
  v14 = *v5;
  *v5 = v12;
  swift_bridgeObjectRelease(v14);
  return v13;
}

unint64_t sub_10002867C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = type metadata accessor for UUID(0);
  v37 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v17 = *(_QWORD *)(a2 + 40);
        v18 = sub_10002960C(&qword_10004FEA0, (uint64_t)&protocol conformance descriptor for UUID);
        v19 = dispatch thunk of Hashable._rawHashValue(seed:)(v17, v4, v18);
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v16;
        v20 = v19 & v16;
        if (a1 >= (uint64_t)v36)
        {
          if (v20 >= v36 && a1 >= (uint64_t)v20)
          {
LABEL_17:
            v23 = *(_QWORD *)(a2 + 48);
            result = v23 + v14 * a1;
            v24 = v23 + v15;
            if (v14 * a1 < v15 || (v12 = v14, result >= v24 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v24, 1, v4);
LABEL_22:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront(result);
              goto LABEL_22;
            }
            v25 = *(_QWORD *)(a2 + 56);
            v26 = (_QWORD *)(v25 + 8 * a1);
            v27 = (_QWORD *)(v25 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 1))
            {
              *v26 = *v27;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v36 || a1 >= (uint64_t)v20)
        {
          goto LABEL_17;
        }
        v12 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100028908(unint64_t result, uint64_t a2)
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

void *sub_100028ADC()
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
  sub_1000088F0((uint64_t *)&unk_10004EF30);
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
    result = (void *)swift_unknownObjectRetain(v20);
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

void *sub_100028C90()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_1000088F0((uint64_t *)&unk_10004FF40);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v22);
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100028E48()
{
  return sub_100029090(&qword_10004EF10);
}

void *sub_100028E54()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000088F0((uint64_t *)&unk_10004EF20);
  v24 = v0;
  v5 = *v0;
  v6 = static _DictionaryStorage.copy(original:)(*v0);
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v5);
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
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
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_retain(v19);
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

void *sub_100029084()
{
  return sub_100029090((uint64_t *)&unk_10004FF50);
}

void *sub_100029090(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  sub_1000088F0(a1);
  v3 = *v1;
  v4 = static _DictionaryStorage.copy(original:)(*v1);
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v3);
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19);
    result = (void *)swift_retain(v21);
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002923C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t j;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  char v19;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  j = 0;
  if (!v7)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v11 | (j << 6); ; i = __clz(__rbit64(v14)) + (j << 6))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
    sub_10002964C();
    v17 = *(void **)(v16 + 56);
    swift_retain(v16);
    v18 = v17;
    v19 = static NSObject.== infix(_:_:)(v18, a2);

    if ((v19 & 1) != 0)
    {
      swift_release(a1);
      return v16;
    }
    result = swift_release(v16);
    if (v7)
      goto LABEL_4;
LABEL_5:
    v13 = j + 1;
    if (__OFADD__(j, 1))
      break;
    if (v13 >= v8)
      goto LABEL_24;
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++j;
    if (v14)
      goto LABEL_19;
    j = v13 + 1;
    if (v13 + 1 >= v8)
      goto LABEL_24;
    v14 = *(_QWORD *)(v4 + 8 * j);
    if (v14)
      goto LABEL_19;
    j = v13 + 2;
    if (v13 + 2 >= v8)
      goto LABEL_24;
    v14 = *(_QWORD *)(v4 + 8 * j);
    if (v14)
      goto LABEL_19;
    j = v13 + 3;
    if (v13 + 3 >= v8)
      goto LABEL_24;
    v14 = *(_QWORD *)(v4 + 8 * j);
    if (v14)
      goto LABEL_19;
    v15 = v13 + 4;
    if (v15 >= v8)
    {
LABEL_24:
      swift_release(a1);
      return 0;
    }
    v14 = *(_QWORD *)(v4 + 8 * v15);
    for (j = v15; !v14; ++v15)
    {
      j = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_27;
      if (j >= v8)
        goto LABEL_24;
      v14 = *(_QWORD *)(v4 + 8 * j);
    }
LABEL_19:
    v7 = (v14 - 1) & v14;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1000293E8()
{
  return &protocol witness table for String;
}

void destroy for APUIRemoteAlertPresentationRequest(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));

}

uint64_t initializeWithCopy for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain(v3);
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(void **)(a2 + 16);
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  v8 = v6;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for APUIRemoteAlertPresentationRequest(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for APUIRemoteAlertPresentationRequest(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for APUIRemoteAlertPresentationRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for APUIRemoteAlertPresentationRequest()
{
  return &type metadata for APUIRemoteAlertPresentationRequest;
}

uint64_t type metadata accessor for APUIRemoteAlertPresentationHandle()
{
  return objc_opt_self(_TtC18ActivityProgressUI33APUIRemoteAlertPresentationHandle);
}

uint64_t sub_10002960C(unint64_t *a1, uint64_t a2)
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

unint64_t sub_10002964C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050398;
  if (!qword_100050398)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100050398);
  }
  return result;
}

uint64_t destroy for BackgroundActivityDescriptionView(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for BackgroundActivityDescriptionView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for BackgroundActivityDescriptionView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  return a1;
}

_QWORD *assignWithTake for BackgroundActivityDescriptionView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityDescriptionView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityDescriptionView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityDescriptionView()
{
  return &type metadata for BackgroundActivityDescriptionView;
}

uint64_t sub_100029834(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C360, 1);
}

uint64_t sub_100029844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v24 = a4;
  v9 = sub_1000088F0(&qword_1000503B8);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v23 - v13;
  v15 = sub_1000088F0(&qword_1000503C0);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v23 - v19;
  sub_1000299E8(a1, a2, (uint64_t)&v23 - v19);
  sub_100029D40(a3, v24, (uint64_t)v14);
  sub_100009050((uint64_t)v20, (uint64_t)v18, &qword_1000503C0);
  sub_100009050((uint64_t)v14, (uint64_t)v12, &qword_1000503B8);
  sub_100009050((uint64_t)v18, a5, &qword_1000503C0);
  v21 = sub_1000088F0(&qword_1000503C8);
  sub_100009050((uint64_t)v12, a5 + *(int *)(v21 + 48), &qword_1000503B8);
  sub_1000164F8((uint64_t)v14, &qword_1000503B8);
  sub_1000164F8((uint64_t)v20, &qword_1000503C0);
  sub_1000164F8((uint64_t)v12, &qword_1000503B8);
  return sub_1000164F8((uint64_t)v18, &qword_1000503C0);
}

uint64_t sub_1000299E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD v53[2];

  v52 = a3;
  v47 = sub_1000088F0(&qword_1000503D0);
  __chkstk_darwin(v47);
  v51 = (uint64_t *)((char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for Text.TruncationMode(0);
  v49 = *(_QWORD *)(v6 - 8);
  v50 = v6;
  __chkstk_darwin(v6);
  v48 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1000088F0(&qword_1000503D8);
  __chkstk_darwin(v46);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53[0] = a1;
  v53[1] = a2;
  v10 = sub_10002A174();
  swift_bridgeObjectRetain(a2);
  v11 = Text.init<A>(_:)(v53, &type metadata for String, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (qword_10004ED80 != -1)
    swift_once(&qword_10004ED80, sub_10002A3E8);
  v18 = v15 & 1;
  v19 = Text.font(_:)(qword_100050BE0, v11, v13, v18, v17);
  v21 = v20;
  v23 = v22;
  v25 = v24 & 1;
  sub_10002A1B8(v11, v13, v18);
  v26 = swift_bridgeObjectRelease(v17);
  v27 = static Color.primary.getter(v26);
  v28 = Text.foregroundColor(_:)(v27, v19, v21, v25, v23);
  v30 = v29;
  v32 = v31;
  v45 = v33;
  swift_release(v27);
  LOBYTE(v27) = v32 & 1;
  sub_10002A1B8(v19, v21, v25);
  swift_bridgeObjectRelease(v23);
  KeyPath = swift_getKeyPath(&unk_100036A98);
  v36 = v48;
  v35 = v49;
  v37 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v48, enum case for Text.TruncationMode.tail(_:), v50);
  v38 = swift_getKeyPath(&unk_100036AC8);
  v39 = v51;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))((char *)v51 + *(int *)(v47 + 28), v36, v37);
  *v39 = v38;
  sub_100009050((uint64_t)v39, (uint64_t)&v9[*(int *)(v46 + 36)], &qword_1000503D0);
  *(_QWORD *)v9 = v28;
  *((_QWORD *)v9 + 1) = v30;
  v9[16] = v27;
  v40 = v45;
  *((_QWORD *)v9 + 3) = v45;
  *((_QWORD *)v9 + 4) = KeyPath;
  *((_QWORD *)v9 + 5) = 1;
  v9[48] = 0;
  sub_10002A2C4(v28, v30, v27);
  swift_bridgeObjectRetain(v40);
  swift_retain(KeyPath);
  sub_1000164F8((uint64_t)v39, &qword_1000503D0);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  sub_10002A1B8(v28, v30, v27);
  swift_release(KeyPath);
  v41 = swift_bridgeObjectRelease(v40);
  v42 = static Alignment.leading.getter(v41);
  sub_10002DE9C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v52, 0.0, 1, 0.0, 1, v42, v43);
  return sub_1000164F8((uint64_t)v9, &qword_1000503D8);
}

uint64_t sub_100029D40@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];

  v55 = a3;
  v49 = sub_1000088F0(&qword_1000503D0);
  __chkstk_darwin(v49);
  v53 = (uint64_t *)((char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for Text.TruncationMode(0);
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_1000088F0(&qword_1000503D8);
  __chkstk_darwin(v48);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_1000088F0(&qword_1000503E0);
  __chkstk_darwin(v50);
  v54 = (uint64_t)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56[0] = a1;
  v56[1] = a2;
  v12 = sub_10002A174();
  swift_bridgeObjectRetain(a2);
  v13 = Text.init<A>(_:)(v56, &type metadata for String, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (qword_10004ED88 != -1)
    swift_once(&qword_10004ED88, sub_10002A4A0);
  v20 = v17 & 1;
  v21 = Text.font(_:)(qword_100050BE8, v13, v15, v20, v19);
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  sub_10002A1B8(v13, v15, v20);
  v28 = swift_bridgeObjectRelease(v19);
  v29 = static Color.primary.getter(v28);
  v30 = Text.foregroundColor(_:)(v29, v21, v23, v27, v25);
  v32 = v31;
  LOBYTE(v20) = v33;
  v47 = v34;
  swift_release(v29);
  LOBYTE(v29) = v20 & 1;
  sub_10002A1B8(v21, v23, v27);
  swift_bridgeObjectRelease(v25);
  KeyPath = swift_getKeyPath(&unk_100036A98);
  v36 = v51;
  v37 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v51 + 104))(v8, enum case for Text.TruncationMode.tail(_:), v52);
  v38 = swift_getKeyPath(&unk_100036AC8);
  v39 = v53;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))((char *)v53 + *(int *)(v49 + 28), v8, v37);
  *v39 = v38;
  sub_100009050((uint64_t)v39, (uint64_t)&v10[*(int *)(v48 + 36)], &qword_1000503D0);
  *(_QWORD *)v10 = v30;
  *((_QWORD *)v10 + 1) = v32;
  v10[16] = v29;
  v40 = v47;
  *((_QWORD *)v10 + 3) = v47;
  *((_QWORD *)v10 + 4) = KeyPath;
  *((_QWORD *)v10 + 5) = 1;
  v10[48] = 0;
  sub_10002A2C4(v30, v32, v29);
  swift_bridgeObjectRetain(v40);
  swift_retain(KeyPath);
  sub_1000164F8((uint64_t)v39, &qword_1000503D0);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
  sub_10002A1B8(v30, v32, v29);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v40);
  v41 = v54;
  sub_100009050((uint64_t)v10, v54, &qword_1000503D8);
  *(_QWORD *)(v41 + *(int *)(v50 + 36)) = 0x3FE0000000000000;
  v42 = sub_1000164F8((uint64_t)v10, &qword_1000503D8);
  v43 = static Alignment.leading.getter(v42);
  sub_10002DEF4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v55, 0.0, 1, 0.0, 1, v43, v44);
  return sub_1000164F8(v41, &qword_1000503E0);
}

uint64_t sub_10002A10C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  *(_QWORD *)a1 = static HorizontalAlignment.leading.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v7 = sub_1000088F0(&qword_1000503B0);
  return sub_100029844(v3, v4, v6, v5, a1 + *(int *)(v7 + 44));
}

unint64_t sub_10002A174()
{
  unint64_t result;

  result = qword_1000503E8;
  if (!qword_1000503E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000503E8);
  }
  return result;
}

uint64_t sub_10002A1B8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10002A1C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10002A1F8(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10002A224()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10002A244(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for Text.TruncationMode(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return EnvironmentValues.truncationMode.setter(v4);
}

uint64_t sub_10002A2C4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

unint64_t sub_10002A2D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000503F0;
  if (!qword_1000503F0)
  {
    v1 = sub_100008B84(&qword_1000503F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000503F0);
  }
  return result;
}

void sub_10002A324()
{
  qword_100050B50 = 0x4028000000000000;
}

void sub_10002A334()
{
  qword_100050B58 = 0x4028000000000000;
}

void sub_10002A344()
{
  qword_100050B60 = 0x4038000000000000;
}

double sub_10002A354()
{
  double result;

  result = 0.0;
  xmmword_100050B70 = xmmword_100036B00;
  *(_OWORD *)&qword_100050B80 = xmmword_100036B10;
  return result;
}

__n128 sub_10002A374()
{
  __n128 result;

  __asm { FMOV            V0.2D, #16.0 }
  xmmword_100050B90 = (__int128)result;
  *(__n128 *)&qword_100050BA0 = result;
  return result;
}

void sub_10002A388()
{
  qword_100050BB0 = 0x4028000000000000;
}

void sub_10002A398()
{
  qword_100050BB8 = 0x4046000000000000;
}

void sub_10002A3A8()
{
  qword_100050BC0 = 0x4026000000000000;
}

void sub_10002A3B8()
{
  qword_100050BC8 = 0x4031000000000000;
}

void sub_10002A3C8()
{
  qword_100050BD0 = 0x4010000000000000;
}

void sub_10002A3D8()
{
  qword_100050BD8 = 0x4046000000000000;
}

uint64_t sub_10002A3E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = type metadata accessor for Font.Leading(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static Font.headline.getter(v2);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for Font.Leading.tight(_:), v0);
  v6 = Font.leading(_:)(v4, v5);
  swift_release(v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  qword_100050BE0 = v6;
  return result;
}

uint64_t sub_10002A4A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v0 = type metadata accessor for Font.Leading(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Font.TextStyle(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Font.TextStyle.subheadline(_:), v4);
  v8 = static Font.custom(_:size:relativeTo:)(0x746E6F4674503531, 0xE800000000000000, v7, 15.0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for Font.Leading.tight(_:), v0);
  v9 = Font.leading(_:)(v3, v8);
  swift_release(v8);
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_100050BE8 = v9;
  return result;
}

uint64_t sub_10002A5E0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v0 = type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v3 + 104))(v2, enum case for Color.RGBColorSpace.sRGB(_:));
  result = Color.init(_:red:green:blue:opacity:)(v2, 0.043, 0.608, 1.0, 1.0);
  qword_100050BF0 = result;
  return result;
}

uint64_t sub_10002A674()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_100050BF8);
  sub_100008930(v0, (uint64_t)qword_100050BF8);
  return Logger.init(subsystem:category:)(0xD00000000000001DLL, 0x800000010003AED0, 0xD000000000000012, 0x800000010003AEF0);
}

uint64_t sub_10002A6F4()
{
  unint64_t v0;
  uint64_t v2;

  v0 = sub_100010734();
  EnvironmentValues.subscript.getter(&v2, &type metadata for APUIRemoteAlertTransitioningDelegateKey, &type metadata for APUIRemoteAlertTransitioningDelegateKey, v0);
  return v2;
}

uint64_t sub_10002A72C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_100050400);
  v1 = sub_100008930(v0, (uint64_t)qword_100050400);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id APUISystemApertureElementTransitionCoordinator.init()()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  void *v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v1 = &v0[OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_QWORD *)v1 + 4) = 0;
  v2 = &v0[OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureLayoutModeCustomFrameInScreen];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v3 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_screenWidth;
  v4 = (void *)objc_opt_self(UIScreen);
  v5 = v0;
  v6 = objc_msgSend(v4, "mainScreen");
  objc_msgSend(v6, "bounds");
  v8 = v7;

  *(_QWORD *)&v0[v3] = v8;
  v9 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_animationPositionTransformYOffset;
  v10 = objc_msgSend(v4, "mainScreen");
  objc_msgSend(v10, "bounds");
  v12 = v11;

  *(double *)&v5[v9] = v12 / 3.0;
  v13 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_cornerRadius;
  v14 = (void *)objc_opt_self(SBUISystemApertureLayoutMetrics);
  v15 = objc_msgSend(v14, "sharedInstanceForEmbeddedDisplay");
  objc_msgSend(v15, "maximumContinuousCornerRadius");
  v17 = v16;

  *(_QWORD *)&v5[v13] = v17;
  v18 = OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureEdgeInset;
  v19 = objc_msgSend(v14, "sharedInstanceForEmbeddedDisplay");
  objc_msgSend(v19, "minimumScreenEdgeInsets");
  v21 = v20;

  *(_QWORD *)&v5[v18] = v21;
  v23.receiver = v5;
  v23.super_class = (Class)type metadata accessor for APUISystemApertureElementTransitionCoordinator();
  return objc_msgSendSuper2(&v23, "init");
}

id APUISystemApertureElementTransitionCoordinator.__deallocating_deinit(uint64_t a1)
{
  return sub_10002B2FC(a1, type metadata accessor for APUISystemApertureElementTransitionCoordinator);
}

void sub_10002AA58(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char **v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  id v43;
  _BYTE *v44;
  id v45;
  id v46;
  _QWORD *v47;
  void *v48;
  _QWORD *v49;
  id v50;
  _BYTE *v51;
  char *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void **aBlock;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD *v63;

  v3 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextFromViewControllerKey);
  if (!v3)
  {
    __break(1u);
    goto LABEL_26;
  }
  v4 = v3;
  v5 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextToViewControllerKey);
  if (!v5)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    return;
  }
  v6 = v5;
  v7 = OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay;
  if (*((_BYTE *)v1
       + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay))
    v8 = v5;
  else
    v8 = v4;
  v9 = v8;
  v10 = objc_msgSend(v9, "view");
  if (!v10)
    goto LABEL_27;
  v11 = v10;
  v52 = (char *)OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator;
  v12 = (double *)(*(_QWORD *)((char *)v1
                             + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator)
                 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureLayoutModeCustomFrameInScreen);
  v13 = *v12;
  v14 = v12[1];
  v16 = v12[2];
  v15 = v12[3];
  v17 = &selRef_initialFrameForViewController_;
  if (*((_BYTE *)v1 + v7))
    v17 = &selRef_finalFrameForViewController_;
  objc_msgSend(a1, *v17, v9);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 8);
  v27 = objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "init");
  objc_msgSend(v27, "setFrame:", v19, v21, v23, v25);
  objc_msgSend(v27, "setAutoresizingMask:", 18);
  v57 = v6;
  v56 = v9;
  v54 = v26;
  if (*((_BYTE *)v1 + v7) == 1)
    v28 = v26;
  else
    v28 = 0;
  objc_msgSend(v27, "setEffect:", v28);

  v29 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v30 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
  objc_msgSend(v29, "setBackgroundColor:", v30);

  objc_msgSend(v29, "setClipsToBounds:", 1);
  v31 = objc_msgSend(v29, "layer");
  objc_msgSend(v31, "setCornerRadius:", *(double *)(*(_QWORD *)&v52[(_QWORD)v1]+ OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_cornerRadius));

  v32 = objc_msgSend(v29, "layer");
  objc_msgSend(v32, "setCornerCurve:", kCACornerCurveID0);

  v33 = objc_msgSend(a1, "containerView");
  objc_msgSend(v33, "addSubview:", v11);

  v34 = objc_msgSend(a1, "containerView");
  objc_msgSend(v34, "addSubview:", v27);

  objc_msgSend(v11, "setFrame:", v19, v21, v23, v25);
  objc_msgSend(v11, "frame");
  objc_msgSend(v11, "setFrame:");
  v35 = objc_msgSend(a1, "containerView");
  objc_msgSend(v35, "setMaskView:", v29);

  if (*((_BYTE *)v1 + v7))
    v36 = v13;
  else
    v36 = v19;
  if (*((_BYTE *)v1 + v7))
    v37 = v14;
  else
    v37 = v21;
  if (*((_BYTE *)v1 + v7))
    v38 = v16;
  else
    v38 = v23;
  if (*((_BYTE *)v1 + v7))
    v39 = v15;
  else
    v39 = v25;
  objc_msgSend(v29, "setFrame:", v36, v37, v38, v39);
  v53 = (id)objc_opt_self(UIView);
  v40 = swift_allocObject(&unk_100046DD0, 120, 7);
  *(_QWORD *)(v40 + 16) = v27;
  *(_QWORD *)(v40 + 24) = v1;
  *(_QWORD *)(v40 + 32) = v26;
  *(_QWORD *)(v40 + 40) = v11;
  *(double *)(v40 + 48) = v19;
  *(double *)(v40 + 56) = v21;
  *(double *)(v40 + 64) = v23;
  *(double *)(v40 + 72) = v25;
  *(_QWORD *)(v40 + 80) = v29;
  *(double *)(v40 + 88) = v13;
  *(double *)(v40 + 96) = v14;
  *(double *)(v40 + 104) = v16;
  *(double *)(v40 + 112) = v15;
  v62 = sub_10002C758;
  v63 = (_QWORD *)v40;
  aBlock = _NSConcreteStackBlock;
  v59 = 1107296256;
  v60 = sub_1000134A0;
  v61 = &unk_100046DE8;
  v41 = _Block_copy(&aBlock);
  v42 = v63;
  v55 = v54;
  v43 = v27;
  v44 = v1;
  v45 = v11;
  v46 = v29;
  swift_release(v42);
  v47 = (_QWORD *)swift_allocObject(&unk_100046E20, 40, 7);
  v47[2] = v43;
  v47[3] = a1;
  v47[4] = v44;
  v62 = sub_10002C7AC;
  v63 = v47;
  aBlock = _NSConcreteStackBlock;
  v59 = 1107296256;
  v60 = sub_10002B230;
  v61 = &unk_100046E38;
  v48 = _Block_copy(&aBlock);
  v49 = v63;
  v50 = v43;
  v51 = v44;
  swift_unknownObjectRetain(a1);
  swift_release(v49);
  objc_msgSend(v53, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v41, v48, 0.8, 0.0, 2.0, 300.0, 50.0, 0.0);

  _Block_release(v48);
  _Block_release(v41);
}

id sub_10002AFFC(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v23 = OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay;
  if (*(_BYTE *)(a2
                + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay))
    a3 = 0;
  objc_msgSend(a1, "setEffect:", a3);
  objc_msgSend(a4, "setFrame:", a6, a7, a8, a9);
  objc_msgSend(a4, "frame");
  objc_msgSend(a4, "setFrame:");
  if (*(_BYTE *)(a2 + v23))
    v24 = a6;
  else
    v24 = a10;
  if (*(_BYTE *)(a2 + v23))
    v25 = a7;
  else
    v25 = a11;
  if (*(_BYTE *)(a2 + v23))
    v26 = a8;
  else
    v26 = a12;
  v27 = a13;
  if (*(_BYTE *)(a2 + v23))
    v27 = a9;
  return objc_msgSend(a5, "setFrame:", v24, v25, v26, v27);
}

void sub_10002B120(char a1, id a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  objc_msgSend(a2, "removeFromSuperview");
  v7 = objc_msgSend(a3, "containerView");
  objc_msgSend(v7, "setMaskView:", 0);

  objc_msgSend(a3, "completeTransition:", a1 & 1);
  v8 = *(void **)(a4
                + OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator);
  sub_10002C7B8((uint64_t)v8 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate, (uint64_t)v15);
  if (v16)
  {
    sub_10002C840((uint64_t)v15, (uint64_t)v12);
    v9 = v8;
    sub_10002C800((uint64_t)v15);
    v10 = v13;
    v11 = v14;
    sub_100015710(v12, v13);
    (*(void (**)(id, uint64_t, uint64_t))(v11 + 24))(v9, v10, v11);
    sub_1000156F0(v12);

  }
  else
  {
    sub_10002C800((uint64_t)v15);
  }
}

uint64_t sub_10002B230(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_10002B2EC()
{
  return sub_10002B2FC(0, type metadata accessor for APUISystemApertureElementTransition);
}

id sub_10002B2FC(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

void sub_10002B340(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  _QWORD v41[2];
  void **aBlock;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a2 != 1 || (*a1 & 1) != 0)
    return;
  v11 = *(_QWORD *)(a3 + 48);
  v12 = (void *)(*(uint64_t (**)(uint64_t))(a3 + 40))(v8);
  v13 = *(_QWORD *)a3;
  v14 = *(_BYTE *)(a3 + 8);
  sub_10002C2CC(*(_QWORD *)a3, v14);
  v15 = sub_1000251F8(v13, v14);
  sub_100025464(v13, v14);
  if (v15)
  {
    objc_msgSend(v12, "setModalPresentationStyle:", 4);
    objc_msgSend(v12, "setTransitioningDelegate:", v15);
    swift_unknownObjectRelease(v15);
    if ((*(_BYTE *)(a3 + 33) & 1) == 0)
    {
LABEL_5:
      if (qword_10004ED20 != -1)
        swift_once(&qword_10004ED20, sub_100026410);
      v41[1] = static APUIRemoteAlertPresentationManager.shared;
      v16 = *(_QWORD *)(a3 + 24);
      v49 = *(_QWORD *)(a3 + 16);
      v17 = swift_allocObject(&unk_100046D30, 72, 7);
      v18 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v17 + 16) = *(_OWORD *)a3;
      *(_OWORD *)(v17 + 32) = v18;
      *(_OWORD *)(v17 + 48) = *(_OWORD *)(a3 + 32);
      *(_QWORD *)(v17 + 64) = *(_QWORD *)(a3 + 48);
      sub_10002C2CC(v13, v14);
      v19 = v12;
      swift_retain(v11);
      swift_retain(v16);
      v20 = sub_100025084(&v49);
      v21 = UUID.init()(v20);
      v22 = (void **)UUID.uuidString.getter(v21);
      v24 = v23;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      aBlock = v22;
      v43 = v24;
      v44 = v19;
      LOWORD(v45) = 1;
      v46 = 2;
      v25 = APUIRemoteAlertPresentationManager.present(_:)((uint64_t *)&aBlock);

      swift_bridgeObjectRelease(v24);
      if (v25)
      {
        swift_beginAccess(v25 + 64, v48, 1, 0);
        v26 = *(_QWORD *)(v25 + 64);
        v27 = *(_QWORD *)(v25 + 72);
        *(_QWORD *)(v25 + 64) = sub_10002C604;
        *(_QWORD *)(v25 + 72) = v17;
        swift_retain(v17);
        sub_10000A468(v26, v27);
        swift_release(v17);

        swift_release(v25);
      }
      else
      {
        swift_release(v17);

      }
      return;
    }
  }
  else
  {
    objc_msgSend(v12, "setModalPresentationStyle:", 0);
    if ((*(_BYTE *)(a3 + 33) & 1) == 0)
      goto LABEL_5;
  }
  v28 = objc_msgSend(objc_allocWithZone((Class)SBSLockScreenService), "init");
  if (qword_10004EDA0 != -1)
    swift_once(&qword_10004EDA0, sub_10002A72C);
  v29 = type metadata accessor for Logger(0);
  v30 = sub_100008930(v29, (uint64_t)qword_100050400);
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Requesting device unlock if necessary", v33, 2u);
    swift_slowDealloc(v33, -1, -1);
  }

  v34 = *(_QWORD *)(a3 + 24);
  v48[0] = *(_QWORD *)(a3 + 16);
  v35 = swift_allocObject(&unk_100046D58, 88, 7);
  v36 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v35 + 24) = *(_OWORD *)a3;
  *(_QWORD *)(v35 + 16) = v12;
  *(_OWORD *)(v35 + 40) = v36;
  *(_OWORD *)(v35 + 56) = *(_OWORD *)(a3 + 32);
  *(_QWORD *)(v35 + 72) = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(v35 + 80) = v28;
  v46 = (uint64_t)sub_10002C658;
  v47 = v35;
  aBlock = _NSConcreteStackBlock;
  v43 = 1107296256;
  v44 = sub_10002B230;
  v45 = &unk_100046D70;
  v37 = _Block_copy(&aBlock);
  v38 = v47;
  sub_10002C2CC(v13, v14);
  v39 = v12;
  sub_100025084(v48);
  swift_retain(v34);
  swift_retain(v11);
  v40 = v28;
  objc_msgSend(v40, "requestPasscodeUnlockUIWithOptions:withCompletion:", 0, v37, swift_release(v38).n128_f64[0]);

  _Block_release(v37);
}

id sub_10002B770(char a1, void *a2, uint64_t *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  _QWORD *v23;
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
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  double v38;
  _BYTE v40[24];
  uint64_t v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  id v45;
  __int16 v46;
  uint64_t v47;

  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v40[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a1 & 1) != 0)
  {
    if (qword_10004EDA0 != -1)
      swift_once(&qword_10004EDA0, sub_10002A72C);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_100008930(v12, (uint64_t)qword_100050400);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Device was unlocked", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    if (qword_10004ED20 != -1)
      swift_once(&qword_10004ED20, sub_100026410);
    v17 = *a3;
    v43 = *((_BYTE *)a3 + 8);
    v18 = a3[3];
    v41 = a3[2];
    v42 = v17;
    v19 = a3[6];
    v20 = swift_allocObject(&unk_100046DA8, 72, 7);
    v21 = *((_OWORD *)a3 + 1);
    *(_OWORD *)(v20 + 16) = *(_OWORD *)a3;
    *(_OWORD *)(v20 + 32) = v21;
    *(_OWORD *)(v20 + 48) = *((_OWORD *)a3 + 2);
    *(_QWORD *)(v20 + 64) = a3[6];
    swift_retain(v18);
    swift_retain(v19);
    v22 = a2;
    sub_10002C588((uint64_t)&v42);
    v23 = sub_100025084(&v41);
    v24 = UUID.init()(v23);
    v25 = UUID.uuidString.getter(v24);
    v27 = v26;
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    *(_QWORD *)&v44 = v25;
    *((_QWORD *)&v44 + 1) = v27;
    v45 = v22;
    v46 = 1;
    v47 = 2;
    v28 = APUIRemoteAlertPresentationManager.present(_:)((uint64_t *)&v44);

    swift_bridgeObjectRelease(v27);
    if (v28)
    {
      swift_beginAccess(v28 + 64, v40, 1, 0);
      v29 = *(_QWORD *)(v28 + 64);
      v30 = *(_QWORD *)(v28 + 72);
      *(_QWORD *)(v28 + 64) = sub_10002C604;
      *(_QWORD *)(v28 + 72) = v20;
      swift_retain(v20);
      sub_10000A468(v29, v30);
      swift_release(v20);
      v31 = v28;
    }
    else
    {
      v31 = v20;
    }
    *(_QWORD *)&v38 = swift_release(v31).n128_u64[0];
  }
  else
  {
    if (qword_10004EDA0 != -1)
      swift_once(&qword_10004EDA0, sub_10002A72C);
    v32 = type metadata accessor for Logger(0);
    v33 = sub_100008930(v32, (uint64_t)qword_100050400);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Device was not unlocked", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }

    v44 = *((_OWORD *)a3 + 1);
    LOBYTE(v45) = *((_BYTE *)a3 + 32);
    v40[0] = 0;
    v37 = sub_1000088F0(&qword_100050510);
    Binding.wrappedValue.setter(v40, v37);
  }
  return objc_msgSend(a4, "invalidate", v38);
}

double sub_10002BAE0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double result;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;

  v2 = v0[2];
  v1 = v0[3];
  v3 = *((_BYTE *)v0 + 32);
  v5 = v0[5];
  v4 = v0[6];
  v15 = v2;
  v11 = v2;
  v12 = v1;
  v13 = v3;
  v6 = sub_1000088F0(&qword_100050510);
  Binding.wrappedValue.getter(&v14, v6);
  v11 = *v0;
  LOBYTE(v12) = *((_BYTE *)v0 + 8);
  v7 = swift_allocObject(&unk_100046D08, 72, 7);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)v0;
  *(_QWORD *)(v7 + 32) = v2;
  *(_QWORD *)(v7 + 40) = v1;
  *(_BYTE *)(v7 + 48) = v3;
  *(_DWORD *)(v7 + 49) = *(_DWORD *)((char *)v0 + 33);
  *(_DWORD *)(v7 + 52) = *((_DWORD *)v0 + 9);
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = v4;
  sub_10002C588((uint64_t)&v11);
  sub_100025084(&v15);
  swift_retain(v1);
  swift_retain(v4);
  v8 = sub_1000088F0(&qword_100050518);
  v9 = sub_10002C5B4();
  View.onChange<A>(of:initial:_:)(&v14, 0, sub_10002C580, v7, v8, &type metadata for Bool, v9, &protocol witness table for Bool);
  *(_QWORD *)&result = swift_release(v7).n128_u64[0];
  return result;
}

uint64_t View.remoteAlert(isPresented:requireUnlock:content:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t KeyPath;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;

  KeyPath = swift_getKeyPath(&unk_100036B38);
  v18 = KeyPath;
  v19 = 0;
  v20 = a1;
  v21 = a2;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  swift_retain(a1);
  swift_retain(a2);
  swift_retain(a6);
  View.modifier<A>(_:)(&v18, a7, &type metadata for RemoteAlertViewModifier, a8);
  swift_release(a6);
  swift_release(a2);
  swift_release(a1);
  return swift_release(KeyPath);
}

double View.remoteAlert<A>(isPresented:requireUnlock:content:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v17;
  uint64_t KeyPath;
  double result;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t (*v27)();
  _QWORD *v28;

  v17 = (_QWORD *)swift_allocObject(&unk_100046C58, 64, 7);
  v17[2] = a7;
  v17[3] = a8;
  v17[4] = a9;
  v17[5] = a10;
  v17[6] = a5;
  v17[7] = a6;
  KeyPath = swift_getKeyPath(&unk_100036B38);
  v21 = KeyPath;
  v22 = 0;
  v23 = a1;
  v24 = a2;
  v25 = a3;
  v26 = a4;
  v27 = sub_10002C1AC;
  v28 = v17;
  swift_retain(a1);
  swift_retain(a2);
  swift_retain(a6);
  View.modifier<A>(_:)(&v21, a7, &type metadata for RemoteAlertViewModifier, a9);
  swift_release(v17);
  swift_release(a2);
  swift_release(a1);
  *(_QWORD *)&result = swift_release(KeyPath).n128_u64[0];
  return result;
}

uint64_t sub_10002BE20(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = *(_QWORD *)(a4 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for APUISecureHostingController(0, v10, v9, v10);
  a1();
  v14 = sub_100032A08((uint64_t)v8, v11, v12, v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a4);
  return v14;
}

void sub_10002BEC4(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat Width;
  uint64_t v16;
  uint64_t v17;
  CGRect v18;

  if (objc_msgSend(a1, "activeLayoutMode") == (id)4)
  {
    v4 = objc_msgSend(a1, "view");
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "frame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      v14 = *(double *)(a2
                      + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_screenWidth)
          * 0.5;
      v18.origin.x = v7;
      v18.origin.y = v9;
      v18.size.width = v11;
      v18.size.height = v13;
      Width = CGRectGetWidth(v18);
      v16 = *(_QWORD *)(a2
                      + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureEdgeInset);
      v17 = a2
          + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_systemApertureLayoutModeCustomFrameInScreen;
      *(double *)v17 = v14 - Width * 0.5;
      *(_QWORD *)(v17 + 8) = v16;
      *(CGFloat *)(v17 + 16) = v11;
      *(CGFloat *)(v17 + 24) = v13;
    }
    else
    {
      __break(1u);
    }
  }
}

id _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forPresented10presenting6sourceSo06UIViewJ21AnimatedTransitioning_pSgSo0oJ0C_A2KtF_0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  _BYTE *v5;
  id v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  _BYTE v12[24];
  uint64_t v13;

  v1 = v0;
  sub_10002C7B8((uint64_t)v0 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate, (uint64_t)v12);
  if (v13)
  {
    sub_10002C840((uint64_t)v12, (uint64_t)v8);
    sub_10002C800((uint64_t)v12);
    v2 = v9;
    v3 = v10;
    sub_100015710(v8, v9);
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 8))(v0, v2, v3);
    sub_1000156F0(v8);
  }
  else
  {
    sub_10002C800((uint64_t)v12);
  }
  v4 = (objc_class *)type metadata accessor for APUISystemApertureElementTransition();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator] = v1;
  v11.receiver = v5;
  v11.super_class = v4;
  v6 = v1;
  return objc_msgSendSuper2(&v11, "init");
}

id _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forDismissedSo06UIViewJ21AnimatedTransitioning_pSgSo0mJ0C_tF_0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  _BYTE *v5;
  id v6;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  _BYTE v12[24];
  uint64_t v13;

  v1 = v0;
  sub_10002C7B8((uint64_t)v0 + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate, (uint64_t)v12);
  if (v13)
  {
    sub_10002C840((uint64_t)v12, (uint64_t)v8);
    sub_10002C800((uint64_t)v12);
    v2 = v9;
    v3 = v10;
    sub_100015710(v8, v9);
    (*(void (**)(void *, uint64_t, uint64_t))(v3 + 16))(v0, v2, v3);
    sub_1000156F0(v8);
  }
  else
  {
    sub_10002C800((uint64_t)v12);
  }
  v4 = (objc_class *)type metadata accessor for APUISystemApertureElementTransition();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_isPresentingFullScreenOverlay] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition_transitionCoordinator] = v1;
  v11.receiver = v5;
  v11.super_class = v4;
  v6 = v1;
  return objc_msgSendSuper2(&v11, "init");
}

uint64_t type metadata accessor for APUISystemApertureElementTransitionCoordinator()
{
  return objc_opt_self(_TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator);
}

uint64_t sub_10002C188()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002C1AC()
{
  uint64_t v0;

  return sub_10002BE20(*(void (**)(void))(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t type metadata accessor for APUISystemApertureElementTransition()
{
  return objc_opt_self(_TtC18ActivityProgressUIP33_A73398DBE9C416E2311A5D216094DCE135APUISystemApertureElementTransition);
}

uint64_t sub_10002C1DC(_QWORD *a1)
{
  uint64_t v1;

  v1 = type metadata accessor for ModifiedContent(255, *a1, &type metadata for RemoteAlertViewModifier);
  sub_10002C230();
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
}

unint64_t sub_10002C230()
{
  unint64_t result;

  result = qword_100050508;
  if (!qword_100050508)
  {
    result = swift_getWitnessTable(&unk_100036C38, &type metadata for RemoteAlertViewModifier);
    atomic_store(result, (unint64_t *)&qword_100050508);
  }
  return result;
}

uint64_t sub_10002C274(_QWORD *a1)
{
  uint64_t v1;

  v1 = type metadata accessor for ModifiedContent(255, *a1, &type metadata for RemoteAlertViewModifier);
  sub_10002C230();
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
}

uint64_t sub_10002C2CC(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_unknownObjectRetain(a1);
  else
    return swift_retain(a1);
}

double destroy for RemoteAlertViewModifier(uint64_t a1)
{
  double result;

  sub_100025464(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_release(*(_QWORD *)(a1 + 16));
  swift_release(*(_QWORD *)(a1 + 24));
  *(_QWORD *)&result = swift_release(*(_QWORD *)(a1 + 48)).n128_u64[0];
  return result;
}

uint64_t initializeWithCopy for RemoteAlertViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10002C2CC(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v9);
  return a1;
}

uint64_t assignWithCopy for RemoteAlertViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10002C2CC(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100025464(v6, v7);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v9;
  swift_retain(v9);
  swift_release(v8);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10;
  swift_retain(v10);
  swift_release(v11);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v13 = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  v14 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 48) = v12;
  swift_retain(v12);
  swift_release(v14);
  return a1;
}

__n128 initializeWithTake for RemoteAlertViewModifier(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for RemoteAlertViewModifier(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_100025464(v6, v7);
  swift_release(*(_QWORD *)(a1 + 16));
  v8 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  swift_release(v8);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  *(_BYTE *)(a1 + 33) = *((_BYTE *)a2 + 33);
  v9 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteAlertViewModifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteAlertViewModifier(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteAlertViewModifier()
{
  return &type metadata for RemoteAlertViewModifier;
}

uint64_t sub_10002C56C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C5B8, 1);
}

void sub_10002C580(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;

  sub_10002B340(a1, a2, v2 + 16);
}

uint64_t sub_10002C588(uint64_t a1)
{
  sub_10002C2CC(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

unint64_t sub_10002C5B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050520;
  if (!qword_100050520)
  {
    v1 = sub_100008B84(&qword_100050518);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ViewModifier_Content<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100050520);
  }
  return result;
}

uint64_t sub_10002C608()
{
  uint64_t v0;

  sub_100025464(*(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 72));

  return swift_deallocObject(v0, 88, 7);
}

id sub_10002C658(char a1)
{
  uint64_t v1;

  return sub_10002B770(a1, *(void **)(v1 + 16), (uint64_t *)(v1 + 24), *(void **)(v1 + 80));
}

uint64_t sub_10002C668(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002C678(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002C684()
{
  uint64_t v0;

  sub_100025464(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10002C6C4()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;
  char v5;

  v4 = *(_OWORD *)(v0 + 32);
  v5 = *(_BYTE *)(v0 + 48);
  v3 = 0;
  v1 = sub_1000088F0(&qword_100050510);
  return Binding.wrappedValue.setter(&v3, v1);
}

uint64_t sub_10002C714()
{
  id *v0;

  return swift_deallocObject(v0, 120, 7);
}

id sub_10002C758()
{
  uint64_t v0;

  return sub_10002AFFC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 80), *(double *)(v0 + 48), *(double *)(v0 + 56), *(double *)(v0 + 64), *(double *)(v0 + 72), *(double *)(v0 + 88), *(double *)(v0 + 96), *(double *)(v0 + 104), *(double *)(v0 + 112));
}

uint64_t sub_10002C778()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10002C7AC(char a1)
{
  uint64_t v1;

  sub_10002B120(a1, *(id *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10002C7B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000088F0(&qword_100050588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C800(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000088F0(&qword_100050588);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002C840(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for APUIRemoteAlertTransitioningDelegateKey()
{
  return &type metadata for APUIRemoteAlertTransitioningDelegateKey;
}

uint64_t sub_10002C894()
{
  _QWORD v1[4];

  v1[0] = sub_100008B84(&qword_100050518);
  v1[1] = &type metadata for Bool;
  v1[2] = sub_10002C5B4();
  v1[3] = &protocol witness table for Bool;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
}

uint64_t sub_10002C904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_1000505A0);
  v1 = sub_100008930(v0, (uint64_t)qword_1000505A0);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_10002CA90(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_10004EDA8;
  v13 = a3;
  v7 = a1;
  if (v6 != -1)
    swift_once(&qword_10004EDA8, sub_10002C904);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100008930(v8, (uint64_t)qword_1000505A0);
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

id sub_10002CBE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WindowSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WindowSceneDelegate()
{
  return objc_opt_self(_TtC18ActivityProgressUI19WindowSceneDelegate);
}

void sub_10002CC44(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = objc_opt_self(UIWindowScene);
  v5 = swift_dynamicCastObjCClass(a1, v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = qword_10004EDA8;
    v8 = a1;
    if (v7 != -1)
      swift_once(&qword_10004EDA8, sub_10002C904);
    v9 = type metadata accessor for Logger(0);
    sub_100008930(v9, (uint64_t)qword_1000505A0);
    v10 = v8;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v14 = swift_slowAlloc(32, -1);
      v25 = v14;
      *(_DWORD *)v13 = 136315138;
      v15 = objc_msgSend(v6, "description");
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

      v24 = sub_10002785C(v16, v18, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);

      swift_bridgeObjectRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "WindowSceneDelegate: Received windowScene: %s. Hosting debugging UI for ActivityProgressUI Launch Angel.", v13, 0xCu);
      swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1, -1);
      swift_slowDealloc(v13, -1, -1);

    }
    else
    {

    }
    v19 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for APUISecureWindow()), "initWithWindowScene:", v6);
    *(_BYTE *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_testAppView) = 0;
    v20 = objc_allocWithZone((Class)sub_1000088F0(qword_1000506B0));
    v21 = (void *)UIHostingController.init(rootView:)(v20);
    objc_msgSend(v19, "setRootViewController:", v21);
    objc_msgSend(v19, "makeKeyAndVisible");
    v22 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC18ActivityProgressUI19WindowSceneDelegate_window) = v19;
    v23 = v19;

    if (qword_10004ED08 != -1)
      swift_once(&qword_10004ED08, sub_100018C5C);
    sub_100019F70();

  }
}

uint64_t *APUISystemApertureView.compactDimension.unsafeMutableAddressor()
{
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  return &static APUISystemApertureView.compactDimension;
}

double APUISystemApertureView.sizeThatFits(_:for:)(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3 && (unint64_t)(a1 - 2) > 1)
    return 48.3333;
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  return *(double *)&static APUISystemApertureView.compactDimension;
}

uint64_t APUISystemApertureView.createConstraints(forSubview:offset:alignedToEdge:)(void *a1, uint64_t a2, double a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  double v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v4 = v3;
  switch(a2)
  {
    case 1:
    case 4:
      v8 = sub_1000088F0(&qword_10004FDA0);
      v9 = swift_allocObject(v8, 48, 7);
      *(_OWORD *)(v9 + 16) = xmmword_100036D30;
      v10 = objc_msgSend(a1, "widthAnchor");
      v11 = objc_msgSend(v4, "widthAnchor");
      v12 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -a3);

      *(_QWORD *)(v9 + 32) = v12;
      v13 = objc_msgSend(a1, "heightAnchor");
      v14 = objc_msgSend(a1, "widthAnchor");
      v15 = objc_msgSend(v13, "constraintEqualToAnchor:", v14);

      *(_QWORD *)(v9 + 40) = v15;
      v44 = v9;
      specialized Array._endMutation()(v16);
      if (a2 == 1)
      {
        v17 = objc_msgSend(a1, "topAnchor");
        v18 = objc_msgSend(v4, "topAnchor");
      }
      else
      {
        v17 = objc_msgSend(a1, "bottomAnchor");
        v18 = objc_msgSend(v4, "bottomAnchor");
      }
      goto LABEL_4;
    case 2:
    case 8:
      v20 = sub_1000088F0(&qword_10004FDA0);
      v21 = swift_allocObject(v20, 48, 7);
      *(_OWORD *)(v21 + 16) = xmmword_100036D30;
      v22 = objc_msgSend(a1, "heightAnchor");
      v23 = objc_msgSend(v4, "heightAnchor");
      v24 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -a3);

      *(_QWORD *)(v21 + 32) = v24;
      v25 = objc_msgSend(a1, "widthAnchor");
      v26 = objc_msgSend(a1, "heightAnchor");
      v27 = objc_msgSend(v25, "constraintEqualToAnchor:", v26);

      *(_QWORD *)(v21 + 40) = v27;
      v44 = v21;
      specialized Array._endMutation()(v28);
      if (a2 == 2)
      {
        v17 = objc_msgSend(a1, "leadingAnchor");
        v18 = objc_msgSend(v4, "leadingAnchor");
      }
      else
      {
        v17 = objc_msgSend(a1, "trailingAnchor");
        v18 = objc_msgSend(v4, "trailingAnchor");
      }
LABEL_4:
      v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v39 = v19;

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v41 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v40 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v41 >= v40 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1);
      v42 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v41, v39);
      specialized Array._endMutation()(v42);
      break;
    default:
      v29 = sub_1000088F0(&qword_10004FDA0);
      v30 = swift_allocObject(v29, 48, 7);
      *(_OWORD *)(v30 + 16) = xmmword_100036D30;
      v31 = objc_msgSend(a1, "widthAnchor");
      v32 = objc_msgSend(v4, "widthAnchor");
      v33 = -a3;
      v34 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v33);

      *(_QWORD *)(v30 + 32) = v34;
      v35 = objc_msgSend(a1, "heightAnchor");
      v36 = objc_msgSend(v4, "heightAnchor");
      v37 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v33);

      *(_QWORD *)(v30 + 40) = v37;
      v44 = v30;
      specialized Array._endMutation()(v38);
      break;
  }
  return v44;
}

void sub_10002D4EC()
{
  static APUISystemApertureView.compactDimension = 0x4037000000000000;
}

double static APUISystemApertureView.compactDimension.getter()
{
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  return *(double *)&static APUISystemApertureView.compactDimension;
}

uint64_t APUISystemApertureView.expanded.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  swift_beginAccess(v0 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded, v3, 0, 0);
  return *v1;
}

uint64_t APUISystemApertureView.expanded.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *APUISystemApertureView.expanded.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded, a1, 33, 0);
  return &j__swift_endAccess;
}

id APUISystemApertureView.init()()
{
  _BYTE *v0;
  double v1;
  objc_super v3;

  v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded] = 0;
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  v1 = *(double *)&static APUISystemApertureView.compactDimension;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for APUISystemApertureView();
  return objc_msgSendSuper2(&v3, "initWithFrame:", 0.0, 0.0, v1, v1);
}

void APUISystemApertureView.init(coder:)()
{
  _BYTE *v0;

  v0[OBJC_IVAR____TtC18ActivityProgressUI22APUISystemApertureView_expanded] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/APUISystemApertureView.swift", 47, 2, 26, 0);
  __break(1u);
}

double static APUISystemApertureView.size(forExpanded:)(char a1)
{
  if ((a1 & 1) != 0)
    return 48.3333;
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  return *(double *)&static APUISystemApertureView.compactDimension;
}

double APUISystemApertureView.systemLayoutSizeFitting(_:withHorizontalFittingPriority:verticalFittingPriority:)()
{
  _QWORD *v0;

  if (((*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x58))() & 1) != 0)
    return 48.3333;
  if (qword_10004EDB0 != -1)
    swift_once(&qword_10004EDB0, sub_10002D4EC);
  return *(double *)&static APUISystemApertureView.compactDimension;
}

id APUISystemApertureView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithFrame:", a1, a2, a3, a4);
}

void APUISystemApertureView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.APUISystemApertureView", 41, "init(frame:)", 12, 0);
  __break(1u);
}

id APUISystemApertureView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUISystemApertureView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for APUISystemApertureView()
{
  return objc_opt_self(_TtC18ActivityProgressUI22APUISystemApertureView);
}

uint64_t initializeBufferWithCopyOfBuffer for BackgroundActivityAppIcon(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for BackgroundActivityAppIcon(id *a1)
{

}

uint64_t assignWithCopy for BackgroundActivityAppIcon(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for BackgroundActivityAppIcon(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BackgroundActivityAppIcon(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityAppIcon(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityAppIcon(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityAppIcon()
{
  return &type metadata for BackgroundActivityAppIcon;
}

uint64_t destroy for BackgroundActivityView(uint64_t *a1)
{
  return sub_100016C70(*a1, a1[1]);
}

uint64_t _s18ActivityProgressUI22BackgroundActivityViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100008E74(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for BackgroundActivityView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100008E74(*(_QWORD *)a2, v4);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100016C70(v6, v7);
  return a1;
}

uint64_t assignWithTake for BackgroundActivityView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100016C70(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundActivityView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundActivityView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundActivityView()
{
  return &type metadata for BackgroundActivityView;
}

uint64_t sub_10002DE8C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C74C, 1);
}

double sub_10002DE9C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_10002DF4C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1000503D8, &qword_1000503C0).n128_u64[0];
  return result;
}

double sub_10002DEF4@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_10002DF4C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1000503E0, &qword_1000503B8).n128_u64[0];
  return result;
}

__n128 sub_10002DF4C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __n128 result;
  unsigned int v45;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _OWORD v51[7];

  v18 = v17;
  v19 = a9;
  v20 = a17;
  v22 = a14;
  v21 = a15;
  v23 = a12;
  v24 = a10;
  v25 = a2 & 1;
  v26 = a1;
  if ((_DWORD)v25)
    v26 = -INFINITY;
  v27 = a4 & 1;
  v28 = a3;
  if ((_DWORD)v27)
    v28 = v26;
  v29 = a6 & 1;
  v30 = a8 & 1;
  v31 = a5;
  if ((a6 & 1) != 0)
    v31 = v28;
  if (v26 > v28 || v28 > v31)
    goto LABEL_22;
  v33 = a7;
  if ((a8 & 1) != 0)
    v33 = -INFINITY;
  v34 = a10;
  if ((a11 & 1) != 0)
    v34 = v33;
  v35 = a12;
  if ((a13 & 1) != 0)
    v35 = v34;
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    v49 = a5;
    v50 = a7;
    v47 = a3;
    v48 = a1;
    v46 = v25;
    v45 = v27;
    v38 = static os_log_type_t.fault.getter(*(_QWORD *)&a1);
    v39 = (void *)static Log.runtimeIssuesLog.getter();
    v40 = v38;
    v19 = a9;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v39, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v27 = v45;
    v22 = a14;
    v21 = a15;
    v25 = v46;
    v24 = a10;
    v23 = a12;
    a3 = v47;
    a1 = v48;
    a5 = v49;
    a7 = v50;
    v20 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v51, *(_QWORD *)&a1, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, v22, v21);
  sub_100009050(v18, v19, a16);
  v41 = v19 + *(int *)(sub_1000088F0(v20) + 36);
  v42 = v51[5];
  *(_OWORD *)(v41 + 64) = v51[4];
  *(_OWORD *)(v41 + 80) = v42;
  *(_OWORD *)(v41 + 96) = v51[6];
  v43 = v51[1];
  *(_OWORD *)v41 = v51[0];
  *(_OWORD *)(v41 + 16) = v43;
  result = (__n128)v51[3];
  *(_OWORD *)(v41 + 32) = v51[2];
  *(__n128 *)(v41 + 48) = result;
  return result;
}

uint64_t sub_10002E118@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  double v33;
  double v35;
  double v36;
  double v37;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  unsigned int v45;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _OWORD v51[7];

  v20 = a16;
  v21 = a17;
  v23 = a14;
  v22 = a15;
  v24 = a12;
  v25 = a10;
  v26 = a2 & 1;
  v27 = a1;
  if ((_DWORD)v26)
    v27 = -INFINITY;
  v28 = a4 & 1;
  v29 = a3;
  if ((_DWORD)v28)
    v29 = v27;
  v30 = a6 & 1;
  v31 = a8 & 1;
  v32 = a11 & 1;
  v33 = a5;
  if ((a6 & 1) != 0)
    v33 = v29;
  if (v27 > v29 || v29 > v33)
    goto LABEL_22;
  v35 = a7;
  if ((a8 & 1) != 0)
    v35 = -INFINITY;
  v36 = a10;
  if ((a11 & 1) != 0)
    v36 = v35;
  v37 = a12;
  if ((a13 & 1) != 0)
    v37 = v36;
  if (v35 > v36 || v36 > v37)
  {
LABEL_22:
    v50 = a7;
    v48 = a3;
    v49 = a5;
    v47 = a1;
    v46 = v26;
    v45 = v28;
    v39 = static os_log_type_t.fault.getter();
    v40 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v39, &_mh_execute_header, v40, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v32 = a11 & 1;
    v28 = v45;
    v23 = a14;
    v22 = a15;
    v26 = v46;
    v25 = a10;
    v24 = a12;
    a1 = v47;
    a3 = v48;
    a5 = v49;
    a7 = v50;
    v20 = a16;
    v21 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v51, *(_QWORD *)&a1, v26, *(_QWORD *)&a3, v28, *(_QWORD *)&a5, v30, *(_QWORD *)&a7, v31, *(_QWORD *)&v25, v32, *(_QWORD *)&v24, a13 & 1, v23, v22);
  *(_QWORD *)a9 = v20;
  *(_QWORD *)(a9 + 8) = v21;
  *(_QWORD *)(a9 + 16) = a18;
  *(_QWORD *)(a9 + 24) = a19;
  v41 = v51[5];
  *(_OWORD *)(a9 + 96) = v51[4];
  *(_OWORD *)(a9 + 112) = v41;
  *(_OWORD *)(a9 + 128) = v51[6];
  v42 = v51[1];
  *(_OWORD *)(a9 + 32) = v51[0];
  *(_OWORD *)(a9 + 48) = v42;
  v43 = v51[3];
  *(_OWORD *)(a9 + 64) = v51[2];
  *(_OWORD *)(a9 + 80) = v43;
  swift_bridgeObjectRetain(v21);
  return swift_bridgeObjectRetain(a19);
}

uint64_t sub_10002E2E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_1000506F8);
  v1 = sub_100008930(v0, (uint64_t)qword_1000506F8);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10002E370@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int128 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
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
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  _BYTE *v53;
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
  _QWORD v66[2];

  v65 = a4;
  v6 = a3 & 1;
  v7 = sub_1000088F0(&qword_100050710);
  __chkstk_darwin(v7);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_1000088F0(&qword_100050718);
  __chkstk_darwin(v62);
  v61 = (uint64_t)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for BackgroundActivitySession(0);
  v18 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  v19 = StateObject.wrappedValue.getter(a1, a2, v6, v17, v18);
  v20 = *(unsigned __int8 *)(v19 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release(v19);
  if (v20 == 1)
  {
    if (qword_10004ED40 != -1)
      swift_once(&qword_10004ED40, sub_10002A354);
    v21 = &xmmword_100050B70;
  }
  else
  {
    if (qword_10004ED48 != -1)
      swift_once(&qword_10004ED48, sub_10002A374);
    v21 = &xmmword_100050B90;
  }
  v22 = *((_QWORD *)v21 + 3);
  v59 = *((_QWORD *)v21 + 2);
  v60 = v22;
  v23 = *((_QWORD *)v21 + 1);
  v57 = *(_QWORD *)v21;
  v58 = v23;
  v24 = StateObject.wrappedValue.getter(a1, a2, v6, v17, v18);
  v56 = v18;
  v25 = v24;
  KeyPath = swift_getKeyPath(&unk_100036EA8);
  v27 = v6;
  v28 = a2;
  v29 = swift_getKeyPath(&unk_100036ED0);
  static Published.subscript.getter(v66, v25, KeyPath, v29);
  swift_release(v25);
  swift_release(KeyPath);
  swift_release(v29);
  v63 = a1;
  v64 = v28;
  if (LOBYTE(v66[0]) == 1)
  {
    v30 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000021, 0x800000010003B280);
    static Locale.current.getter(v30);
    v31 = String.init(localized:table:bundle:locale:comment:)(v16, 0, 0, 0, v13, 0, 0, 256);
    v33 = v32;
    v34 = v56;
  }
  else
  {
    v35 = a1;
    v34 = v56;
    v36 = StateObject.wrappedValue.getter(v35, v28, v27, v17, v56);
    v37 = swift_getKeyPath(&unk_100036EF0);
    v38 = swift_getKeyPath(&unk_100036F18);
    static Published.subscript.getter(v66, v36, v37, v38);
    swift_release(v36);
    swift_release(v37);
    swift_release(v38);
    v31 = v66[0];
    v33 = v66[1];
  }
  v39 = static VerticalAlignment.center.getter();
  if (qword_10004ED50 != -1)
    swift_once(&qword_10004ED50, sub_10002A388);
  v40 = qword_100050BB0;
  *(_QWORD *)v9 = v39;
  *((_QWORD *)v9 + 1) = v40;
  v9[16] = 0;
  v41 = sub_1000088F0(&qword_100050720);
  v43 = v63;
  v42 = v64;
  sub_10002E80C(v63, v64, v27, v31, v33, &v9[*(int *)(v41 + 44)]);
  v44 = swift_bridgeObjectRelease(v33);
  v45 = static Edge.Set.all.getter(v44);
  v46 = v61;
  sub_100009050((uint64_t)v9, v61, &qword_100050710);
  v47 = v46 + *(int *)(v62 + 36);
  *(_BYTE *)v47 = v45;
  v48 = v58;
  *(_QWORD *)(v47 + 8) = v57;
  *(_QWORD *)(v47 + 16) = v48;
  v49 = v60;
  *(_QWORD *)(v47 + 24) = v59;
  *(_QWORD *)(v47 + 32) = v49;
  *(_BYTE *)(v47 + 40) = 0;
  sub_1000164F8((uint64_t)v9, &qword_100050710);
  v50 = StateObject.wrappedValue.getter(v43, v42, v27, v17, v34);
  v51 = *(_BYTE *)(v50 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release(v50);
  v52 = v65;
  sub_100009050(v46, v65, &qword_100050718);
  v53 = (_BYTE *)(v52 + *(int *)(sub_1000088F0(&qword_100050728) + 36));
  *v53 = v51;
  v53[1] = 0;
  return sub_1000164F8(v46, &qword_100050718);
}

uint64_t sub_10002E80C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  __n128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t (*v46)();
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)();
  uint64_t (*v54)();
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
  char *v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  char *v71;
  void (*v72)(char *, char *, uint64_t);
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t (**v76)();
  uint64_t (*v77)();
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)();
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  void (*v84)(char *, uint64_t);
  uint64_t (*v86)();
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t (*v92)();
  uint64_t v93;
  uint64_t (*v94)();
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  __int128 v103;
  _OWORD v104[14];
  char v105;
  _OWORD v106[13];
  uint64_t v107;
  _OWORD v108[14];
  char v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  char v125;

  v86 = (uint64_t (*)())a4;
  v87 = a5;
  v88 = a6;
  v8 = a3 & 1;
  v96 = type metadata accessor for APKDeviceLockState(0);
  v94 = *(uint64_t (**)())(v96 - 8);
  v9 = __chkstk_darwin(v96);
  v93 = (uint64_t)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v91 = (uint64_t (**)())((char *)&v86 - v11);
  v90 = sub_1000088F0(&qword_100050730);
  v99 = *(_QWORD *)(v90 - 8);
  v12 = __chkstk_darwin(v90);
  v100 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v102 = (char *)&v86 - v14;
  v89 = sub_1000088F0(&qword_100050738);
  v97 = *(_QWORD *)(v89 - 8);
  v15 = __chkstk_darwin(v89);
  v98 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v101 = (char *)&v86 - v17;
  v18 = type metadata accessor for BackgroundActivitySession(0);
  v19 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  v20 = a2;
  v95 = v18;
  v92 = (uint64_t (*)())v19;
  v21 = StateObject.wrappedValue.getter(a1, a2, v8, v18, v19);
  KeyPath = swift_getKeyPath(&unk_100036F38);
  v23 = swift_getKeyPath(&unk_100036F60);
  static Published.subscript.getter(&v110, v21, KeyPath, v23);
  swift_release(v21);
  swift_release(KeyPath);
  swift_release(v23);
  v24 = v110;
  if (qword_10004ED58 != -1)
    swift_once(&qword_10004ED58, sub_10002A398);
  v25 = qword_100050BB8;
  if (qword_10004ED60 != -1)
    swift_once(&qword_10004ED60, sub_10002A3A8);
  *(_QWORD *)&v110 = v24;
  *((_QWORD *)&v110 + 1) = v25;
  *(_QWORD *)&v111 = qword_100050BC0;
  v26 = swift_allocObject(&unk_100046FF8, 33, 7);
  *(_QWORD *)(v26 + 16) = a1;
  *(_QWORD *)(v26 + 24) = v20;
  *(_BYTE *)(v26 + 32) = (_DWORD)v8 != 0;
  sub_100008E74(a1, v20);
  v27 = sub_10000AA04();
  View.onTapGesture(count:perform:)(1, sub_1000311F0, v26, &type metadata for BackgroundActivityAppIcon, v27);
  swift_release(v26);

  v28 = static HorizontalAlignment.leading.getter();
  sub_10002F92C(a1, v20, v8, (uint64_t)v86, v87, (uint64_t)v106);
  *(_OWORD *)((char *)&v108[10] + 7) = v106[10];
  *(_OWORD *)((char *)&v108[11] + 7) = v106[11];
  *(_OWORD *)((char *)&v108[12] + 7) = v106[12];
  *(_QWORD *)((char *)&v108[13] + 7) = v107;
  *(_OWORD *)((char *)&v108[6] + 7) = v106[6];
  *(_OWORD *)((char *)&v108[7] + 7) = v106[7];
  *(_OWORD *)((char *)&v108[8] + 7) = v106[8];
  *(_OWORD *)((char *)&v108[9] + 7) = v106[9];
  *(_OWORD *)((char *)&v108[2] + 7) = v106[2];
  *(_OWORD *)((char *)&v108[3] + 7) = v106[3];
  *(_OWORD *)((char *)&v108[4] + 7) = v106[4];
  *(_OWORD *)((char *)&v108[5] + 7) = v106[5];
  *(_OWORD *)((char *)v108 + 7) = v106[0];
  *(_OWORD *)((char *)&v108[1] + 7) = v106[1];
  *(_OWORD *)((char *)&v104[10] + 1) = v108[10];
  *(_OWORD *)((char *)&v104[11] + 1) = v108[11];
  *(_OWORD *)((char *)&v104[12] + 1) = v108[12];
  v104[13] = *(_OWORD *)((char *)&v108[12] + 15);
  *(_OWORD *)((char *)&v104[6] + 1) = v108[6];
  *(_OWORD *)((char *)&v104[7] + 1) = v108[7];
  *(_OWORD *)((char *)&v104[8] + 1) = v108[8];
  *(_OWORD *)((char *)&v104[9] + 1) = v108[9];
  *(_OWORD *)((char *)&v104[2] + 1) = v108[2];
  *(_OWORD *)((char *)&v104[3] + 1) = v108[3];
  *(_OWORD *)((char *)&v104[4] + 1) = v108[4];
  *(_OWORD *)((char *)&v104[5] + 1) = v108[5];
  *(_OWORD *)((char *)v104 + 1) = v108[0];
  v109 = 0;
  v103 = (unint64_t)v28;
  LOBYTE(v104[0]) = 0;
  *(_OWORD *)((char *)&v104[1] + 1) = v108[1];
  v105 = 0;
  v29 = swift_allocObject(&unk_100047020, 33, 7);
  *(_QWORD *)(v29 + 16) = a1;
  *(_QWORD *)(v29 + 24) = v20;
  *(_BYTE *)(v29 + 32) = (_DWORD)v8 != 0;
  sub_100008E74(a1, v20);
  v30 = sub_1000088F0(&qword_100050740);
  v31 = sub_100031204();
  View.onTapGesture(count:perform:)(1, sub_1000311F0, v29, v30, v31);
  swift_release(v29);
  v122 = v104[11];
  v123 = v104[12];
  v124 = v104[13];
  v125 = v105;
  v118 = v104[7];
  v119 = v104[8];
  v120 = v104[9];
  v121 = v104[10];
  v114 = v104[3];
  v115 = v104[4];
  v116 = v104[5];
  v117 = v104[6];
  v110 = v103;
  v111 = v104[0];
  v112 = v104[1];
  v113 = v104[2];
  sub_1000312A0((uint64_t)&v110);
  v87 = a1;
  v32 = a1;
  v33 = v8;
  v34 = v95;
  v35 = (uint64_t)v92;
  v36 = StateObject.wrappedValue.getter(v32, v20, v8, v95, v92);
  v37 = swift_getKeyPath(&unk_100036F80);
  v38 = swift_getKeyPath(&unk_100036FA8);
  v39 = v91;
  static Published.subscript.getter(v91, v36, v37, v38);
  swift_release(v36);
  swift_release(v37);
  v40 = swift_release(v38);
  v42 = v93;
  v41 = (uint64_t)v94;
  v43 = v96;
  (*((void (**)(uint64_t, _QWORD, uint64_t, __n128))v94 + 13))(v93, enum case for APKDeviceLockState.unlocked(_:), v96, v40);
  v44 = static APKDeviceLockState.== infix(_:_:)(v39, v42);
  v45 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v45(v42, v43);
  v45((uint64_t)v39, v43);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v91 = 0;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  if ((v44 & 1) != 0)
  {
    v55 = v87;
    v56 = StateObject.wrappedValue.getter(v87, v20, v33, v34, v35);
    v57 = swift_getKeyPath(&unk_100036EA8);
    v58 = swift_getKeyPath(&unk_100036ED0);
    static Published.subscript.getter(&v103, v56, v57, v58);
    swift_release(v56);
    swift_release(v57);
    swift_release(v58);
    if ((v103 & 1) != 0
      || (v59 = StateObject.wrappedValue.getter(v55, v20, v33, v34, v35),
          v60 = swift_getKeyPath(&unk_100036FC8),
          v61 = swift_getKeyPath(&unk_100036FF0),
          static Published.subscript.getter(&v103, v59, v60, v61),
          swift_release(v59),
          swift_release(v60),
          swift_release(v61),
          (v103 & 1) != 0))
    {
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v91 = 0;
      v49 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      v53 = 0;
      v54 = 0;
    }
    else
    {
      v62 = swift_allocObject(&unk_100047048, 33, 7);
      *(_QWORD *)(v62 + 16) = v55;
      *(_QWORD *)(v62 + 24) = v20;
      v63 = v62;
      *(_BYTE *)(v62 + 32) = (_DWORD)v33 != 0;
      sub_10000AA48();
      sub_100008E74(v55, v20);
      if (qword_10004ED90 != -1)
        swift_once(&qword_10004ED90, sub_10002A5E0);
      v64 = swift_retain(qword_100050BF0);
      v91 = (_QWORD *)UIColor.init(_:)(v64);
      if (qword_10004ED78 != -1)
        swift_once(&qword_10004ED78, sub_10002A3D8);
      v65 = qword_100050BD8;
      v66 = static Alignment.trailing.getter();
      _FrameLayout.init(width:height:alignment:)(&v103, v65, 0, v65, 0, v66, v67);
      v49 = v103;
      v50 = BYTE8(v103);
      v51 = *(_QWORD *)&v104[0];
      v52 = BYTE8(v104[0]);
      v46 = sub_100031348;
      v48 = 256;
      v54 = (uint64_t (*)())*((_QWORD *)&v104[1] + 1);
      v53 = *(uint64_t (**)())&v104[1];
      v47 = v63;
    }
  }
  v92 = (uint64_t (*)())v48;
  v93 = v47;
  v94 = v46;
  v95 = v49;
  v96 = v50;
  v86 = (uint64_t (*)())v51;
  v87 = v52;
  v68 = v98;
  v69 = *(void (**)(char *, char *, uint64_t))(v97 + 16);
  v70 = v89;
  v69(v98, v101, v89);
  v71 = v100;
  v72 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
  v73 = v90;
  v72(v100, v102, v90);
  v74 = v88;
  v69(v88, v68, v70);
  v75 = sub_1000088F0(&qword_100050770);
  v72(&v74[*(int *)(v75 + 48)], v71, v73);
  v76 = (uint64_t (**)())&v74[*(int *)(v75 + 64)];
  v78 = v93;
  v77 = v94;
  *v76 = v94;
  v76[1] = (uint64_t (*)())v78;
  v80 = (uint64_t (*)())v91;
  v79 = (uint64_t)v92;
  v76[2] = v92;
  v76[3] = v80;
  v81 = v96;
  v76[4] = (uint64_t (*)())v95;
  v76[5] = (uint64_t (*)())v81;
  v82 = v87;
  v76[6] = v86;
  v76[7] = (uint64_t (*)())v82;
  v76[8] = v53;
  v76[9] = v54;
  sub_1000312DC(v77, v78, v79, v80);
  v83 = *(void (**)(char *, uint64_t))(v99 + 8);
  v83(v102, v73);
  v84 = *(void (**)(char *, uint64_t))(v97 + 8);
  v84(v101, v70);
  sub_10003130C((uint64_t)v94, v93, (uint64_t)v92, v80);
  v83(v100, v73);
  return ((uint64_t (*)(char *, uint64_t))v84)(v98, v70);
}

void sub_10002F178(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
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
  uint64_t KeyPath;
  uint64_t v17;
  __n128 v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t inited;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  Class isa;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t aBlock[5];
  uint64_t v61;
  char v62[128];
  uint64_t v63;
  uint64_t v64;

  v5 = a3 & 1;
  v6 = type metadata accessor for APKDeviceLockState(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v56 - v11;
  v13 = type metadata accessor for BackgroundActivitySession(0);
  v14 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  v59 = v13;
  v58 = v14;
  v15 = StateObject.wrappedValue.getter(a1, a2, v5, v13, v14);
  KeyPath = swift_getKeyPath(&unk_100036F80);
  v17 = swift_getKeyPath(&unk_100036FA8);
  static Published.subscript.getter(v12, v15, KeyPath, v17);
  swift_release(v15);
  swift_release(KeyPath);
  v18 = swift_release(v17);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v7 + 104))(v10, enum case for APKDeviceLockState.unlocked(_:), v6, v18);
  LOBYTE(v17) = static APKDeviceLockState.== infix(_:_:)(v12, v10);
  v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v10, v6);
  v19(v12, v6);
  if ((v17 & 1) != 0)
  {
    if (qword_10004EDB8 != -1)
      swift_once(&qword_10004EDB8, sub_10002E2E0);
    v20 = type metadata accessor for Logger(0);
    sub_100008930(v20, (uint64_t)qword_1000506F8);
    sub_100008E74(a1, a2);
    v21 = sub_100008E74(a1, a2);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v57 = swift_slowAlloc(32, -1);
      aBlock[0] = v57;
      *(_DWORD *)v24 = 136315138;
      v56 = v24 + 4;
      v25 = StateObject.wrappedValue.getter(a1, a2, v5, v59, v58);
      v27 = *(_QWORD *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      v26 = *(_QWORD *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain(v26);
      swift_release(v25);
      v63 = sub_10002785C(v27, v26, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);
      swift_bridgeObjectRelease(v26);
      sub_100016C70(a1, a2);
      sub_100016C70(a1, a2);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Launching app for bundle ID %s", v24, 0xCu);
      v28 = v57;
      swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {
      sub_100016C70(a1, a2);
      sub_100016C70(a1, a2);
    }

    v38 = sub_1000088F0(&qword_100050778);
    inited = swift_initStackObject(v38, v62);
    *(_OWORD *)(inited + 16) = xmmword_100036D90;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
    *(_QWORD *)(inited + 40) = v40;
    *(_QWORD *)(inited + 72) = &type metadata for Bool;
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyLaunchOrigin);
    *(_QWORD *)(inited + 88) = v41;
    v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSOpenApplicationLaunchOriginSystemAperture);
    *(_QWORD *)(inited + 120) = &type metadata for String;
    *(_QWORD *)(inited + 96) = v42;
    *(_QWORD *)(inited + 104) = v43;
    v44 = sub_100004EA0(inited);
    v45 = objc_msgSend(objc_allocWithZone((Class)_LSOpenConfiguration), "init");
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v44);
    objc_msgSend(v45, "setFrontBoardOptions:", isa);

    v47 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (v47)
    {
      v48 = v47;
      v49 = StateObject.wrappedValue.getter(a1, a2, v5, v59, v58);
      v50 = *(_QWORD *)(v49 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain(v50);
      swift_release(v49);
      v51 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v50);
      v52 = swift_allocObject(&unk_100047070, 33, 7);
      *(_QWORD *)(v52 + 16) = a1;
      *(_QWORD *)(v52 + 24) = a2;
      *(_BYTE *)(v52 + 32) = (_DWORD)v5 != 0;
      aBlock[4] = (uint64_t)sub_100031380;
      v61 = v52;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100030244;
      aBlock[3] = (uint64_t)&unk_100047088;
      v53 = _Block_copy(aBlock);
      v54 = v61;
      sub_100008E74(a1, a2);
      v55 = v45;
      objc_msgSend(v48, "openApplicationWithBundleIdentifier:usingConfiguration:completionHandler:", v51, v55, v53, swift_release(v54).n128_f64[0]);
      _Block_release(v53);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_10004EDB8 != -1)
      swift_once(&qword_10004EDB8, sub_10002E2E0);
    v29 = type metadata accessor for Logger(0);
    sub_100008930(v29, (uint64_t)qword_1000506F8);
    sub_100008E74(a1, a2);
    v30 = sub_100008E74(a1, a2);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      v57 = swift_slowAlloc(32, -1);
      aBlock[0] = v57;
      *(_DWORD *)v33 = 136315138;
      v56 = v33 + 4;
      v34 = StateObject.wrappedValue.getter(a1, a2, v5, v59, v58);
      v35 = *(_QWORD *)(v34 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      v36 = *(_QWORD *)(v34 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain(v36);
      swift_release(v34);
      v63 = sub_10002785C(v35, v36, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);
      swift_bridgeObjectRelease(v36);
      sub_100016C70(a1, a2);
      sub_100016C70(a1, a2);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "App launch for bundle ID %s failed because device is locked", v33, 0xCu);
      v37 = v57;
      swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {
      sub_100016C70(a1, a2);
      sub_100016C70(a1, a2);
    }

  }
}

uint64_t sub_10002F92C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
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
  uint64_t KeyPath;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _OWORD v64[9];
  _BYTE v65[151];
  char v66;
  _OWORD v67[9];
  uint64_t v68;
  unsigned __int8 v69;
  uint64_t v70;
  unsigned __int8 v71;
  uint64_t v72;
  uint64_t v73;

  v11 = a3 & 1;
  v12 = type metadata accessor for BackgroundActivitySession(0);
  v13 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  v14 = StateObject.wrappedValue.getter(a1, a2, v11, v12, v13);
  v15 = *(unsigned __int8 *)(v14 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_isJindoSession);
  swift_release(v14);
  v54 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v53 = v15;
  if (v15 == 1)
  {
    if (qword_10004ED28 != -1)
      swift_once(&qword_10004ED28, sub_10002A324);
    v22 = qword_100050B50;
    v23 = static Alignment.center.getter();
    v54 = 1;
    _FrameLayout.init(width:height:alignment:)(&v68, 0, 1, v22, 0, v23, v24);
    v16 = v68;
    v17 = v69;
    v18 = v70;
    v19 = v71;
    v20 = v72;
    v21 = v73;
  }
  v50 = v20;
  v51 = v19;
  v52 = v21;
  v25 = v12;
  v26 = v13;
  v27 = v16;
  v28 = v17;
  v29 = v18;
  v30 = StateObject.wrappedValue.getter(a1, a2, v11, v25, v26);
  KeyPath = swift_getKeyPath(&unk_100037010);
  v32 = swift_getKeyPath(&unk_100037038);
  static Published.subscript.getter(v65, v30, KeyPath, v32);
  swift_release(v30);
  swift_release(KeyPath);
  swift_release(v32);
  v33 = *(_OWORD *)v65;
  v34 = swift_bridgeObjectRetain(a5);
  v35 = static Alignment.leading.getter(v34);
  sub_10002E118(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v55, 0.0, 1, 0.0, 1, v35, v36, v33, *((uint64_t *)&v33 + 1), a4, a5);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(*((_QWORD *)&v33 + 1));
  v37 = v61;
  v64[6] = v61;
  v64[7] = v62;
  v64[8] = v63;
  v64[2] = v57;
  v64[3] = v58;
  v64[4] = v59;
  v64[5] = v60;
  v38 = v55;
  v64[0] = v55;
  v64[1] = v56;
  *(_OWORD *)&v65[103] = v61;
  v40 = v59;
  v39 = v60;
  *(_OWORD *)&v65[87] = v60;
  *(_OWORD *)&v65[39] = v57;
  v41 = v57;
  v42 = v56;
  *(_OWORD *)&v65[23] = v56;
  v43 = v62;
  *(_OWORD *)&v65[119] = v62;
  *(_OWORD *)&v65[135] = v63;
  v44 = v58;
  *(_OWORD *)&v65[55] = v58;
  *(_OWORD *)&v65[71] = v59;
  *(_OWORD *)&v65[7] = v55;
  v45 = *(_OWORD *)&v65[112];
  *(_OWORD *)(a6 + 161) = *(_OWORD *)&v65[96];
  *(_OWORD *)(a6 + 177) = v45;
  *(_OWORD *)(a6 + 193) = *(_OWORD *)&v65[128];
  v46 = *(_OWORD *)&v65[48];
  *(_OWORD *)(a6 + 97) = *(_OWORD *)&v65[32];
  *(_OWORD *)(a6 + 113) = v46;
  v47 = *(_OWORD *)&v65[80];
  *(_OWORD *)(a6 + 129) = *(_OWORD *)&v65[64];
  *(_OWORD *)(a6 + 145) = v47;
  v48 = *(_OWORD *)&v65[16];
  *(_OWORD *)(a6 + 65) = *(_OWORD *)v65;
  *(_OWORD *)(a6 + 81) = v48;
  v67[6] = v37;
  v67[7] = v43;
  v67[8] = v63;
  v67[2] = v41;
  v67[3] = v44;
  v67[4] = v40;
  v67[5] = v39;
  v66 = v53 ^ 1;
  *(_QWORD *)a6 = 0;
  *(_QWORD *)(a6 + 8) = v54;
  *(_QWORD *)(a6 + 16) = v27;
  *(_QWORD *)(a6 + 24) = v28;
  *(_QWORD *)(a6 + 32) = v29;
  *(_QWORD *)(a6 + 40) = v51;
  *(_QWORD *)(a6 + 48) = v50;
  *(_QWORD *)(a6 + 56) = v52;
  *(_BYTE *)(a6 + 64) = v53 ^ 1;
  *(_QWORD *)(a6 + 208) = *(_QWORD *)&v65[143];
  v67[0] = v38;
  v67[1] = v42;
  sub_1000313AC((uint64_t)v64);
  return sub_1000313E0((uint64_t)v67);
}

uint64_t sub_10002FC78(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3 & 1;
  v6 = type metadata accessor for BackgroundActivitySession(0);
  v7 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  return StateObject.wrappedValue.getter(a1, a2, v5, v6, v7);
}

void sub_10002FCE0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  NSObject *oslog;
  uint64_t v33;
  uint64_t v34;

  v7 = a5 & 1;
  if ((a1 & 1) == 0)
  {
    if (qword_10004EDB8 != -1)
      swift_once(&qword_10004EDB8, sub_10002E2E0);
    v20 = type metadata accessor for Logger(0);
    sub_100008930(v20, (uint64_t)qword_1000506F8);
    sub_100008E74(a3, a4);
    swift_errorRetain(a2);
    sub_100008E74(a3, a4);
    v21 = swift_errorRetain(a2);
    oslog = Logger.logObject.getter(v21);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v22))
    {
      v11 = swift_slowAlloc(22, -1);
      v30 = (uint64_t *)swift_slowAlloc(8, -1);
      v31 = swift_slowAlloc(32, -1);
      v34 = v31;
      *(_DWORD *)v11 = 136315394;
      v23 = type metadata accessor for BackgroundActivitySession(0);
      v24 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
      v25 = StateObject.wrappedValue.getter(a3, a4, v7, v23, v24);
      v26 = *(_QWORD *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
      v27 = *(_QWORD *)(v25 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
      swift_bridgeObjectRetain(v27);
      swift_release(v25);
      v33 = sub_10002785C(v26, v27, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
      swift_bridgeObjectRelease(v27);
      sub_100016C70(a3, a4);
      sub_100016C70(a3, a4);
      *(_WORD *)(v11 + 12) = 2112;
      if (a2)
      {
        swift_errorRetain(a2);
        v28 = _swift_stdlib_bridgeErrorToNSError(a2);
        v33 = v28;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
      }
      else
      {
        v33 = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
        v28 = 0;
      }
      *v30 = v28;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, oslog, v22, "App launch for bundle ID %s failed: %@", (uint8_t *)v11, 0x16u);
      v29 = sub_1000088F0(&qword_10004FE30);
      swift_arrayDestroy(v30, 1, v29);
      swift_slowDealloc(v30, -1, -1);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      v18 = v31;
      goto LABEL_16;
    }
    sub_100016C70(a3, a4);
    sub_100016C70(a3, a4);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
LABEL_13:

    return;
  }
  if (qword_10004EDB8 != -1)
    swift_once(&qword_10004EDB8, sub_10002E2E0);
  v8 = type metadata accessor for Logger(0);
  sub_100008930(v8, (uint64_t)qword_1000506F8);
  sub_100008E74(a3, a4);
  v9 = sub_100008E74(a3, a4);
  oslog = Logger.logObject.getter(v9);
  v10 = static os_log_type_t.info.getter();
  if (!os_log_type_enabled(oslog, v10))
  {
    sub_100016C70(a3, a4);
    sub_100016C70(a3, a4);
    goto LABEL_13;
  }
  v11 = swift_slowAlloc(12, -1);
  v12 = swift_slowAlloc(32, -1);
  v34 = v12;
  *(_DWORD *)v11 = 136315138;
  v13 = type metadata accessor for BackgroundActivitySession(0);
  v14 = sub_1000067D0((unint64_t *)&qword_10004FB40, type metadata accessor for BackgroundActivitySession, (uint64_t)&unk_100035AD8);
  v15 = StateObject.wrappedValue.getter(a3, a4, v7, v13, v14);
  v17 = *(_QWORD *)(v15 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID);
  v16 = *(_QWORD *)(v15 + OBJC_IVAR____TtC18ActivityProgressUI25BackgroundActivitySession_bundleID + 8);
  swift_bridgeObjectRetain(v16);
  swift_release(v15);
  v33 = sub_10002785C(v17, v16, &v34);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
  swift_bridgeObjectRelease(v16);
  sub_100016C70(a3, a4);
  sub_100016C70(a3, a4);
  _os_log_impl((void *)&_mh_execute_header, oslog, v10, "App launch succeeded for bundle ID %s", (uint8_t *)v11, 0xCu);
  swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
  v18 = v12;
LABEL_16:
  swift_slowDealloc(v18, -1, -1);
  swift_slowDealloc(v11, -1, -1);

}

void sub_100030244(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

uint64_t sub_1000302A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10002E370(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1);
}

uint64_t sub_1000302B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  __n128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned __int8 v71;
  uint64_t v72;
  unsigned __int8 v73;
  uint64_t v74;
  uint64_t v75;

  v69 = sub_1000088F0(&qword_100050780);
  __chkstk_darwin(v69);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1000088F0(&qword_100050788);
  __chkstk_darwin(v67);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v66);
  v13 = (double *)((char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = type metadata accessor for Image.ResizingMode(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_1000088F0(&qword_100050790);
  __chkstk_darwin(v64);
  v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1000088F0(&qword_100050798);
  __chkstk_darwin(v20);
  v65 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1000088F0(&qword_1000507A0);
  v22 = __chkstk_darwin(v68);
  __chkstk_darwin(v22);
  if (a1)
  {
    v60 = v24;
    v61 = (uint64_t)&v51 - v23;
    v63 = a1;
    v25 = Image.init(uiImage:)();
    v62 = a2;
    v26 = v25;
    (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, enum case for Image.ResizingMode.stretch(_:), v14);
    v27 = Image.resizable(capInsets:resizingMode:)(v17, v26, 0.0, 0.0, 0.0, 0.0);
    v28 = swift_release(v26);
    v29 = (*(uint64_t (**)(char *, uint64_t, __n128))(v15 + 8))(v17, v14, v28);
    v30 = static Alignment.center.getter(v29);
    _FrameLayout.init(width:height:alignment:)(&v70, *(_QWORD *)&a3, 0, *(_QWORD *)&a3, 0, v30, v31);
    v57 = v70;
    v56 = v71;
    v55 = v72;
    v54 = v73;
    v53 = v74;
    v52 = v75;
    v58 = v20;
    v32 = v66;
    v33 = (char *)v13 + *(int *)(v66 + 20);
    v34 = enum case for RoundedCornerStyle.continuous(_:);
    v35 = type metadata accessor for RoundedCornerStyle(0);
    v36 = *(_QWORD *)(v35 - 8);
    v59 = v9;
    v37 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 104);
    v37(v33, v34, v35);
    *v13 = a4;
    v13[1] = a4;
    sub_1000316F4((uint64_t)v13, (uint64_t)v11);
    v38 = v67;
    *(_WORD *)&v11[*(int *)(v67 + 36)] = 256;
    sub_100009050((uint64_t)v11, (uint64_t)&v19[*(int *)(v64 + 36)], &qword_100050788);
    *(_QWORD *)v19 = v27;
    *((_QWORD *)v19 + 1) = 0;
    *((_WORD *)v19 + 8) = 257;
    *((_QWORD *)v19 + 3) = v57;
    v19[32] = v56;
    *((_QWORD *)v19 + 5) = v55;
    v19[48] = v54;
    v39 = v52;
    *((_QWORD *)v19 + 7) = v53;
    *((_QWORD *)v19 + 8) = v39;
    *((_WORD *)v19 + 36) = 0;
    swift_retain(v27);
    sub_1000164F8((uint64_t)v11, &qword_100050788);
    sub_100031738((uint64_t)v13);
    v40 = swift_release(v27);
    ((void (*)(char *, uint64_t, uint64_t, __n128))v37)((char *)v13 + *(int *)(v32 + 20), v34, v35, v40);
    *v13 = a4;
    v13[1] = a4;
    v41 = v58;
    v42 = (uint64_t)v65;
    v43 = (uint64_t)&v65[*(int *)(v58 + 36)];
    sub_1000316F4((uint64_t)v13, v43);
    *(_WORD *)(v43 + *(int *)(v38 + 36)) = 256;
    sub_100009050((uint64_t)v19, v42, &qword_100050790);
    sub_100031738((uint64_t)v13);
    sub_1000164F8((uint64_t)v19, &qword_100050790);
    v44 = sub_100031498();
    v45 = v60;
    View.accessibilityHidden(_:)(1, v41, v44);
    sub_1000164F8(v42, &qword_100050798);
    v46 = v61;
    sub_10000F82C(v45, v61, &qword_1000507A0);
    v47 = (uint64_t)v59;
    sub_100009050(v46, (uint64_t)v59, &qword_1000507A0);
    swift_storeEnumTagMultiPayload(v47, v69, 0);
    v48 = sub_100031414();
    _ConditionalContent<>.init(storage:)(v47, v68, &type metadata for EmptyView, v48, &protocol witness table for EmptyView);

    return sub_1000164F8(v46, &qword_1000507A0);
  }
  else
  {
    swift_storeEnumTagMultiPayload(v9, v69, 1);
    v50 = sub_100031414();
    return _ConditionalContent<>.init(storage:)(v9, v68, &type metadata for EmptyView, v50, &protocol witness table for EmptyView);
  }
}

uint64_t sub_1000307EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000302B0(*(void **)v1, a1, *(double *)(v1 + 8), *(double *)(v1 + 16));
}

uint64_t sub_1000307F8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C724, 1);
}

uint64_t sub_100030808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  double Width;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  __int128 v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  void (*v68)(char *, _QWORD, uint64_t);
  uint64_t v69;
  uint64_t result;
  uint64_t v71;
  char *v72;
  char *v73;
  void (*v74)(char *, char *, uint64_t);
  char *v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _OWORD v119[3];
  CGRect v120;

  v113 = a1;
  v117 = a2;
  v118 = sub_1000088F0(&qword_100050840);
  __chkstk_darwin(v118);
  v3 = (char *)&v98 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_1000088F0(&qword_100050848);
  v4 = __chkstk_darwin(v102);
  v6 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v100 = (char *)&v98 - v7;
  v8 = type metadata accessor for DynamicTypeSize(0);
  v9 = *(_QWORD **)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v98 - v13;
  v107 = sub_1000088F0(&qword_100050850);
  v15 = __chkstk_darwin(v107);
  v99 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v104 = (uint64_t)&v98 - v17;
  v106 = sub_1000088F0(&qword_100050858);
  v105 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin(v106);
  v103 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_1000088F0(&qword_100050860);
  v19 = __chkstk_darwin(v111);
  v101 = (char *)&v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v108 = (uint64_t)&v98 - v21;
  v114 = sub_1000088F0(&qword_100050868);
  __chkstk_darwin(v114);
  v116 = (uint64_t)&v98 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = sub_1000088F0(&qword_100050870);
  __chkstk_darwin(v109);
  v110 = (uint64_t)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_1000088F0(&qword_100050878);
  __chkstk_darwin(v115);
  v112 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1000088F0(&qword_100050880);
  __chkstk_darwin(v25);
  v27 = (char *)&v98 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1000088F0(&qword_100050888);
  v29 = __chkstk_darwin(v28);
  v31 = (char *)&v98 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v29);
  v35 = (char *)&v98 - v34;
  if ((v33 & 1) != 0)
  {
    v43 = v32;
    v44 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v44, "bounds");
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;

    v120.origin.x = v46;
    v120.origin.y = v48;
    v120.size.width = v50;
    v120.size.height = v52;
    Width = CGRectGetWidth(v120);
    if (qword_10004ED30 != -1)
      v53 = swift_once(&qword_10004ED30, sub_10002A334);
    v55 = Width - (*(double *)&qword_100050B58 + *(double *)&qword_100050B58);
    v56 = static Alignment.center.getter(v53);
    _FrameLayout.init(width:height:alignment:)(v119, *(_QWORD *)&v55, 0, 0, 1, v56, v57);
    v58 = sub_1000088F0(&qword_100050890);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 16))(v27, v113, v58);
    v59 = &v27[*(int *)(v25 + 36)];
    v60 = v119[1];
    *(_OWORD *)v59 = v119[0];
    *((_OWORD *)v59 + 1) = v60;
    *((_OWORD *)v59 + 2) = v119[2];
    sub_100009050((uint64_t)v27, (uint64_t)v31, &qword_100050880);
    *(_WORD *)&v31[*(int *)(v43 + 36)] = 256;
    sub_1000164F8((uint64_t)v27, &qword_100050880);
    v38 = &qword_100050888;
    sub_10000F82C((uint64_t)v31, (uint64_t)v35, &qword_100050888);
    v61 = v110;
    sub_100009050((uint64_t)v35, v110, &qword_100050888);
    swift_storeEnumTagMultiPayload(v61, v109, 0);
    v62 = sub_100031B14();
    v63 = sub_100031C14();
    v64 = (uint64_t)v112;
    _ConditionalContent<>.init(storage:)(v61, v43, v111, v62, v63);
    v65 = v116;
    sub_100009050(v64, v116, &qword_100050878);
    swift_storeEnumTagMultiPayload(v65, v114, 0);
    v66 = sub_100031AA8();
    v67 = sub_100031B98(&qword_1000508C8, &qword_100050840);
    _ConditionalContent<>.init(storage:)(v65, v115, v118, v66, v67);
    sub_1000164F8(v64, &qword_100050878);
    v42 = (uint64_t)v35;
    return sub_1000164F8(v42, v38);
  }
  if ((v33 & 0x100) == 0)
  {
    v36 = sub_1000088F0(&qword_100050890);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v3, v113, v36);
    v37 = v118;
    *(_WORD *)&v3[*(int *)(v118 + 36)] = 256;
    v38 = &qword_100050840;
    v39 = v116;
    sub_100009050((uint64_t)v3, v116, &qword_100050840);
    swift_storeEnumTagMultiPayload(v39, v114, 1);
    v40 = sub_100031AA8();
    v41 = sub_100031B98(&qword_1000508C8, &qword_100050840);
    _ConditionalContent<>.init(storage:)(v39, v115, v37, v40, v41);
    v42 = (uint64_t)v3;
    return sub_1000164F8(v42, v38);
  }
  v98 = v32;
  v68 = (void (*)(char *, _QWORD, uint64_t))v9[13];
  v68(v14, enum case for DynamicTypeSize.xSmall(_:), v8);
  v68(v12, enum case for DynamicTypeSize.large(_:), v8);
  v69 = sub_1000067D0(&qword_1000508D0, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
  result = dispatch thunk of static Comparable.<= infix(_:_:)(v14, v12, v8, v69);
  if ((result & 1) != 0)
  {
    v71 = v102;
    v72 = v100;
    v73 = &v100[*(int *)(v102 + 48)];
    v74 = (void (*)(char *, char *, uint64_t))v9[4];
    v74(v100, v14, v8);
    v74(v73, v12, v8);
    v75 = &v6[*(int *)(v71 + 48)];
    v76 = (void (*)(char *, char *, uint64_t))v9[2];
    v76(v6, v72, v8);
    v76(v75, v73, v8);
    v77 = (uint64_t)v99;
    v74(v99, v6, v8);
    v78 = (void (*)(char *, uint64_t))v9[1];
    v78(v75, v8);
    v79 = &v6[*(int *)(v71 + 48)];
    v74(v6, v72, v8);
    v74(v79, v73, v8);
    v80 = v107;
    v74((char *)(v77 + *(int *)(v107 + 36)), v79, v8);
    v78(v6, v8);
    v81 = v104;
    sub_10000F82C(v77, v104, &qword_100050850);
    v82 = sub_1000088F0(&qword_100050890);
    v83 = sub_100008E7C(&qword_1000508B0, &qword_100050890, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v84 = sub_100008E7C(&qword_1000508C0, &qword_100050850, (uint64_t)&protocol conformance descriptor for ClosedRange<A>);
    v85 = v103;
    View.dynamicTypeSize<A>(_:)(v81, v82, v80, v83, v84);
    sub_1000164F8(v81, &qword_100050850);
    v86 = v105;
    v87 = (uint64_t)v101;
    v88 = v106;
    (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v101, v85, v106);
    v89 = v111;
    *(_WORD *)(v87 + *(int *)(v111 + 36)) = 256;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v88);
    v38 = &qword_100050860;
    v90 = v108;
    sub_10000F82C(v87, v108, &qword_100050860);
    v91 = v110;
    sub_100009050(v90, v110, &qword_100050860);
    swift_storeEnumTagMultiPayload(v91, v109, 1);
    v92 = sub_100031B14();
    v93 = sub_100031C14();
    v94 = (uint64_t)v112;
    _ConditionalContent<>.init(storage:)(v91, v98, v89, v92, v93);
    v95 = v116;
    sub_100009050(v94, v116, &qword_100050878);
    swift_storeEnumTagMultiPayload(v95, v114, 0);
    v96 = sub_100031AA8();
    v97 = sub_100031B98(&qword_1000508C8, &qword_100050840);
    _ConditionalContent<>.init(storage:)(v95, v115, v118, v96, v97);
    sub_1000164F8(v94, &qword_100050878);
    v42 = v90;
    return sub_1000164F8(v42, v38);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000311B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100030808(a1, a2);
}

void sub_1000311F8()
{
  uint64_t v0;

  sub_10002F178(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

unint64_t sub_100031204()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050748;
  if (!qword_100050748)
  {
    v1 = sub_100008B84(&qword_100050740);
    sub_100008E7C(&qword_100050750, &qword_100050758, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_100008E7C(&qword_100050760, &qword_100050768, (uint64_t)&protocol conformance descriptor for _ContentShapeModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050748);
  }
  return result;
}

uint64_t sub_1000312A0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 104);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 120));
  swift_bridgeObjectRelease(v2);
  return a1;
}

id sub_1000312DC(id result, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    sub_100008E74((uint64_t)result, a2);
    return a4;
  }
  return result;
}

void sub_10003130C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    sub_100016C70(a1, a2);

  }
}

uint64_t sub_100031348()
{
  uint64_t v0;

  return sub_10002FC78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_100031358()
{
  uint64_t v0;

  sub_100016C70(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 33, 7);
}

void sub_100031380(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_10002FCE0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32));
}

uint64_t sub_10003138C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003139C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000313AC(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRetain(v2);
  return a1;
}

uint64_t sub_1000313E0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease(v2);
  return a1;
}

unint64_t sub_100031414()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000507A8;
  if (!qword_1000507A8)
  {
    v1 = sub_100008B84(&qword_1000507A0);
    sub_100031498();
    sub_1000067D0(&qword_100050808, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000507A8);
  }
  return result;
}

unint64_t sub_100031498()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000507B0;
  if (!qword_1000507B0)
  {
    v1 = sub_100008B84(&qword_100050798);
    sub_10003151C();
    sub_100008E7C(&qword_100050800, &qword_100050788, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000507B0);
  }
  return result;
}

unint64_t sub_10003151C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000507B8;
  if (!qword_1000507B8)
  {
    v1 = sub_100008B84(&qword_100050790);
    sub_1000315A0();
    sub_100008E7C(&qword_100050800, &qword_100050788, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000507B8);
  }
  return result;
}

unint64_t sub_1000315A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000507C0;
  if (!qword_1000507C0)
  {
    v1 = sub_100008B84(&qword_1000507C8);
    sub_100031624();
    sub_100008E7C(&qword_1000507F0, &qword_1000507F8, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000507C0);
  }
  return result;
}

unint64_t sub_100031624()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000507D0;
  if (!qword_1000507D0)
  {
    v1 = sub_100008B84(&qword_1000507D8);
    sub_100031690();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000507D0);
  }
  return result;
}

unint64_t sub_100031690()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000507E0;
  if (!qword_1000507E0)
  {
    v1 = sub_100008B84(&qword_1000507E8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000507E0);
  }
  return result;
}

uint64_t sub_1000316F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100031738(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_WORD *initializeBufferWithCopyOfBuffer for PlatterEnvironmentModifier(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlatterEnvironmentModifier(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlatterEnvironmentModifier(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_100031870 + 4 * byte_100036DA5[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_1000318A4 + 4 * byte_100036DA0[v4]))();
}

uint64_t sub_1000318A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1000318AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x1000318B4);
  return result;
}

uint64_t sub_1000318C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x1000318C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1000318CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1000318D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlatterEnvironmentModifier()
{
  return &type metadata for PlatterEnvironmentModifier;
}

unint64_t sub_1000318F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050810;
  if (!qword_100050810)
  {
    v1 = sub_100008B84(&qword_100050728);
    sub_100031960();
    sub_1000319E4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050810);
  }
  return result;
}

unint64_t sub_100031960()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050818;
  if (!qword_100050818)
  {
    v1 = sub_100008B84(&qword_100050718);
    sub_100008E7C(&qword_100050820, &qword_100050710, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050818);
  }
  return result;
}

unint64_t sub_1000319E4()
{
  unint64_t result;

  result = qword_100050828;
  if (!qword_100050828)
  {
    result = swift_getWitnessTable(&unk_10003707C, &type metadata for PlatterEnvironmentModifier);
    atomic_store(result, (unint64_t *)&qword_100050828);
  }
  return result;
}

unint64_t sub_100031A2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050830;
  if (!qword_100050830)
  {
    v1 = sub_100008B84(&qword_100050838);
    sub_100031414();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050830);
  }
  return result;
}

uint64_t sub_100031A98(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10003C774, 1);
}

unint64_t sub_100031AA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100050898;
  if (!qword_100050898)
  {
    v1 = sub_100008B84(&qword_100050878);
    sub_100031B14();
    sub_100031C14();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100050898);
  }
  return result;
}

unint64_t sub_100031B14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000508A0;
  if (!qword_1000508A0)
  {
    v1 = sub_100008B84(&qword_100050888);
    sub_100031B98(&qword_1000508A8, &qword_100050880);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000508A0);
  }
  return result;
}

uint64_t sub_100031B98(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100008B84(a2);
    sub_100008E7C(&qword_1000508B0, &qword_100050890, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100031C14()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_1000508B8;
  if (!qword_1000508B8)
  {
    v1 = sub_100008B84(&qword_100050860);
    v2[0] = sub_100008B84(&qword_100050890);
    v2[1] = sub_100008B84(&qword_100050850);
    v2[2] = sub_100008E7C(&qword_1000508B0, &qword_100050890, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v2[3] = sub_100008E7C(&qword_1000508C0, &qword_100050850, (uint64_t)&protocol conformance descriptor for ClosedRange<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000508B8);
  }
  return result;
}

unint64_t sub_100031D08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000508D8;
  if (!qword_1000508D8)
  {
    v1 = sub_100008B84(&qword_1000508E0);
    sub_100031AA8();
    sub_100031B98(&qword_1000508C8, &qword_100050840);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000508D8);
  }
  return result;
}

char *APUILiveActivitiesHostingController.__allocating_init(rootView:)(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  char *v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_100032A4C(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*((_QWORD *)v2 + 10) - 8) + 8))(a1);
  return v5;
}

id APUISecureWindow.__allocating_init(windowScene:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithWindowScene:", a1);

  return v3;
}

uint64_t APUISecureHostingController.__allocating_init(rootView:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = sub_100032A08(a1, a2, a3, a4);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4
                                                          + class metadata base offset for APUISecureHostingController)
                                              - 8)
                                  + 8))(a1);
  return v6;
}

uint64_t sub_100031E78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100008948(v0, qword_1000508E8);
  v1 = sub_100008930(v0, (uint64_t)qword_1000508E8);
  if (qword_10004ED98 != -1)
    swift_once(&qword_10004ED98, sub_10002A674);
  v2 = sub_100008930(v0, (uint64_t)qword_100050BF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100031F08()
{
  return 1;
}

uint64_t APUISecureHostingController.init(rootView:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = swift_isaMask & *v1;
  v4 = sub_10003298C(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3
                                                          + class metadata base offset for APUISecureHostingController)
                                              - 8)
                                  + 8))(a1);
  return v4;
}

void *APUISecureHostingController.__allocating_init(coder:rootView:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return APUISecureHostingController.init(coder:rootView:)(a1, a2);
}

void *APUISecureHostingController.init(coder:rootView:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v13;

  v5 = *(_QWORD *)((swift_isaMask & *v2) + class metadata base offset for APUISecureHostingController);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v13 - v7;
  (*(void (**)(char *))(v6 + 16))((char *)&v13 - v7);
  v9 = (void *)UIHostingController.init(coder:rootView:)(a1, v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11 = v9;
  v10(a2, v5);
  if (v9)

  return v9;
}

id APUISecureHostingController.init(coder:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for APUISecureHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + class metadata base offset for APUISecureHostingController), *(_QWORD *)((swift_isaMask & *v4) + class metadata base offset for APUISecureHostingController + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_1000320E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return APUISecureHostingController.init(coder:)(v3, v4, v5, v6);
}

id APUISecureHostingController.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for APUISecureHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + class metadata base offset for APUISecureHostingController), *(_QWORD *)((swift_isaMask & *v4) + class metadata base offset for APUISecureHostingController + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

id APUISecureWindow.init(windowScene:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  v3 = objc_msgSendSuper2(&v5, "initWithWindowScene:", a1);

  return v3;
}

id APUISecureWindow.init(frame:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for APUISecureWindow();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id APUISecureWindow.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id APUISecureWindow.__allocating_init(contentRect:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithContentRect:", a1, a2, a3, a4);
}

id APUISecureWindow.init(contentRect:)(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for APUISecureWindow();
  return objc_msgSendSuper2(&v10, "initWithContentRect:", a1, a2, a3, a4);
}

id APUISecureWindow.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APUISecureWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

double sub_1000324A0(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  APUILiveActivitiesHostingController.preferredContentSize.getter();
  v3 = v2;

  return v3;
}

id APUILiveActivitiesHostingController.preferredContentSize.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + qword_100050900), "preferredContentSize");
}

void sub_1000324F8(void *a1)
{
  id v1;

  v1 = a1;
  APUILiveActivitiesHostingController.preferredContentSize.setter();

}

id APUILiveActivitiesHostingController.preferredContentSize.setter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + qword_100050900), "setPreferredContentSize:");
}

char *APUILiveActivitiesHostingController.init(rootView:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  char *v4;

  v3 = swift_isaMask & *v1;
  v4 = sub_100032A4C(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

void APUILiveActivitiesHostingController.init(coder:)()
{
  sub_100033070();
}

void sub_1000325D0()
{
  sub_100033070();
}

uint64_t sub_1000325FC(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = v1;
  return a1;
}

uint64_t sub_100032614()
{
  return 1;
}

Swift::Void __swiftcall APUILiveActivitiesHostingController.viewIsAppearing(_:)(Swift::Bool a1)
{
  uint64_t v1;
  _QWORD *v2;
  objc_class *v4;
  objc_super v5;

  v4 = (objc_class *)type metadata accessor for APUILiveActivitiesHostingController(0, *(_QWORD *)((swift_isaMask & *v2) + 0x50), *(_QWORD *)((swift_isaMask & *v2) + 0x58), v1);
  v5.receiver = v2;
  v5.super_class = v4;
  objc_msgSendSuper2(&v5, "viewIsAppearing:", a1);
  _s18ActivityProgressUI35APUILiveActivitiesHostingControllerC29preferredContentSizeDidChange08forChildI9ContainerySo09UIContentO0_p_tF_0_0();
}

void sub_10003267C(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4;

  v4 = a1;
  APUILiveActivitiesHostingController.viewIsAppearing(_:)(a3);

}

void sub_1000326C0(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;

  swift_unknownObjectRetain(a3);
  v5 = a1;
  _s18ActivityProgressUI35APUILiveActivitiesHostingControllerC29preferredContentSizeDidChange08forChildI9ContainerySo09UIContentO0_p_tF_0();
  swift_unknownObjectRelease(a3);

}

void _s18ActivityProgressUI35APUILiveActivitiesHostingControllerC29preferredContentSizeDidChange08forChildI9ContainerySo09UIContentO0_p_tF_0_0()
{
  void *v0;
  id v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;

  v1 = objc_msgSend(v0, "view");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "window");

    if (v3)
    {
      v4 = -[NSObject windowScene](v3, "windowScene");
      if (v4)
      {
        v17 = v4;
        v5 = type metadata accessor for ActivityScene(0);
        if (swift_dynamicCastClass(v17, v5))
        {
          objc_msgSend(v0, "preferredContentSize");
          v7 = v6;
          v9 = v8;
          v10 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
          v11 = ActivitySceneMetrics.init(size:cornerRadius:)(v7, v9, 18.0);
          dispatch thunk of ActivityScene.resolvedMetrics.setter(v11);
          v12 = v3;
LABEL_13:

          return;
        }

      }
      if (qword_10004EDC0 != -1)
        swift_once(&qword_10004EDC0, sub_100031E78);
      v13 = type metadata accessor for Logger(0);
      v14 = sub_100008930(v13, (uint64_t)qword_1000508E8);
      v12 = Logger.logObject.getter(v14);
      v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v15, "LiveActivitiesHostingController used in a scene that's not an ActivityScene", v16, 2u);
        swift_slowDealloc(v16, -1, -1);
      }
      v17 = v3;
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
}

void APUILiveActivitiesHostingController.init(nibName:bundle:)()
{
  sub_1000330D8();
}

void sub_1000328F4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  sub_1000330D8();
}

id APUILiveActivitiesHostingController.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for APUILiveActivitiesHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), *(_QWORD *)((swift_isaMask & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

void sub_10003297C(uint64_t a1)
{

}

uint64_t sub_10003298C(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  __chkstk_darwin(a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return UIHostingController.init(rootView:)(v2);
}

uint64_t sub_100032A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for APUISecureHostingController(0, *(_QWORD *)(v4 + class metadata base offset for APUISecureHostingController), *(_QWORD *)(v4 + class metadata base offset for APUISecureHostingController + 8), a4));
  return sub_10003298C(a1);
}

char *sub_100032A4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  objc_class *v23;
  char *v24;
  char *result;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void *v30;
  id v31;
  char *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  char *v39;
  id v40;
  id v41;
  char *v42;
  id v43;
  char *v44;
  id v45;
  id v46;
  char *v47;
  id v48;
  char *v49;
  id v50;
  id v51;
  char *v52;
  id v53;
  char *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  Class isa;
  uint64_t v61;
  objc_super v62;
  uint64_t v63;

  v3 = swift_isaMask & *v1;
  v4 = type metadata accessor for UIHostingControllerSizingOptions(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v3 + 80);
  v9 = *(_QWORD *)(v3 + 88);
  type metadata accessor for APUISecureHostingController(0, v8, v9, v10);
  v11 = v1;
  v15 = (void *)sub_100032A08(a1, v12, v13, v14);
  v16 = sub_1000088F0(&qword_10004EFC8);
  v17 = swift_allocObject(v16, ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72), *(unsigned __int8 *)(v5 + 80) | 7);
  *(_OWORD *)(v17 + 16) = xmmword_1000349A0;
  static UIHostingControllerSizingOptions.preferredContentSize.getter();
  v63 = v17;
  v18 = sub_100033188();
  v19 = sub_1000088F0(&qword_10004EFD8);
  v20 = sub_1000331D0();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v63, v19, v20, v4, v18);
  dispatch thunk of UIHostingController.sizingOptions.setter(v7);
  *(_QWORD *)((char *)v11 + qword_100050900) = v15;
  v21 = v15;

  v23 = (objc_class *)type metadata accessor for APUILiveActivitiesHostingController(0, v8, v9, v22);
  v62.receiver = v11;
  v62.super_class = v23;
  v24 = (char *)objc_msgSendSuper2(&v62, "initWithNibName:bundle:", 0, 0);
  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v26 = result;
  v27 = qword_100050900;
  result = (char *)objc_msgSend(*(id *)&v24[qword_100050900], "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v28 = result;
  objc_msgSend(v26, "addSubview:", result);

  objc_msgSend(v24, "addChildViewController:", *(_QWORD *)&v24[v27]);
  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v29 = result;
  v30 = (void *)objc_opt_self(UIColor);
  v31 = objc_msgSend(v30, "clearColor");
  objc_msgSend(v29, "setBackgroundColor:", v31);

  result = (char *)objc_msgSend(v21, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v32 = result;
  v33 = objc_msgSend(v30, "clearColor");
  objc_msgSend(v32, "setBackgroundColor:", v33);

  result = (char *)objc_msgSend(v21, "view");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v34 = result;
  objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v35 = sub_1000088F0(&qword_10004FDA0);
  v36 = swift_allocObject(v35, 64, 7);
  *(_OWORD *)(v36 + 16) = xmmword_1000349B0;
  result = (char *)objc_msgSend(v21, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v37 = result;
  v38 = objc_msgSend(result, "topAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v39 = result;
  v40 = objc_msgSend(result, "topAnchor");

  v41 = objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  *(_QWORD *)(v36 + 32) = v41;
  result = (char *)objc_msgSend(v21, "view");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v42 = result;
  v43 = objc_msgSend(result, "leadingAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v44 = result;
  v45 = objc_msgSend(result, "leadingAnchor");

  v46 = objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  *(_QWORD *)(v36 + 40) = v46;
  result = (char *)objc_msgSend(v21, "view");
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v47 = result;
  v48 = objc_msgSend(result, "trailingAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v49 = result;
  v50 = objc_msgSend(result, "trailingAnchor");

  v51 = objc_msgSend(v48, "constraintEqualToAnchor:", v50);
  *(_QWORD *)(v36 + 48) = v51;
  result = (char *)objc_msgSend(v21, "view");
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v52 = result;
  v53 = objc_msgSend(result, "bottomAnchor");

  result = (char *)objc_msgSend(v24, "view");
  if (result)
  {
    v54 = result;
    v55 = (void *)objc_opt_self(NSLayoutConstraint);
    v56 = objc_msgSend(v54, "bottomAnchor");

    v57 = objc_msgSend(v53, "constraintEqualToAnchor:", v56);
    *(_QWORD *)(v36 + 56) = v57;
    v63 = v36;
    specialized Array._endMutation()(v58);
    v59 = v63;
    sub_100008EBC();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v59);
    objc_msgSend(v55, "activateConstraints:", isa);

    return v24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for APUISecureHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100010778(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for APUISecureHostingController);
}

uint64_t type metadata accessor for APUISecureWindow()
{
  return objc_opt_self(_TtC18ActivityProgressUI16APUISecureWindow);
}

void sub_100033070()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/APUILiveActivitiesHostingController.swift", 60, 2, 80, 0);
  __break(1u);
}

uint64_t type metadata accessor for APUILiveActivitiesHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100010778(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for APUILiveActivitiesHostingController);
}

void sub_1000330D8()
{
  _swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.APUILiveActivitiesHostingController", 54, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

uint64_t sub_100033104(uint64_t a1)
{
  _BYTE v2[8];

  return swift_initClassMetadata2(a1, 0, 0, v2, class metadata base offset for APUISecureHostingController + a1 + 16);
}

uint64_t sub_100033144(uint64_t a1)
{
  char *v2;

  v2 = (char *)&value witness table for Builtin.UnknownObject + 64;
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 96);
}

unint64_t sub_100033188()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EFD0;
  if (!qword_10004EFD0)
  {
    v1 = type metadata accessor for UIHostingControllerSizingOptions(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for UIHostingControllerSizingOptions, v1);
    atomic_store(result, (unint64_t *)&qword_10004EFD0);
  }
  return result;
}

unint64_t sub_1000331D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10004EFE0;
  if (!qword_10004EFE0)
  {
    v1 = sub_100008B84(&qword_10004EFD8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10004EFE0);
  }
  return result;
}

uint64_t sub_100033220()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC18ActivityProgressUIP33_6240EC525BD7DF45E413BEDA957CF44319ResourceBundleClass);
}
