id sub_100003588()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerPickerServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StickerPickerServiceViewController()
{
  return objc_opt_self(_TtC20StickerPickerService34StickerPickerServiceViewController);
}

uint64_t sub_1000035D8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005148(v0, qword_100011770);
  sub_10000498C(v0, (uint64_t)qword_100011770);
  return Logger.init(subsystem:category:)(0xD000000000000029, 0x80000001000095E0, 0x6C6544656E656353, 0xED00006574616765);
}

id sub_1000037D0()
{
  return sub_100004864(0, type metadata accessor for SecureWindow);
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC20StickerPickerServiceP33_4C704956F8BACDD4BADE8414C9B6FFAB12SecureWindow);
}

void sub_1000038C0(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t OpaqueTypeConformance2;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  _QWORD *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  id v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  _QWORD *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  __n128 v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  __n128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  __n128 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  __n128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  __n128 v104;
  uint64_t v105;
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  __n128 v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  __n128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  __n128 v127;
  uint64_t v128;
  NSObject *v129;
  os_log_type_t v130;
  uint8_t *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  v3 = v2;
  LODWORD(v4) = a2;
  sub_1000048C4(&qword_1000118A0);
  v6 = __chkstk_darwin();
  v8 = (char *)&v133 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  UIScene.hostStorage.getter(v6);
  v9 = sub_1000048C4(&qword_1000118A8);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100004904((uint64_t)v8);
    return;
  }
  v11 = type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting(0);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v11, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
  v13 = sub_100004944();
  v14 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v11, v11, v13, v9, OpaqueTypeConformance2);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  v16 = ActivitityTypeConfiguration.activityType.getter(v15);
  v18 = v17;

  v19 = *(void **)(v3 + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window);
  if (!v19)
  {
    swift_bridgeObjectRelease(v18);
    return;
  }
  v20 = v19;
  v21 = objc_msgSend(a1, "coordinateSpace");
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  swift_unknownObjectRelease(v21);
  if (qword_100011720 != -1)
    swift_once(&qword_100011720, sub_1000035D8);
  v26 = type metadata accessor for Logger(0);
  v27 = sub_10000498C(v26, (uint64_t)qword_100011770);
  v28 = swift_bridgeObjectRetain_n(v18, 2);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.debug.getter();
  v31 = os_log_type_enabled(v29, v30);
  v136 = v16;
  if (!v31)
  {

    swift_bridgeObjectRelease_n(v18, 2);
    if (v25 == 0.0)
      goto LABEL_17;
    goto LABEL_11;
  }
  v32 = swift_slowAlloc(22, -1);
  v135 = v27;
  v33 = v32;
  v34 = swift_slowAlloc(64, -1);
  LODWORD(v134) = v4;
  v4 = v34;
  v138 = v34;
  *(_DWORD *)v33 = 136315394;
  v35 = String.debugDescription.getter(v16, v18);
  v36 = v20;
  v38 = v37;
  v137 = sub_1000049E8(v35, v37, &v138);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
  swift_bridgeObjectRelease_n(v18, 2);
  swift_bridgeObjectRelease(v38);
  *(_WORD *)(v33 + 12) = 2080;
  v39 = CGSize.debugDescription.getter(v23, v25);
  v41 = v40;
  v137 = sub_1000049E8(v39, v40, &v138);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
  v42 = v41;
  v20 = v36;
  swift_bridgeObjectRelease(v42);
  _os_log_impl((void *)&_mh_execute_header, v29, v30, "activityType: %s window size: %s", (uint8_t *)v33, 0x16u);
  swift_arrayDestroy(v4, 2, (char *)&type metadata for Any + 8);
  v43 = v4;
  LOBYTE(v4) = (_BYTE)v134;
  swift_slowDealloc(v43, -1, -1);
  v27 = v135;
  swift_slowDealloc(v33, -1, -1);

  if (v25 != 0.0)
  {
LABEL_11:
    if (v23 == 0.0)
      goto LABEL_17;
    v44 = objc_msgSend(v20, "rootViewController");

    if (!v44)
      goto LABEL_21;
    if ((v4 & 1) != 0)
    {
      v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeCollectionView, v45);
      v48 = v46;
      if (v136 == v47 && v18 == v46)
      {
        swift_bridgeObjectRelease(v18);
        goto LABEL_21;
      }
      v58 = _stringCompareWithSmolCheck(_:_:expecting:)(v136, v18, v47, v46, 0);
      swift_bridgeObjectRelease(v48);
      if ((v58 & 1) != 0)
      {
LABEL_21:
        swift_bridgeObjectRetain_n(v18, 2);
        v59 = a1;
        v135 = v27;
        v60 = Logger.logObject.getter(v59);
        v61 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v60, v61))
        {
          v62 = swift_slowAlloc(22, -1);
          v63 = (_QWORD *)swift_slowAlloc(8, -1);
          v133 = swift_slowAlloc(32, -1);
          v137 = (uint64_t)v59;
          v138 = v133;
          *(_DWORD *)v62 = 138412546;
          v134 = v20;
          v64 = v59;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
          *v63 = v59;

          *(_WORD *)(v62 + 12) = 2080;
          swift_bridgeObjectRetain(v18);
          v65 = v136;
          v137 = sub_1000049E8(v136, v18, &v138);
          v20 = v134;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
          swift_bridgeObjectRelease_n(v18, 3);
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "configure %@ with %s", (uint8_t *)v62, 0x16u);
          v66 = sub_1000048C4(&qword_1000118B8);
          swift_arrayDestroy(v63, 1, v66);
          swift_slowDealloc(v63, -1, -1);
          v67 = v133;
          swift_arrayDestroy(v133, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v67, -1, -1);
          swift_slowDealloc(v62, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(v18, 2);
          v65 = v136;
        }
        v73 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeCollectionView, v68);
        v75 = v74;
        if (v73 == v65 && v74 == v18)
        {
          swift_bridgeObjectRelease(v18);
LABEL_31:
          v78 = swift_bridgeObjectRelease(v18);
          v79 = type metadata accessor for LocalEmojiAndStickerCollectionViewController(0, v78);
          goto LABEL_32;
        }
        v76 = _stringCompareWithSmolCheck(_:_:expecting:)(v73, v74, v65, v18, 0);
        swift_bridgeObjectRelease(v75);
        if ((v76 & 1) != 0)
          goto LABEL_31;
        v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeCategoryBar, v77);
        v83 = v82;
        if (v81 == v65 && v82 == v18)
        {
          swift_bridgeObjectRelease(v18);
LABEL_39:
          v86 = swift_bridgeObjectRelease(v18);
          v79 = type metadata accessor for LocalCategoryViewController(0, v86);
          goto LABEL_32;
        }
        v84 = _stringCompareWithSmolCheck(_:_:expecting:)(v81, v82, v65, v18, 0);
        swift_bridgeObjectRelease(v83);
        if ((v84 & 1) != 0)
          goto LABEL_39;
        v87 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeDefaultBrowser, v85);
        v89 = v88;
        if (v87 == v65 && v88 == v18)
        {
          swift_bridgeObjectRelease(v18);
LABEL_44:
          v92 = swift_bridgeObjectRelease(v18);
          v79 = type metadata accessor for StickerPickerInProcessViewController(0, v92);
          goto LABEL_32;
        }
        v90 = _stringCompareWithSmolCheck(_:_:expecting:)(v87, v88, v65, v18, 0);
        swift_bridgeObjectRelease(v89);
        if ((v90 & 1) != 0)
          goto LABEL_44;
        v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeSearch, v91);
        v95 = v94;
        if (v93 == v65 && v94 == v18)
        {
          swift_bridgeObjectRelease(v18);
LABEL_49:
          v98 = swift_bridgeObjectRelease(v18);
          v79 = type metadata accessor for StickerSearchViewController(0, v98);
          goto LABEL_32;
        }
        v96 = _stringCompareWithSmolCheck(_:_:expecting:)(v93, v94, v65, v18, 0);
        swift_bridgeObjectRelease(v95);
        if ((v96 & 1) != 0)
          goto LABEL_49;
        v99 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeGenerateEmoji, v97);
        v101 = v100;
        if (v99 == v65 && v100 == v18)
        {
          swift_bridgeObjectRelease(v18);
        }
        else
        {
          v102 = _stringCompareWithSmolCheck(_:_:expecting:)(v99, v100, v65, v18, 0);
          swift_bridgeObjectRelease(v101);
          if ((v102 & 1) == 0)
          {
            v108 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypePhotoStickerPicker, v103);
            v110 = v109;
            if (v108 == v65 && v109 == v18)
            {
              swift_bridgeObjectRelease(v18);
            }
            else
            {
              v111 = v65;
              v112 = _stringCompareWithSmolCheck(_:_:expecting:)(v108, v109, v65, v18, 0);
              swift_bridgeObjectRelease(v110);
              if ((v112 & 1) == 0)
              {
                v117 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeMemojiEditor, v113);
                v119 = v118;
                if (v117 == v65 && v118 == v18)
                {
                  swift_bridgeObjectRelease(v18);
                }
                else
                {
                  v120 = _stringCompareWithSmolCheck(_:_:expecting:)(v117, v118, v65, v18, 0);
                  swift_bridgeObjectRelease(v119);
                  if ((v120 & 1) == 0)
                  {
                    v123 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeStickerEffectEditor, v121);
                    v125 = v124;
                    if (v123 == v65 && v124 == v18)
                    {
                      swift_bridgeObjectRelease(v18);
                    }
                    else
                    {
                      v126 = _stringCompareWithSmolCheck(_:_:expecting:)(v123, v124, v65, v18, 0);
                      swift_bridgeObjectRelease(v125);
                      if ((v126 & 1) == 0)
                      {
                        v128 = swift_bridgeObjectRetain(v18);
                        v129 = Logger.logObject.getter(v128);
                        v130 = static os_log_type_t.error.getter();
                        if (os_log_type_enabled(v129, v130))
                        {
                          v131 = (uint8_t *)swift_slowAlloc(12, -1);
                          v132 = swift_slowAlloc(32, -1);
                          v138 = v132;
                          *(_DWORD *)v131 = 136315138;
                          swift_bridgeObjectRetain(v18);
                          v137 = sub_1000049E8(v111, v18, &v138);
                          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
                          swift_bridgeObjectRelease_n(v18, 3);
                          _os_log_impl((void *)&_mh_execute_header, v129, v130, "Unsupported activity type: %s", v131, 0xCu);
                          swift_arrayDestroy(v132, 1, (char *)&type metadata for Any + 8);
                          swift_slowDealloc(v132, -1, -1);
                          swift_slowDealloc(v131, -1, -1);

                        }
                        else
                        {

                          swift_bridgeObjectRelease_n(v18, 2);
                        }
                        goto LABEL_33;
                      }
                    }
                    v127 = swift_bridgeObjectRelease(v18);
                    v79 = type metadata accessor for LocalStickerEffectEditorViewController(0, v127);
                    goto LABEL_32;
                  }
                }
                v122 = swift_bridgeObjectRelease(v18);
                v79 = type metadata accessor for AvatarEditorViewController(0, v122);
LABEL_32:
                v80 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v79)), "init");
                objc_msgSend(v20, "setRootViewController:", v80);

LABEL_33:
                objc_msgSend(v20, "makeKeyAndVisible");
LABEL_34:

                return;
              }
            }
            v114 = swift_bridgeObjectRelease(v18);
            v115 = type metadata accessor for StickerPhotosViewController(0, v114);
            v116 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v115)), "init");
            v107 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v116);

            objc_msgSend(v20, "setRootViewController:", v107);
LABEL_55:

            goto LABEL_33;
          }
        }
        v104 = swift_bridgeObjectRelease(v18);
        v105 = type metadata accessor for EmojiGenerationController(0, v104);
        v106 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v105)), "init");
        v107 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v106);

        objc_msgSend(v20, "setRootViewController:", v107);
        goto LABEL_55;
      }
    }
    swift_bridgeObjectRelease(v18);
    v70 = Logger.logObject.getter(v69);
    v71 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v72 = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "window already has a rootViewController", v72, 2u);
      swift_slowDealloc(v72, -1, -1);
    }

    goto LABEL_34;
  }
LABEL_17:
  v49 = a1;
  swift_bridgeObjectRetain(v18);
  v50 = v49;
  v51 = Logger.logObject.getter(v50);
  v52 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = swift_slowAlloc(22, -1);
    v54 = (_QWORD *)swift_slowAlloc(8, -1);
    v135 = swift_slowAlloc(32, -1);
    v137 = (uint64_t)v50;
    v138 = v135;
    *(_DWORD *)v53 = 138412546;
    v134 = v20;
    v55 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
    *v54 = v50;

    *(_WORD *)(v53 + 12) = 2080;
    swift_bridgeObjectRetain(v18);
    v137 = sub_1000049E8(v136, v18, &v138);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v137, &v138);
    swift_bridgeObjectRelease_n(v18, 3);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "empty window scene: %@ activityType: %s", (uint8_t *)v53, 0x16u);
    v56 = sub_1000048C4(&qword_1000118B8);
    swift_arrayDestroy(v54, 1, v56);
    swift_slowDealloc(v54, -1, -1);
    v57 = v135;
    swift_arrayDestroy(v135, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1, -1);
    swift_slowDealloc(v53, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v18, 2);
  }
}

id sub_100004858(uint64_t a1)
{
  return sub_100004864(a1, type metadata accessor for StickerPickerServiceSceneDelegate);
}

id sub_100004864(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for StickerPickerServiceSceneDelegate()
{
  return objc_opt_self(_TtC20StickerPickerService33StickerPickerServiceSceneDelegate);
}

uint64_t sub_1000048C4(uint64_t *a1)
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

uint64_t sub_100004904(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000048C4(&qword_1000118A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100004944()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000118B0;
  if (!qword_1000118B0)
  {
    v1 = type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for ActivitityTypeConfiguration.ConfigurationSetting, v1);
    atomic_store(result, (unint64_t *)&qword_1000118B0);
  }
  return result;
}

uint64_t sub_10000498C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1000049A4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000049B4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000049E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100004AB8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100005108((uint64_t)v12, *a3);
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
      sub_100005108((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000050E8(v12);
  return v7;
}

uint64_t sub_100004AB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100004C70(a5, a6);
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

uint64_t sub_100004C70(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100004D04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100004EDC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100004EDC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100004D04(uint64_t a1, unint64_t a2)
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
      v5 = sub_100004E78(v4, 0);
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

_QWORD *sub_100004E78(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000048C4((uint64_t *)&unk_1000118C0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100004EDC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000048C4((uint64_t *)&unk_1000118C0);
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

_BYTE **sub_100005028(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_100005038(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
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

uint64_t sub_1000050E8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005108(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100005148(uint64_t a1, uint64_t *a2)
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

void sub_100005188(void *a1)
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
  _QWORD *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v2 = v1;
  v4 = objc_opt_self(UIWindowScene);
  v5 = swift_dynamicCastObjCClass(a1, v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = qword_100011720;
    v8 = a1;
    if (v7 != -1)
      swift_once(&qword_100011720, sub_1000035D8);
    v9 = type metadata accessor for Logger(0);
    sub_10000498C(v9, (uint64_t)qword_100011770);
    v10 = v8;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = v2;
      v21 = v10;
      v14 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v13 = 138412290;
      v15 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
      *v14 = v10;

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "willConnectTo scene: %@", v13, 0xCu);
      v16 = sub_1000048C4(&qword_1000118B8);
      swift_arrayDestroy(v14, 1, v16);
      v17 = v14;
      v2 = v20;
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v13, -1, -1);

    }
    else
    {

    }
    v18 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v6);
    v19 = *(void **)(v2 + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window) = v18;

    sub_1000038C0(v6, 0);
  }
}

void sub_100005390(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  if (qword_100011720 != -1)
    swift_once(&qword_100011720, sub_1000035D8);
  v4 = type metadata accessor for Logger(0);
  sub_10000498C(v4, (uint64_t)qword_100011770);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = a2;
    v27 = v5;
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "windowScene didUpdateCoordinateSpace %@", v8, 0xCu);
    v11 = sub_1000048C4(&qword_1000118B8);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = objc_msgSend(v5, "coordinateSpace", v26, v27);
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  swift_unknownObjectRelease(v12);
  objc_msgSend(a2, "bounds");
  v30.origin.x = v21;
  v30.origin.y = v22;
  v30.size.width = v23;
  v30.size.height = v24;
  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = v18;
  v29.size.height = v20;
  v25 = CGRectEqualToRect(v29, v30);
  sub_1000038C0(v5, !v25);
}

void sub_1000055C8(void *a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;

  if (qword_100011720 != -1)
    swift_once(&qword_100011720, sub_1000035D8);
  v4 = type metadata accessor for Logger(0);
  sub_10000498C(v4, (uint64_t)qword_100011770);
  v11 = a1;
  v5 = Logger.logObject.getter(v11);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    v12 = v11;
    v9 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
    *v8 = v11;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 0xCu);
    v10 = sub_1000048C4(&qword_1000118B8);
    swift_arrayDestroy(v8, 1, v10);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
}

void sub_100005788(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t OpaqueTypeConformance2;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  id v41;
  uint64_t v42;

  sub_1000048C4(&qword_1000118A0);
  __chkstk_darwin();
  v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100011720 != -1)
    swift_once(&qword_100011720, sub_1000035D8);
  v4 = type metadata accessor for Logger(0);
  sub_10000498C(v4, (uint64_t)qword_100011770);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v41 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "sceneDidEnterBackground %@", v8, 0xCu);
    v11 = sub_1000048C4(&qword_1000118B8);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = objc_opt_self(UIWindowScene);
  v13 = swift_dynamicCastObjCClass(v5, v12);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = v5;
    UIScene.hostStorage.getter(v15);
    v16 = sub_1000048C4(&qword_1000118A8);
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v3, 1, v16) == 1)
    {

      sub_100004904((uint64_t)v3);
      return;
    }
    v18 = type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting(0);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v18, &opaque type descriptor for <<opaque return type of UIScene.hostStorage>>, 1);
    v20 = sub_100004944();
    v21 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter(v18, v18, v20, v16, OpaqueTypeConformance2);
    v22 = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v3, v16);
    v23 = ActivitityTypeConfiguration.activityType.getter(v22);
    v25 = v24;

    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypeGenerateEmoji, v26);
    v29 = v28;
    if (v27 != v23 || v28 != v25)
    {
      v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v28, v23, v25, 0);
      swift_bridgeObjectRelease(v29);
      if ((v30 & 1) != 0)
        goto LABEL_13;
      v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(kSTKStickerPickerActivityTypePhotoStickerPicker, v31);
      v38 = v37;
      if (v36 != v23 || v37 != v25)
      {
        v39 = _stringCompareWithSmolCheck(_:_:expecting:)(v36, v37, v23, v25, 0);
        swift_bridgeObjectRelease(v25);
        v32 = swift_bridgeObjectRelease(v38).n128_u64[0];
        if ((v39 & 1) == 0)
        {
LABEL_16:

          return;
        }
LABEL_14:
        v33 = objc_msgSend(v14, "keyWindow", *(double *)&v32);
        if (v33)
        {
          v34 = v33;
          v35 = objc_msgSend(v33, "firstResponder");

          objc_msgSend(v35, "resignFirstResponder");
        }
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease(v25);
LABEL_13:
    v32 = swift_bridgeObjectRelease(v25).n128_u64[0];
    goto LABEL_14;
  }
}

uint64_t sub_100005B34()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005148(v0, qword_100011990);
  sub_10000498C(v0, (uint64_t)qword_100011990);
  return Logger.init(subsystem:category:)(0xD000000000000029, 0x80000001000095E0, 0xD000000000000019, 0x8000000100009100);
}

uint64_t sub_100005BB4()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  type metadata accessor for StickerStore.PersistenceType(0);
  __chkstk_darwin();
  v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v2 + 104))(v1, enum case for StickerStore.PersistenceType.remote(_:));
  v3 = type metadata accessor for StickerStore(0);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  result = StickerStore.init(persistence:)(v1);
  qword_100011BF8 = result;
  return result;
}

uint64_t static StickersOnDemandReindexer.reindexStickersIfNecessary()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1000119B0 + dword_1000119B0);
  v1 = (_QWORD *)swift_task_alloc(unk_1000119B4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100005CA0;
  return v3();
}

uint64_t sub_100005CA0()
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

uint64_t sub_100005DFC(const void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = _Block_copy(a1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_1000119B0 + dword_1000119B0);
  v2 = (_QWORD *)swift_task_alloc(unk_1000119B4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100005E5C;
  return v4();
}

uint64_t sub_100005E5C()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  uint64_t v3;

  v1 = *(void (***)(_QWORD))(*v0 + 16);
  v3 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

id sub_100005EB8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char *, uint64_t);
  void *v17;
  uint64_t v18;
  void *v19;
  void **aBlock;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;

  v4 = sub_1000048C4(&qword_100011A68);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin();
  v7 = (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject(&unk_10000C788, 24, 7);
  *(_QWORD *)(v8 + 16) = a2;
  v9 = a2;
  AsyncThrowingStream.Continuation.onTermination.setter(sub_100007E78, v8, v4);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v10(v7, a1, v4);
  v11 = *(unsigned __int8 *)(v5 + 80);
  v12 = (v11 + 16) & ~v11;
  v13 = v12 + v6;
  v14 = v11 | 7;
  v15 = swift_allocObject(&unk_10000C7B0, v13, v11 | 7);
  v16 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v16(v15 + v12, v7, v4);
  v25 = sub_100007E8C;
  v26 = v15;
  aBlock = _NSConcreteStackBlock;
  v22 = 1107296256;
  v23 = sub_100006280;
  v24 = &unk_10000C7C8;
  v17 = _Block_copy(&aBlock);
  swift_release(v26);
  objc_msgSend(v9, "setFoundItemsHandler:", v17);
  _Block_release(v17);
  v10(v7, a1, v4);
  v18 = swift_allocObject(&unk_10000C800, v13, v14);
  v16(v18 + v12, v7, v4);
  v25 = sub_100007F18;
  v26 = v18;
  aBlock = _NSConcreteStackBlock;
  v22 = 1107296256;
  v23 = sub_10000632C;
  v24 = &unk_10000C818;
  v19 = _Block_copy(&aBlock);
  swift_release(v26);
  objc_msgSend(v9, "setCompletionHandler:", v19);
  _Block_release(v19);
  return objc_msgSend(v9, "start");
}

void sub_1000060E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = sub_1000048C4(&qword_100011A78);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v11 = a1;
    else
      v11 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v11);
    if (!v6)
      goto LABEL_9;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (!v6)
    {
LABEL_9:
      swift_bridgeObjectRelease(a1);
      return;
    }
  }
  if (v6 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v7 = 0;
      do
      {
        v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, a1);
        swift_unknownObjectRelease(v8);
        ++v7;
        v13 = 1;
        v9 = sub_1000048C4(&qword_100011A68);
        AsyncThrowingStream.Continuation.yield(_:)(&v13, v9);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
      while (v6 != v7);
    }
    else
    {
      do
      {
        v13 = 1;
        v10 = sub_1000048C4(&qword_100011A68);
        AsyncThrowingStream.Continuation.yield(_:)(&v13, v10);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        --v6;
      }
      while (v6);
    }
    goto LABEL_9;
  }
  __break(1u);
}

double sub_100006280(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  unint64_t v5;
  uint64_t v6;
  double result;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = sub_100007F74();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v5);
  swift_retain(v3);
  v4(v6);
  swift_release(v3);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v6).n128_u64[0];
  return result;
}

uint64_t sub_1000062DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  if (a1)
  {
    v3 = a1;
    swift_errorRetain(a1);
  }
  else
  {
    v3 = 0;
  }
  v1 = sub_1000048C4(&qword_100011A68);
  return AsyncThrowingStream.Continuation.finish(throwing:)(&v3, v1);
}

void sub_10000632C(uint64_t a1, void *a2)
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

uint64_t sub_100006380(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch(sub_10000639C, 0, 0);
}

uint64_t sub_10000639C()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char **v5;

  v1 = **(char ***)(v0 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native(v1) & 1) == 0)
    v1 = sub_1000067A4(0, *((_QWORD *)v1 + 2) + 1, 1, v1);
  v3 = *((_QWORD *)v1 + 2);
  v2 = *((_QWORD *)v1 + 3);
  if (v3 >= v2 >> 1)
    v1 = sub_1000067A4((char *)(v2 > 1), v3 + 1, 1, v1);
  v5 = *(char ***)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  *((_QWORD *)v1 + 2) = v3 + 1;
  *(_QWORD *)&v1[8 * v3 + 32] = v4;
  *v5 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id StickersOnDemandReindexer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id StickersOnDemandReindexer.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return objc_msgSendSuper2(&v2, "init");
}

id StickersOnDemandReindexer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006508(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_100007FB0;
  return v6();
}

uint64_t sub_10000655C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_100007FB0;
  return v7();
}

uint64_t sub_1000065B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_100007CF4(a1);
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
  v17 = swift_allocObject(&unk_10000C760, 32, 7);
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
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100011A18, v17);
}

uint64_t sub_1000066F4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100006758;
  return v6(a1);
}

uint64_t sub_100006758()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_1000067A4(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_1000048C4(&qword_100011A60);
      v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
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
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32])
          memmove(v14, a4 + 32, 8 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006B68(0, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000068B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for Sticker.StickerType(0);
  v0[3] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[4] = v2;
  v0[5] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000690C, 0, 0);
}

uint64_t sub_10000690C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100011730 != -1)
    swift_once(&qword_100011730, sub_100005BB4);
  v1 = *(_QWORD *)(v0 + 40);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 104))(v1, enum case for Sticker.StickerType.userContent(_:), *(_QWORD *)(v0 + 24));
  v2 = dispatch thunk of StickerStore.count(type:)(v1);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

char *sub_100006B68(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100006C50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_1000048C4(&qword_100011A30);
  v0[7] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[8] = v2;
  v0[9] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000048C4(&qword_100011A38);
  v0[10] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v0[11] = v4;
  v0[12] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000048C4(&qword_100011A40);
  v0[13] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v0[14] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0[15] = swift_task_alloc(v7);
  v0[16] = swift_task_alloc(v7);
  return swift_task_switch(sub_100006D18, 0, 0);
}

uint64_t sub_100006D18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  Class isa;
  id v11;
  id v12;
  NSString v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;

  static Task<>.checkCancellation()();
  v1 = v0[15];
  v2 = v0[16];
  v3 = v0[13];
  v20 = v0[14];
  v4 = v0[11];
  v5 = v0[12];
  v6 = v0[10];
  v7 = objc_msgSend((id)objc_opt_self(CSSuggestion), "emptySuggestion");
  v0[17] = v7;
  v8 = objc_msgSend((id)objc_opt_self(CSUserQueryContext), "userQueryContextWithCurrentSuggestion:", v7);
  v0[18] = v8;
  v9 = v8;
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v9, "setFetchAttributes:", isa);

  v11 = objc_allocWithZone((Class)CSSearchQuery);
  v12 = v9;
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v11, "initWithQueryString:queryContext:", v13, v12);
  v0[19] = v14;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v5, enum case for AsyncThrowingStream.Continuation.BufferingPolicy.unbounded<A, B>(_:), v6);
  v15 = swift_task_alloc(32);
  *(_QWORD *)(v15 + 16) = v14;
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)(&type metadata for Int, v5, sub_100007DC8, v15, &type metadata for Int);
  swift_task_dealloc(v15);
  v0[4] = &_swiftEmptyArrayStorage;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v2, v3);
  v16 = sub_100007E14(&qword_100011A50, &qword_100011A40, (uint64_t)&protocol conformance descriptor for AsyncThrowingStream<A, B>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v3, v16);
  v17 = sub_100007E14(&qword_100011A58, &qword_100011A30, (uint64_t)&protocol conformance descriptor for AsyncThrowingStream<A, B>.Iterator);
  v0[20] = v17;
  v18 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[21] = v18;
  *v18 = v0;
  v18[1] = sub_100006FCC;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 2, v0[7], v17);
}

uint64_t sub_100006FCC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t (*v7)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 168));
  if (v0)
  {
    v2[22] = v0;
    v4 = v2[8];
    v3 = v2[9];
    v5 = v2[7];
    v6 = swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
    (*(void (**)(uint64_t, uint64_t, __n128))(v4 + 8))(v3, v5, v6);
    v7 = sub_1000071AC;
  }
  else
  {
    v7 = sub_10000705C;
  }
  return swift_task_switch(v7, 0, 0);
}

uint64_t sub_10000705C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t *);

  if ((*(_BYTE *)(v0 + 24) & 1) != 0)
  {
    result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    v2 = *(_QWORD *)(v0 + 32);
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
    {
      v4 = 0;
      v5 = (uint64_t *)(v2 + 32);
      while (1)
      {
        v6 = *v5++;
        v7 = __OFADD__(v4, v6);
        v4 += v6;
        if (v7)
          break;
        if (!--v3)
          goto LABEL_9;
      }
      __break(1u);
    }
    else
    {
      v4 = 0;
LABEL_9:
      v9 = *(void **)(v0 + 144);
      v10 = *(_QWORD *)(v0 + 128);
      v11 = *(void **)(v0 + 136);
      v12 = *(_QWORD *)(v0 + 104);
      v13 = *(_QWORD *)(v0 + 112);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
      swift_bridgeObjectRelease(v2);
      v14 = *(_QWORD *)(v0 + 120);
      v15 = *(_QWORD *)(v0 + 96);
      v16 = *(_QWORD *)(v0 + 72);
      swift_task_dealloc(*(_QWORD *)(v0 + 128));
      swift_task_dealloc(v14);
      swift_task_dealloc(v15);
      swift_task_dealloc(v16);
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
    }
  }
  else
  {
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 16);
    v17 = (uint64_t (*)(uint64_t, uint64_t *))((char *)&dword_100011A48 + dword_100011A48);
    v8 = (_QWORD *)swift_task_alloc(unk_100011A4C);
    *(_QWORD *)(v0 + 184) = v8;
    *v8 = v0;
    v8[1] = sub_1000073CC;
    return v17(v0 + 32, (uint64_t *)(v0 + 40));
  }
  return result;
}

uint64_t sub_1000071AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;

  v1 = *(_QWORD *)(v0 + 176);
  if (qword_100011728 != -1)
    swift_once(&qword_100011728, sub_100005B34);
  v2 = type metadata accessor for Logger(0);
  sub_10000498C(v2, (uint64_t)qword_100011990);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v19 = *(void **)(v0 + 152);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v1);
    v8 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 48) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56);
    *v7 = v8;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Could not fetch total sticker count: %@", v6, 0xCu);
    v9 = sub_1000048C4(&qword_1000118B8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }
  v11 = *(void **)(v0 + 136);
  v10 = *(void **)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  swift_errorRelease(v1);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v15 = *(_QWORD *)(v0 + 120);
  v16 = *(_QWORD *)(v0 + 96);
  v17 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(-1);
}

uint64_t sub_1000073CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 184);
  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v5 = v2[8];
    v4 = v2[9];
    v6 = v2[7];
    v7 = swift_bridgeObjectRelease(v2[4]);
    (*(void (**)(uint64_t, uint64_t, __n128))(v5 + 8))(v4, v6, v7);
    v8 = sub_100007544;
  }
  else
  {
    v8 = sub_100007458;
  }
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_100007458()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of AsyncIteratorProtocol.next()
                                  + 1));
  v0[25] = v1;
  *v1 = v0;
  v1[1] = sub_1000074B8;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 2, v0[7], v0[20]);
}

uint64_t sub_1000074B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 200));
  if (v0)
  {
    v3 = v2[4];
    v2[22] = v0;
    v5 = v2[8];
    v4 = v2[9];
    v6 = v2[7];
    v7 = swift_bridgeObjectRelease(v3);
    (*(void (**)(uint64_t, uint64_t, __n128))(v5 + 8))(v4, v6, v7);
    v8 = sub_1000071AC;
  }
  else
  {
    v8 = sub_10000705C;
  }
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_100007544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;

  v1 = *(_QWORD *)(v0 + 192);
  if (qword_100011728 != -1)
    swift_once(&qword_100011728, sub_100005B34);
  v2 = type metadata accessor for Logger(0);
  sub_10000498C(v2, (uint64_t)qword_100011990);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v19 = *(void **)(v0 + 152);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v1);
    v8 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 48) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56);
    *v7 = v8;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Could not fetch total sticker count: %@", v6, 0xCu);
    v9 = sub_1000048C4(&qword_1000118B8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }
  v11 = *(void **)(v0 + 136);
  v10 = *(void **)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  swift_errorRelease(v1);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  v15 = *(_QWORD *)(v0 + 120);
  v16 = *(_QWORD *)(v0 + 96);
  v17 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(-1);
}

uint64_t sub_100007764()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100011A24);
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1000077A8;
  return sub_1000068B0();
}

uint64_t sub_1000077A8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 24);
  v5 = *v1;
  *(_QWORD *)(v5 + 32) = a1;
  swift_task_dealloc(v2);
  v3 = (_QWORD *)swift_task_alloc(dword_100011A2C);
  *(_QWORD *)(v5 + 40) = v3;
  *v3 = v5;
  v3[1] = sub_100007814;
  return sub_100006C50();
}

uint64_t sub_100007814(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 48) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100007870, 0, 0);
}

uint64_t sub_100007870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (*(_QWORD *)(v0 + 32) != *(_QWORD *)(v0 + 48))
  {
    if (qword_100011730 != -1)
      swift_once(&qword_100011730, sub_100005BB4);
    dispatch thunk of StickerStore.reindexAllStickers()();
    if (qword_100011728 != -1)
      swift_once(&qword_100011728, sub_100005B34);
    v1 = type metadata accessor for Logger(0);
    v2 = sub_10000498C(v1, (uint64_t)qword_100011990);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Finished reindexing all stickers", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for StickersOnDemandReindexer()
{
  return objc_opt_self(STKStickersOnDemandReindexer);
}

uint64_t sub_100007B3C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007B60()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc(dword_1000119E4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100007FB0;
  return ((uint64_t (*)(const void *))((char *)&dword_1000119E0 + dword_1000119E0))(v2);
}

uint64_t sub_100007BC8()
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
  v5 = (_QWORD *)swift_task_alloc(dword_1000119F4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100007FB0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000119F0 + dword_1000119F0))(v2, v3, v4);
}

uint64_t sub_100007C44()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007C70(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100011A04);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100007FB0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100011A00 + dword_100011A00))(a1, v4, v5, v6);
}

uint64_t sub_100007CF4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000048C4(&qword_100011B20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007D34()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100011A14);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100005CA0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100011A10 + dword_100011A10))(a1, v4);
}

id sub_100007DC8(uint64_t a1)
{
  uint64_t v1;

  return sub_100005EB8(a1, *(void **)(v1 + 16));
}

uint64_t sub_100007DD0(uint64_t *a1)
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

uint64_t sub_100007E14(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100007DD0(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007E54()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100007E78()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "cancel");
}

uint64_t sub_100007E8C(uint64_t a1)
{
  return sub_100007F24(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000060E0);
}

uint64_t sub_100007E98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007EA8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007EB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000048C4(&qword_100011A68);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100007F18(uint64_t a1)
{
  return sub_100007F24(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000062DC);
}

uint64_t sub_100007F24(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000048C4(&qword_100011A68) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_100007F74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100011A70;
  if (!qword_100011A70)
  {
    v1 = objc_opt_self(CSSearchableItem);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100011A70);
  }
  return result;
}

uint64_t sub_100007FBC()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005148(v0, qword_100011A80);
  sub_10000498C(v0, (uint64_t)qword_100011A80);
  return Logger.init(subsystem:category:)(0xD000000000000029, 0x80000001000095E0, 0xD00000000000001FLL, 0x8000000100009140);
}

uint64_t sub_10000803C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 16) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000080A4, v2, v3);
}

uint64_t sub_1000080A4()
{
  uint64_t v0;
  void *v1;

  swift_release(*(_QWORD *)(v0 + 16));
  type metadata accessor for ImageGlyphDataSource(0);
  v1 = (void *)static ImageGlyphDataSource.sharedInstance.getter();
  dispatch thunk of ImageGlyphAggregatingDataSource.numberOfSections()();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000080F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD v22[4];

  sub_1000048C4(&qword_100011B20);
  __chkstk_darwin();
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000876C(a1, (uint64_t)v7);
  v8 = type metadata accessor for TaskPriority(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100007CF4((uint64_t)v7);
    v10 = 4096;
    v11 = *(_QWORD *)(a3 + 16);
    if (v11)
    {
LABEL_3:
      v12 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v11);
      swift_unknownObjectRetain(v11, v14);
      v15 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
      v17 = v16;
      swift_unknownObjectRelease(v11);
      goto LABEL_6;
    }
  }
  else
  {
    v18 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    v10 = v18 | 0x1000;
    v11 = *(_QWORD *)(a3 + 16);
    if (v11)
      goto LABEL_3;
  }
  v15 = 0;
  v17 = 0;
LABEL_6:
  v19 = swift_allocObject(&unk_10000C8A0, 32, 7);
  *(_QWORD *)(v19 + 16) = a2;
  *(_QWORD *)(v19 + 24) = a3;
  if (v17 | v15)
  {
    v22[0] = 0;
    v22[1] = 0;
    v20 = v22;
    v22[2] = v15;
    v22[3] = v17;
  }
  else
  {
    v20 = 0;
  }
  return swift_task_create(v10, v20, (char *)&type metadata for () + 8, &unk_100011B50, v19);
}

uint64_t sub_100008278()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1000119B0 + dword_1000119B0);
  v1 = (_QWORD *)swift_task_alloc(unk_1000119B4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100007FB0;
  return v3();
}

id sub_1000083D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerPickerServiceAppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100008420();
  return 0;
}

void sub_100008420()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char **v16;
  uint64_t v17;
  objc_class *ObjCClassFromMetadata;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_1000048C4(&qword_100011B20);
  __chkstk_darwin();
  v1 = (char *)&v23 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100011738 != -1)
    swift_once(&qword_100011738, sub_100007FBC);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000498C(v2, (uint64_t)qword_100011A80);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "StickerPickerService launched", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = type metadata accessor for TaskPriority(0);
  v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v1, 1, 1, v7);
  type metadata accessor for MainActor(0);
  v9 = static MainActor.shared.getter();
  v10 = swift_allocObject(&unk_10000C850, 32, 7);
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = &protocol witness table for MainActor;
  v11 = sub_1000080F0((uint64_t)v1, (uint64_t)&unk_100011B30, v10);
  swift_release(v11);
  sub_100007CF4((uint64_t)v1);
  v8(v1, 1, 1, v7);
  v12 = swift_allocObject(&unk_10000C878, 32, 7);
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  v13 = sub_1000080F0((uint64_t)v1, (uint64_t)&unk_100011B40, v12);
  swift_release(v13);
  v14 = sub_100007CF4((uint64_t)v1);
  v15 = static CommandLine.argc.getter(v14);
  v16 = (char **)static CommandLine.unsafeArgv.getter();
  v17 = type metadata accessor for StickerPickerServiceAppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v17);
  v20 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v20)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0, v19);
    v22 = v21;
    v20 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
  }
  UIApplicationMain(v15, v16, 0, v20);

}

uint64_t type metadata accessor for StickerPickerServiceAppDelegate()
{
  return objc_opt_self(_TtC20StickerPickerService31StickerPickerServiceAppDelegate);
}

uint64_t sub_10000866C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008690()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100011B2C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100005CA0;
  return sub_10000803C();
}

uint64_t sub_1000086F4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  v1 = (_QWORD *)swift_task_alloc(dword_100011B3C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100007FB0;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_1000119B0 + dword_1000119B0);
  v2 = (_QWORD *)swift_task_alloc(unk_1000119B4);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_100007FB0;
  return v4();
}

uint64_t sub_10000876C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000048C4(&qword_100011B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000087B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000087D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100011B4C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100005CA0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100011B48 + dword_100011B48))(a1, v4);
}

uint64_t sub_10000884C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC20StickerPickerServiceP33_E17290D59BD4E6589FD6863A7C12976119ResourceBundleClass);
}
