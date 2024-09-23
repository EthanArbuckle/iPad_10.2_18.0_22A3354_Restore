id sub_100004EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;
  NSString v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v6 = objc_msgSend(v4, "initWithTitle:", v5);

  return v6;
}

void sub_100004F64()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  const char **v8;
  id v9;
  uint64_t v10;
  id v11;
  const char **v12;
  id v13;
  uint64_t v14;
  id v15;
  const char **v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  Swift::String v45;
  Swift::String_optional v46;
  NSBundle v47;
  Swift::String v48;
  Swift::String v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  id v84;
  Swift::String v85;
  Swift::String_optional v86;
  NSBundle v87;
  Swift::String v88;
  Swift::String v89;
  char *v90;
  id v91;
  char *v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  id v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  id v164;
  id v165;
  char *v166;
  id v167;
  Class super_class;
  __int128 v169;
  __int128 v170;
  objc_super v171;
  Swift::String v172;
  Swift::String v173;

  v171.receiver = v0;
  v171.super_class = (Class)type metadata accessor for SignatureViewController();
  super_class = v171.super_class;
  objc_msgSendSuper2(&v171, "viewDidLoad");
  v2 = objc_msgSend(v0, "view");
  if (v2)
  {
    v3 = v2;
    v4 = *(void **)&v0[OBJC_IVAR___SignatureViewController_signatureView];
    sub_100007068(v4, "setTranslatesAutoresizingMaskIntoConstraints:");
    v166 = v0;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    sub_1000070B4(v4, "setBackgroundColor:");

    v7 = sub_100006F88(v6, "labelColor");
    sub_1000070B4(v4, "setStrokeColor:");

    objc_msgSend(v3, "insertSubview:atIndex:", v4, 0);
    v8 = (const char **)sub_100006F20((uint64_t)objc_msgSend(v4, "leftAnchor"), "leftAnchor");
    v9 = sub_100006F08();
    sub_100007088();

    sub_100006EF8();
    v11 = sub_100007014(v10, "rightAnchor");
    v12 = (const char **)sub_100006F20((uint64_t)v11, v8[162]);
    v13 = sub_100006F08();
    sub_100007088();

    sub_100006EF8();
    v15 = sub_100007014(v14, "topAnchor");
    v16 = (const char **)sub_100006F20((uint64_t)v15, v12[163]);
    v17 = sub_100006F08();
    sub_100007088();

    sub_100006EF8();
    v19 = sub_100007014(v18, "bottomAnchor");
    v20 = sub_100006F20((uint64_t)v19, v16[164]);
    v21 = sub_100006F08();
    sub_100007088();

    sub_100006EF8();
    v22 = *(void **)&v0[OBJC_IVAR___SignatureViewController_lineView];
    v23 = sub_100007068(v22, "setTranslatesAutoresizingMaskIntoConstraints:");
    v24 = sub_100006F88((uint64_t)v23, "clearColor");
    sub_1000070B4(v22, "setBackgroundColor:");

    v25 = sub_100007020((uint64_t)objc_msgSend(v3, "insertSubview:aboveSubview:", v22, v4), "leftAnchor");
    v26 = sub_100006F20((uint64_t)v25, "leftAnchor");
    v27 = sub_100006F08();
    sub_1000070F0();

    sub_100006F18(&SignatureViewController__prots, "setActive:");
    v29 = sub_100007020(v28, "rightAnchor");
    v30 = sub_100006F20((uint64_t)v29, "rightAnchor");
    v31 = sub_100006F08();
    sub_1000070F0();

    sub_100006F18(&SignatureViewController__prots, "setActive:");
    v33 = sub_100007020(v32, "bottomAnchor");
    v34 = sub_100006F20((uint64_t)v33, "bottomAnchor");
    v35 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -60.0);
    sub_1000070F0();

    sub_100006F18(&SignatureViewController__prots, "setActive:");
    v37 = sub_100007020(v36, "heightAnchor");
    v38 = objc_msgSend(v37, "constraintEqualToConstant:", 30.0);

    sub_100006F18(v38, "setActive:");
    v39 = sub_100006F5C(objc_allocWithZone((Class)UILabel), "initWithFrame:");
    sub_100007068(v39, "setTranslatesAutoresizingMaskIntoConstraints:");
    v40 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 12.0);
    sub_100007090((uint64_t)v40, "setFont:");

    v41 = sub_100006F88((uint64_t)objc_msgSend(v39, "setTextAlignment:", 1), "secondaryLabelColor");
    sub_100007090((uint64_t)v41, "setTextColor:");

    v42 = v39;
    v43 = sub_100006F88((uint64_t)v42, "clearColor");
    objc_msgSend(v42, "setBackgroundColor:", v43);

    v165 = (id)objc_opt_self(NSBundle);
    v44 = objc_msgSend(v165, "mainBundle");
    v172._object = (void *)0xE000000000000000;
    sub_100007038();
    v172._countAndFlagsBits = 0;
    v49 = NSLocalizedString(_:tableName:bundle:value:comment:)(v45, v46, v47, v48, v172);

    sub_100006E0C(v49._countAndFlagsBits, (uint64_t)v49._object, v42);
    v50 = sub_1000070D0((uint64_t)objc_msgSend(v3, "addSubview:", v42), "leftAnchor");
    v51 = sub_100006F20((uint64_t)v50, "leftAnchor");
    v52 = sub_100006F98((uint64_t)v51, "constraintEqualToAnchor:");

    sub_100006F18(v52, "setActive:");
    v54 = sub_1000070D0(v53, "rightAnchor");
    v55 = sub_100006F20((uint64_t)v54, "rightAnchor");
    v56 = sub_100006F98((uint64_t)v55, "constraintEqualToAnchor:");

    sub_100006F18(v56, "setActive:");
    v162 = (uint64_t)v42;
    v58 = sub_1000070D0(v57, "topAnchor");
    v59 = sub_100007020((uint64_t)v58, "bottomAnchor");
    v60 = sub_100006F98((uint64_t)v59, "constraintEqualToAnchor:constant:");
    sub_100007080();

    sub_100006EF8();
    v61 = *(void **)&v166[OBJC_IVAR___SignatureViewController_navBar];
    sub_100007068(v61, "setTranslatesAutoresizingMaskIntoConstraints:");
    v62 = sub_100006F88((uint64_t)objc_msgSend(v3, "addSubview:", v61), "leftAnchor");
    v63 = sub_100006F20((uint64_t)v62, "leftAnchor");
    v64 = sub_100006F98((uint64_t)v63, "constraintEqualToAnchor:");
    sub_100007080();

    sub_100006EF8();
    v66 = sub_100006F88(v65, "rightAnchor");
    v67 = sub_100006F20((uint64_t)v66, "rightAnchor");
    v68 = sub_100006F98((uint64_t)v67, "constraintEqualToAnchor:");
    sub_100007080();

    sub_100006EF8();
    v70 = sub_100006F88(v69, "topAnchor");
    v71 = sub_100006F20((uint64_t)v70, "topAnchor");
    v72 = sub_100006F98((uint64_t)v71, "constraintEqualToAnchor:constant:");
    sub_100007080();

    sub_100006EF8();
    v73 = sub_100006724(&qword_10000C7A8);
    v74 = sub_100006F7C(v73);
    *((_QWORD *)&v158 + 1) = 3;
    *(_OWORD *)(v74 + 16) = xmmword_100007520;
    v75 = *(void **)&v166[OBJC_IVAR___SignatureViewController_titleItem];
    *(_QWORD *)(v74 + 32) = v75;
    sub_100006F70(v74, v76, v77, v78, v79, v80, v81, v82, v146, v152, 1);
    v164 = v75;
    sub_100006E5C(v169, v61, &qword_10000C7E0, UINavigationItem_ptr, (SEL *)&selRef_setItems_);
    *((_QWORD *)&v170 + 1) = super_class;
    *(_QWORD *)&v169 = v166;
    sub_100007050();
    v83 = v166;
    v167 = sub_100006788(1, &v169, (uint64_t)"_cancelWithSender:");
    v84 = objc_msgSend(v165, "mainBundle");
    v173._object = (void *)0xEC000000656C7469;
    sub_100007038();
    v173._countAndFlagsBits = 0x74206E6F74747542;
    v89 = NSLocalizedString(_:tableName:bundle:value:comment:)(v85, v86, v87, v88, v173);

    *((_QWORD *)&v170 + 1) = super_class;
    *(_QWORD *)&v169 = v83;
    sub_100007050();
    v90 = v83;
    v91 = sub_100006888(v89._countAndFlagsBits, (uint64_t)v89._object, 0, &v169, (uint64_t)"_clearWithSender:");
    *((_QWORD *)&v170 + 1) = super_class;
    *(_QWORD *)&v169 = v90;
    sub_100007050();
    v92 = v90;
    v93 = sub_100006788(0, &v169, (uint64_t)"_doneWithSender:");
    v169 = 0u;
    v170 = 0u;
    sub_100007050();
    v94 = sub_100006788(6, &v169, 0);
    v95 = sub_100006F88((uint64_t)objc_msgSend(v94, "setWidth:", 27.0), "presentationController");
    if (v95 && (v96 = v95, v97 = objc_msgSend(v95, "presentationStyle"), v96, v97 == (id)7))
    {
      v98 = sub_100006F7C(v73);
      *(_OWORD *)(v98 + 16) = v158;
      *(_QWORD *)(v98 + 32) = v91;
      sub_100006F70(v98, v99, v100, v101, v102, v103, v104, v105, v147, v153, v158);
      v106 = v91;
      sub_100007070((uint64_t)v106, v107, (unint64_t *)&unk_10000C7F0, UIBarButtonItem_ptr, (SEL *)&selRef_setLeftBarButtonItems_, v108, v109, v110, v148, v154, v158, *((uint64_t *)&v158 + 1), (uint64_t)v42, v164);
      v111 = sub_100006F7C(v73);
      *(_OWORD *)(v111 + 16) = v159;
      *(_QWORD *)(v111 + 32) = v93;
      sub_100006F70(v111, v112, v113, v114, v115, v116, v117, v118, v149, v155, v159);
      v119 = v169;
      v120 = v93;
      v121 = v167;
    }
    else
    {
      v122 = sub_100006F90(v73, 48);
      *(_OWORD *)(v122 + 16) = xmmword_100007530;
      v121 = v167;
      *(_QWORD *)(v122 + 32) = v167;
      *(_QWORD *)(v122 + 40) = v94;
      sub_100006F70(v122, v123, v124, v125, v126, v127, v128, v129, v147, v153, v158);
      v130 = v167;
      v120 = v94;
      sub_100007070((uint64_t)v120, v131, (unint64_t *)&unk_10000C7F0, UIBarButtonItem_ptr, (SEL *)&selRef_setLeftBarButtonItems_, v132, v133, v134, v150, v156, v160, 3, v162, v164);
      v135 = sub_100006F90(v73, 56);
      *(_OWORD *)(v135 + 16) = xmmword_100007540;
      *(_QWORD *)(v135 + 32) = v91;
      *(_QWORD *)(v135 + 40) = v120;
      *(_QWORD *)(v135 + 48) = v93;
      sub_100006F70(v135, v136, v137, v138, v139, v140, v141, v142, v151, v157, v161);
      v119 = v169;
      v143 = v91;
      v144 = v93;
    }
    v145 = v120;
    sub_100006E5C(v119, &_s10Foundation17NSLocalizedString_9tableName6bundle5value7commentS2S_SSSgSo8NSBundleCS2StF_ptr, (unint64_t *)&unk_10000C7F0, UIBarButtonItem_ptr, (SEL *)&selRef_setRightBarButtonItems_);
    objc_msgSend(v4, "setLiveDelegate:", v92);
    objc_msgSend(v92, "sidecarServiceUpdateSupportedOrientations");

  }
  else
  {
    __break(1u);
  }
}

id sub_100005A5C()
{
  void *v0;

  return objc_msgSend(v0, "completeRequest:", 1);
}

id sub_100005A7C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___SignatureViewController_signatureView), "clear");
}

uint64_t sub_100005AA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _BYTE v14[24];
  uint64_t v15;

  if (!((unint64_t)a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a1);
    if (v2)
      goto LABEL_3;
    return swift_bridgeObjectRelease(a1);
  }
  if (a1 < 0)
    v11 = a1;
  else
    v11 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  result = _CocoaArrayWrapper.endIndex.getter(v11);
  v2 = result;
  if (!result)
    return swift_bridgeObjectRelease(a1);
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      else
        v5 = *(id *)(a1 + 8 * i + 32);
      v6 = v5;
      v7 = objc_msgSend(v5, "objectValue");
      if (v7)
      {
        v8 = v7;
        _bridgeAnyObjectToAny(_:)(v13, v7);
        swift_unknownObjectRelease(v8);
      }
      else
      {
        memset(v13, 0, sizeof(v13));
      }
      sub_100006DC4((uint64_t)v13, (uint64_t)v14);
      if (v15)
      {
        v9 = sub_100006724(&qword_10000C7E8);
        if ((swift_dynamicCast(&v12, v14, (char *)&type metadata for Any + 8, v9, 6) & 1) != 0)
        {
          v10 = v12;
          sub_100005CA4(v12);

          swift_bridgeObjectRelease(v10);
        }
        else
        {

        }
      }
      else
      {

        sub_100006AC4((uint64_t)v14);
      }
    }
    return swift_bridgeObjectRelease(a1);
  }
  return result;
}

uint64_t sub_100005CA4(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD aBlock[5];
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = 1;
  AnyHashable.init<A>(_:)(aBlock, &v27, &type metadata for Int, &protocol witness table for Int);
  sub_100005EFC((uint64_t)aBlock, a1, &v28);
  sub_100006A90((uint64_t)aBlock);
  if (!v29)
    return sub_100006AC4((uint64_t)&v28);
  result = swift_dynamicCast(&v27, &v28, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
  if ((result & 1) != 0 && v27 == 3)
  {
    sub_100006FCC(result, &qword_10000C7C0, OS_dispatch_queue_ptr);
    v15 = (void *)static OS_dispatch_queue.main.getter();
    v16 = sub_100006F90((uint64_t)&unk_100008400, 24);
    *(_QWORD *)(v16 + 16) = v2;
    aBlock[4] = sub_100006B28;
    v26 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100005F4C;
    aBlock[3] = &unk_100008418;
    v17 = _Block_copy(aBlock);
    v18 = v26;
    v19 = v2;
    v20 = swift_release(v18);
    static DispatchQoS.unspecified.getter(v20);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v21 = sub_100006B5C();
    v22 = sub_100006724(&qword_10000C7D0);
    v23 = sub_100006B9C();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v22, v23, v4, v21);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v8, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  return result;
}

double sub_100005EFC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_100006C24(a1), (v6 & 1) != 0))
  {
    sub_100006C54(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_100005F4C(uint64_t a1)
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

void sub_100005F78()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t inited;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  __n128 *v15;
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
  uint64_t v26[18];

  v3 = v0;
  v4 = objc_msgSend(objc_retainAutorelease(*(id *)&v0[OBJC_IVAR___SignatureViewController_signatureView]), "copyStrokedInterpolatedPath");
  if (v4)
  {
    v5 = v4;
    v6 = sub_100006724(&qword_10000C798);
    inited = swift_initStackObject(v6, v26);
    *(_OWORD *)(inited + 16) = xmmword_100007550;
    *(_OWORD *)(inited + 32) = xmmword_100007560;
    v8 = sub_100007058(inited);
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    sub_10000709C();
    *(_QWORD *)(inited + 104) = &type metadata for Data;
    *(_QWORD *)(inited + 80) = v1;
    *(_QWORD *)(inited + 88) = v2;
    v9 = sub_1000070D8();
    v26[17] = sub_100006724(&qword_10000C7A0);
    v26[14] = v9;
    v10 = objc_allocWithZone((Class)SidecarItem);
    v11 = sub_100006FEC();
    v12 = objc_msgSend(v3, "request");
    if (v12)
    {
      v13 = v12;
      v14 = sub_100006724(&qword_10000C7A8);
      v15 = (__n128 *)sub_100006F7C(v14);
      v23 = sub_100007000(v15, v16, v17, v18, v19, v20, v21, v22, (__n128)xmmword_100007520, v26[0], v26[1], v26[2]);
      v24 = (void *)sub_100006FCC(v23, &qword_10000C7B0, SidecarItem_ptr);
      v11 = v11;
      sub_1000070E4();
      v25 = sub_1000070A8();
      sub_100007028(v25, "sendItems:complete:");

    }
    sub_100006FB4();
  }
  else
  {
    objc_msgSend(v0, "completeRequest:", 1);
  }
}

uint64_t sub_100006120(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;
  uint64_t v8;
  _QWORD v10[4];

  swift_unknownObjectRetain(a3);
  v7 = a1;
  _bridgeAnyObjectToAny(_:)(v10, a3);
  v8 = swift_unknownObjectRelease(a3);
  a4(v8);

  return sub_100006A70(v10);
}

id sub_10000618C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  double v9;
  SEL v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  NSBundle v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  id v25;
  objc_super v27;

  v6 = OBJC_IVAR___SignatureViewController_navBar;
  v7 = objc_allocWithZone((Class)UINavigationBar);
  v8 = v3;
  v9 = sub_1000070BC();
  v11 = objc_msgSend(v7, v10, v9);
  *(_QWORD *)&v3[v6] = v11;
  v12 = OBJC_IVAR___SignatureViewController_titleItem;
  sub_100006FCC((uint64_t)v11, &qword_10000C7E0, UINavigationItem_ptr);
  v13 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v14 = sub_100006F28();
  v15.super.isa = v13;
  v19 = sub_100006FD4(v14, v16, v17, v18, v15);
  v21 = v20;

  *(_QWORD *)&v8[v12] = sub_100004EDC(v19, v21);
  v22 = OBJC_IVAR___SignatureViewController_signatureView;
  *(_QWORD *)&v8[v22] = sub_100006F5C(objc_allocWithZone((Class)AKSignatureView), "initWithFrame:");
  v23 = OBJC_IVAR___SignatureViewController_lineView;
  *(_QWORD *)&v8[v23] = sub_100006D90();

  if (a2)
  {
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v24 = 0;
  }
  v27.receiver = v8;
  v27.super_class = (Class)type metadata accessor for SignatureViewController();
  v25 = objc_msgSendSuper2(&v27, "initWithNibName:bundle:", v24, a3);

  return v25;
}

id sub_100006368(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  double v6;
  SEL v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  NSBundle v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  objc_super v23;

  v3 = OBJC_IVAR___SignatureViewController_navBar;
  v4 = objc_allocWithZone((Class)UINavigationBar);
  v5 = v1;
  v6 = sub_1000070BC();
  v8 = objc_msgSend(v4, v7, v6);
  *(_QWORD *)&v1[v3] = v8;
  v9 = OBJC_IVAR___SignatureViewController_titleItem;
  sub_100006FCC((uint64_t)v8, &qword_10000C7E0, UINavigationItem_ptr);
  v10 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v11 = sub_100006F28();
  v12.super.isa = v10;
  v16 = sub_100006FD4(v11, v13, v14, v15, v12);
  v18 = v17;

  *(_QWORD *)&v5[v9] = sub_100004EDC(v16, v18);
  v19 = OBJC_IVAR___SignatureViewController_signatureView;
  *(_QWORD *)&v5[v19] = sub_100006F5C(objc_allocWithZone((Class)AKSignatureView), "initWithFrame:");
  v20 = OBJC_IVAR___SignatureViewController_lineView;
  *(_QWORD *)&v5[v20] = sub_100006D90();

  v23.receiver = v5;
  v23.super_class = (Class)type metadata accessor for SignatureViewController();
  v21 = objc_msgSendSuper2(&v23, "initWithCoder:", a1);

  return v21;
}

id sub_1000064D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SignatureViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SignatureViewController()
{
  return objc_opt_self(SignatureViewController);
}

void sub_100006578()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t inited;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  __n128 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27[18];

  v3 = v0;
  v4 = objc_msgSend(objc_retainAutorelease(*(id *)&v0[OBJC_IVAR___SignatureViewController_signatureView]), "copyStrokedInterpolatedPath");
  if (v4)
  {
    v5 = v4;
    v6 = sub_100006724(&qword_10000C798);
    inited = swift_initStackObject(v6, v27);
    *(_OWORD *)(inited + 16) = xmmword_100007550;
    *(int64x2_t *)(inited + 32) = vdupq_n_s64(1uLL);
    v8 = sub_100007058(inited);
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    sub_10000709C();
    *(_QWORD *)(inited + 104) = &type metadata for Data;
    *(_QWORD *)(inited + 80) = v1;
    *(_QWORD *)(inited + 88) = v2;
    v9 = sub_1000070D8();
    v27[17] = sub_100006724(&qword_10000C7A0);
    v27[14] = v9;
    v10 = objc_allocWithZone((Class)SidecarItem);
    v11 = sub_100006FEC();
    v12 = objc_msgSend(v3, "request");
    if (v12)
    {
      v13 = v12;
      v14 = sub_100006724(&qword_10000C7A8);
      v15 = (__n128 *)sub_100006F7C(v14);
      v23 = sub_100007000(v15, v16, v17, v18, v19, v20, v21, v22, (__n128)xmmword_100007520, v27[0], v27[1], v27[2]);
      v24 = (void *)sub_100006FCC(v23, &qword_10000C7B0, SidecarItem_ptr);
      v25 = v11;
      sub_1000070E4();
      v26 = sub_1000070A8();
      sub_100007028(v26, "sendItems:complete:");

    }
  }
  sub_100006FB4();
}

uint64_t sub_100006724(uint64_t *a1)
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

id sub_100006764(uint64_t a1)
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSData encodeCGPath:](NSData, "encodeCGPath:", a1));
}

id sub_100006788(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v6 = a2[3];
  if (v6)
  {
    v8 = sub_100006A4C(a2, a2[3]);
    v9 = *(_QWORD *)(v6 - 8);
    __chkstk_darwin(v8, v8);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = _bridgeAnythingToObjectiveC<A>(_:)(v11, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    sub_100006A70(a2);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", a1, v12, a3);
  swift_unknownObjectRelease(v12);
  return v13;
}

id sub_100006888(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  void *v5;
  void *v6;
  NSString v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v6 = v5;
  if (a2)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v11 = 0;
  }
  v12 = a4[3];
  if (v12)
  {
    v13 = sub_100006A4C(a4, a4[3]);
    v14 = *(_QWORD *)(v12 - 8);
    __chkstk_darwin(v13, v13);
    v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v14 + 16))(v16);
    v17 = _bridgeAnythingToObjectiveC<A>(_:)(v16, v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
    sub_100006A70(a4);
  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(v6, "initWithTitle:style:target:action:", v11, a3, v17, a5);

  swift_unknownObjectRelease(v17);
  return v18;
}

id sub_1000069B4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSString v9;
  id v10;

  v6 = a1[3];
  v7 = sub_100006A4C(a1, v6);
  v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  v10 = objc_msgSend(v3, "initWithObject:type:", v8, v9);
  swift_unknownObjectRelease(v8);

  sub_100006A70(a1);
  return v10;
}

_QWORD *sub_100006A4C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006A70(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006A90(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100006AC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006724(&qword_10000C7B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006B04()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100006B28()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___SignatureViewController_signatureView), "clear");
}

uint64_t sub_100006B44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006B54(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100006B5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C7C8;
  if (!qword_10000C7C8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10000C7C8);
  }
  return result;
}

unint64_t sub_100006B9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C7D8;
  if (!qword_10000C7D8)
  {
    v1 = sub_100006BE0(&qword_10000C7D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C7D8);
  }
  return result;
}

uint64_t sub_100006BE0(uint64_t *a1)
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

unint64_t sub_100006C24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100006C90(a1, v4);
}

uint64_t sub_100006C54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006C90(uint64_t a1, uint64_t a2)
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
      sub_100006D54(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100006A90((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100006D54(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

id sub_100006D90()
{
  return objc_msgSend(objc_alloc(NSClassFromString(CFSTR("AKSignatureBaselineView"))), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

uint64_t sub_100006DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006724(&qword_10000C7B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100006E0C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, "setText:", v5);

}

void sub_100006E5C(uint64_t a1, void *a2, unint64_t *a3, _QWORD *a4, SEL *a5)
{
  Class isa;

  sub_100006EC0(0, a3, a4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  objc_msgSend(a2, *a5, isa);
  sub_100006FA4(isa);
}

uint64_t sub_100006EC0(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

id sub_100006EF8()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, *(SEL *)(v0 + 1288), 1);
}

id sub_100006F08()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, *(SEL *)(v2 + 1280), v1);
}

id sub_100006F18(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 1);
}

id sub_100006F20(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_100006F28()
{
  return 0x6E6769532077654ELL;
}

id sub_100006F5C(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_100006F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return specialized Array._endMutation()(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_100006F7C(uint64_t a1)
{
  return swift_allocObject(a1, 40, 7);
}

id sub_100006F88(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_100006F90(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

id sub_100006F98(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void sub_100006FA4(id a1)
{

}

uint64_t sub_100006FCC(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_100006EC0(0, a2, a3);
}

uint64_t sub_100006FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSBundle a5)
{
  Swift::String v5;
  Swift::String v7;

  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v7._countAndFlagsBits = 0x656C746954;
  return NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&a1, *(Swift::String_optional *)&a3, a5, v5, v7)._countAndFlagsBits;
}

id sub_100006FEC()
{
  uint64_t v0;

  return sub_1000069B4((_QWORD *)(v0 - 96), 0, 0xE000000000000000);
}

uint64_t sub_100007000(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v12;
  uint64_t v13;

  a1[1] = a9;
  a1[2].n128_u64[0] = v12;
  *(_QWORD *)(v13 - 96) = a1;
  return specialized Array._endMutation()(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12);
}

id sub_100007014(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100007020(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100007028(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3, 0);
}

id sub_100007050()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 312));
}

id sub_100007058(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 + 64) = v2;
  *(_QWORD *)(a1 + 72) = 2;
  return sub_100006764(v1);
}

id sub_100007068(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

void sub_100007070(uint64_t a1, uint64_t a2, unint64_t *a3, _QWORD *a4, SEL *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  uint64_t v14;

  sub_100006E5C(v14, a14, a3, a4, a5);
}

void sub_100007080()
{
  void *v0;

}

void sub_100007088()
{
  void *v0;

}

id sub_100007090(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void sub_10000709C()
{
  void *v0;

}

uint64_t sub_1000070A8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_1000070B4(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

double sub_1000070BC()
{
  return 0.0;
}

id sub_1000070D0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_1000070D8()
{
  uint64_t v0;
  uint64_t v1;

  return Dictionary.init(dictionaryLiteral:)(v0, v1);
}

NSArray sub_1000070E4()
{
  return Array._bridgeToObjectiveC()();
}

void sub_1000070F0()
{
  void *v0;

}

id objc_msgSend_encodeCGPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeCGPath:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}
