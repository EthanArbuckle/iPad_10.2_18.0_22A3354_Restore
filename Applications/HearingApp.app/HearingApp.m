uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100001F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001F38(uint64_t a1, double a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100001FCC;
  v3[3] = &unk_10000C590;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  AXPerformBlockOnMainThread(v3);
  objc_destroyWeak(v4);
}

void sub_100001FB8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100001FCC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateLevel:", *(double *)(a1 + 40));

}

void sub_1000020C4(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  UIUserInterfaceLayoutDirection v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  UIBezierPath *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v5, "semanticContentAttribute"));
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = (double)a3;
  if (v7 == UIUserInterfaceLayoutDirectionRightToLeft)
    v13 = CGRectGetMinX(*(CGRect *)&v8)
        + 20.0
        + v12 * *(double *)(*(_QWORD *)(a1 + 32) + 24)
        + v12 * *(double *)(*(_QWORD *)(a1 + 32) + 32);
  else
    v13 = CGRectGetMaxX(*(CGRect *)&v8)
        + -20.0
        - v12 * *(double *)(*(_QWORD *)(a1 + 32) + 24)
        - v12 * *(double *)(*(_QWORD *)(a1 + 32) + 32);
  v14 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v13, CGRectGetMidY(*(CGRect *)(a1 + 40)) + *(double *)(*(_QWORD *)(a1 + 32) + 24) * -0.5, *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 24), 20.0);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v14));
  objc_msgSend(v6, "setPath:", objc_msgSend(v15, "CGPath"));

}

void sub_100002280(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  id v10;

  v3 = *(int *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (int)(*(double *)(a1 + 40) * (double)(int)v3);
  v5 = v3 - a3 + 1;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  v10 = v7;
  v8 = 0.25;
  if (v5 < v4)
    v8 = 1.0;
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "colorWithAlphaComponent:", v8)));
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v9, "CGColor"));

}

void sub_1000025B4()
{
  char *v0;
  objc_class *v1;
  void *v2;
  uint64_t ObjCClassFromMetadata;
  id v4;
  NSString v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSString v31;
  NSString v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  uint64_t v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  objc_super v48;

  v1 = (objc_class *)type metadata accessor for LiveListenSystemApertureViewController();
  v48.receiver = v0;
  v48.super_class = v1;
  objc_msgSendSuper2(&v48, "viewDidLoad");
  v2 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView];
  if (v2)
  {
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
    v4 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
    v5 = String._bridgeToObjectiveC()();
    v6 = String._bridgeToObjectiveC()();
    v7 = objc_msgSend(v4, "localizedStringForKey:value:table:", v5, 0, v6);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);
    v10 = v9;

    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
    objc_msgSend(v2, "setAccessibilityLabel:", v11);

    objc_msgSend(v2, "setTintColor:", *(_QWORD *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor]);
    v12 = v2;
    v13 = objc_msgSend(v0, "view");
    if (!v13)
    {
      __break(1u);
      goto LABEL_14;
    }
    v14 = v13;
    objc_msgSend(v13, "addSubview:", v12);

  }
  v15 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView];
  if (v15)
  {
    v16 = swift_getObjCClassFromMetadata(v1);
    v17 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v16);
    v18 = String._bridgeToObjectiveC()();
    v19 = String._bridgeToObjectiveC()();
    v20 = objc_msgSend(v17, "localizedStringForKey:value:table:", v18, 0, v19);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);
    v23 = v22;

    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v23);
    objc_msgSend(v15, "setAccessibilityLabel:", v24);

    objc_msgSend(v15, "setTintColor:", *(_QWORD *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor]);
    v25 = v15;
    v26 = objc_msgSend(v0, "view");
    if (v26)
    {
      v27 = v26;
      objc_msgSend(v26, "addSubview:", v25);

      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_7:
  v28 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView];
  if (!v28)
  {
LABEL_12:
    sub_100002AEC();
    return;
  }
  v29 = swift_getObjCClassFromMetadata(v1);
  v30 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v29);
  v31 = String._bridgeToObjectiveC()();
  v32 = String._bridgeToObjectiveC()();
  v33 = objc_msgSend(v30, "localizedStringForKey:value:table:", v31, 0, v32);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v33, v34);
  v36 = v35;

  v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v36);
  objc_msgSend(v28, "setAccessibilityLabel:", v37);

  v38 = *(_QWORD *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor];
  objc_msgSend(v28, "setTintColor:", v38);
  v39 = v28;
  objc_msgSend(v39, "frame");
  v44 = objc_msgSend(objc_allocWithZone((Class)LiveListenLevels), "initWithFrame:inCompact:", 1, v40, v41, v42, v43);
  if (!v44)
  {
LABEL_11:

    goto LABEL_12;
  }
  v45 = v44;
  objc_msgSend(v39, "addSubview:", v44);
  objc_msgSend(v39, "setTintColor:", v38);
  v46 = objc_msgSend(v0, "view");
  if (v46)
  {
    v47 = v46;
    objc_msgSend(v46, "addSubview:", v39);

    v39 = v47;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_100002AEC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t ObjCClassFromMetadata;
  void *v22;
  id v23;
  id v24;
  NSString v25;
  NSString v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  Class isa;
  uint64_t v50;
  id v51;
  id v52;
  NSString v53;
  NSString v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSString v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  double v65;
  double v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  Class v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  char *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  id v103;
  id v104;
  NSString v105;
  NSString v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSString v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  void *v124;
  id v125;
  id v126;
  uint64_t v127;
  Class v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  NSString v133;
  NSString v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSString v139;
  char *v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  void *v161;
  id v162;
  id v163;
  NSString v164;
  NSString v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSString v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  uint64_t v175;
  id v176;
  id v177;
  void *v178;
  id v179;
  id v180;
  id v181;
  id v182;
  void *v183;
  id v184;
  id v185;
  id v186;
  id v187;
  void *v188;
  id v189;
  id v190;
  uint64_t v191;
  Class v192;
  uint64_t v193;
  char *v194;
  __int128 v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  _QWORD aBlock[5];
  uint64_t v202;

  v1 = v0;
  type metadata accessor for UIButton.Configuration(0);
  __chkstk_darwin();
  v3 = (char *)&v193 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_allocWithZone((Class)type metadata accessor for LiveListenLeadingView());
  sub_10000504C(0);
  v5 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView;
  v6 = *(void **)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView] = v7;

  objc_msgSend(*(id *)&v0[v5], "setHidden:", 1);
  objc_msgSend(*(id *)&v0[v5], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = *(id *)&v0[v5];
  v9 = objc_msgSend(v0, "view");
  if (!v9)
  {
    __break(1u);
    goto LABEL_31;
  }
  v10 = v9;
  objc_msgSend(v9, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v8, "setFrame:", v12, v14, v16, v18);
  v19 = *(void **)&v1[v5];
  v20 = type metadata accessor for LiveListenSystemApertureViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v20);
  v22 = (void *)objc_opt_self(NSBundle);
  v23 = v19;
  v199 = v22;
  v200 = ObjCClassFromMetadata;
  v24 = objc_msgSend(v22, "bundleForClass:", ObjCClassFromMetadata);
  v25 = String._bridgeToObjectiveC()();
  v26 = String._bridgeToObjectiveC()();
  v27 = objc_msgSend(v24, "localizedStringForKey:value:table:", v25, 0, v26);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v27, v28);
  v30 = v29;

  v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  objc_msgSend(v23, "setAccessibilityLabel:", v31);

  v32 = *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor];
  objc_msgSend(*(id *)&v1[v5], "setTintColor:", v32);
  v33 = objc_msgSend(v1, "view");
  if (!v33)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v34 = v33;
  v194 = v3;
  objc_msgSend(v33, "addSubview:", *(_QWORD *)&v1[v5]);

  v198 = sub_100005B30(&qword_1000129B0);
  v35 = swift_allocObject(v198, 48, 7);
  v195 = xmmword_100007BD0;
  *(_OWORD *)(v35 + 16) = xmmword_100007BD0;
  v36 = objc_msgSend(*(id *)&v1[v5], "leadingAnchor");
  v37 = objc_msgSend(v1, "view");
  if (!v37)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, "leadingAnchor");

  v40 = objc_msgSend(v36, "constraintEqualToAnchor:constant:", v39, 30.0);
  *(_QWORD *)(v35 + 32) = v40;
  v41 = objc_msgSend(*(id *)&v1[v5], "topAnchor");
  v42 = objc_msgSend(v1, "view");
  if (!v42)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v43 = v42;
  v44 = (void *)objc_opt_self(NSLayoutConstraint);
  v45 = objc_msgSend(v43, "SBUISA_systemApertureObstructedAreaLayoutGuide");

  v46 = objc_msgSend(v45, "bottomAnchor");
  v47 = objc_msgSend(v41, "constraintEqualToAnchor:", v46);

  *(_QWORD *)(v35 + 40) = v47;
  aBlock[0] = v35;
  specialized Array._endMutation()();
  v48 = aBlock[0];
  v196 = sub_100005D40(0, &qword_1000129B8, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v48);
  v197 = v44;
  objc_msgSend(v44, "activateConstraints:", isa);

  v50 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = *(id *)&v1[v50];
  v52 = objc_msgSend(v199, "bundleForClass:", v200);
  v53 = String._bridgeToObjectiveC()();
  v54 = String._bridgeToObjectiveC()();
  v55 = objc_msgSend(v52, "localizedStringForKey:value:table:", v53, 0, v54);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v55, v56);
  v58 = v57;

  v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v58);
  objc_msgSend(v51, "setText:", v59);

  objc_msgSend(*(id *)&v1[v50], "setTextColor:", v32);
  objc_msgSend(*(id *)&v1[v50], "setHidden:", 1);
  objc_msgSend(*(id *)&v1[v50], "sizeToFit");
  v60 = *(void **)&v1[v50];
  v61 = objc_allocWithZone((Class)UIFontMetrics);
  v62 = v60;
  v63 = objc_msgSend(v61, "initForTextStyle:", UIFontTextStyleBody);
  v64 = objc_msgSend((id)objc_opt_self(UIFontDescriptor), "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v64, "pointSize");
  if (v65 <= 20.0)
    v66 = v65;
  else
    v66 = 20.0;
  v67 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", v66, UIFontWeightMedium);
  v68 = objc_msgSend(v63, "scaledFontForFont:", v67);

  objc_msgSend(v62, "setFont:", v68);
  objc_msgSend(*(id *)&v1[v50], "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(*(id *)&v1[v50], "setUserInteractionEnabled:", 0);
  v69 = objc_msgSend(v1, "view");
  if (!v69)
    goto LABEL_34;
  v70 = v69;
  objc_msgSend(v69, "addSubview:", *(_QWORD *)&v1[v50]);

  v71 = swift_allocObject(v198, 48, 7);
  *(_OWORD *)(v71 + 16) = v195;
  v72 = objc_msgSend(*(id *)&v1[v50], "topAnchor");
  v73 = objc_msgSend(v1, "view");
  if (!v73)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v74 = v73;
  v75 = objc_msgSend(v73, "SBUISA_systemApertureObstructedAreaLayoutGuide");

  v76 = objc_msgSend(v75, "bottomAnchor");
  v77 = objc_msgSend(v72, "constraintEqualToAnchor:", v76);

  *(_QWORD *)(v71 + 32) = v77;
  v78 = objc_msgSend(*(id *)&v1[v50], "leadingAnchor");
  v79 = objc_msgSend(v1, "view");
  if (!v79)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v80 = v79;
  v81 = objc_msgSend(v79, "leadingAnchor");

  v82 = objc_msgSend(v78, "constraintEqualToAnchor:constant:", v81, 72.0);
  *(_QWORD *)(v71 + 40) = v82;
  aBlock[0] = v71;
  specialized Array._endMutation()();
  v83 = aBlock[0];
  v84 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v83);
  objc_msgSend(v197, "activateConstraints:", v84);

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v85 = objc_msgSend((id)objc_opt_self(HUUtilities), "sharedUtilities");
  v86 = swift_allocObject(&unk_10000C830, 24, 7);
  *(_QWORD *)(v86 + 16) = v1;
  aBlock[4] = sub_100005D18;
  v202 = v86;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000400C;
  aBlock[3] = &unk_10000C848;
  v87 = _Block_copy(aBlock);
  v88 = v202;
  v89 = v1;
  swift_release(v88);
  objc_msgSend(v85, "requestCurrentRoutesWithCompletion:", v87);
  _Block_release(v87);

  v90 = *(void **)&v89[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView];
  if (v90)
  {
    v91 = v90;
    objc_msgSend(v91, "setTintColor:", v32);
    objc_msgSend(v91, "setHidden:", 1);
    objc_msgSend(v91, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v92 = v91;
    v93 = objc_msgSend(v89, "view");
    if (v93)
    {
      v94 = v93;
      objc_msgSend(v93, "frame");
      v96 = v95;
      v98 = v97;
      v100 = v99;
      v102 = v101;

      objc_msgSend(v92, "setFrame:", v96, v98, v100, v102);
      v103 = v92;
      v104 = objc_msgSend(v199, "bundleForClass:", v200);
      v105 = String._bridgeToObjectiveC()();
      v106 = String._bridgeToObjectiveC()();
      v107 = objc_msgSend(v104, "localizedStringForKey:value:table:", v105, 0, v106);

      static String._unconditionallyBridgeFromObjectiveC(_:)(v107, v108);
      v110 = v109;

      v111 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v110);
      objc_msgSend(v103, "setAccessibilityLabel:", v111);

      v112 = objc_msgSend(v89, "view");
      if (v112)
      {
        v113 = v112;
        objc_msgSend(v112, "addSubview:", v103);

        v114 = objc_msgSend(v89, "view");
        if (v114)
        {
          v115 = v114;
          objc_msgSend(v114, "bringSubviewToFront:", v103);

          v116 = swift_allocObject(v198, 48, 7);
          *(_OWORD *)(v116 + 16) = v195;
          v117 = objc_msgSend(v103, "trailingAnchor");
          v118 = objc_msgSend(v89, "view");
          if (v118)
          {
            v119 = v118;
            v120 = objc_msgSend(v118, "trailingAnchor");

            v121 = objc_msgSend(v117, "constraintEqualToAnchor:constant:", v120, -34.0);
            *(_QWORD *)(v116 + 32) = v121;
            v122 = objc_msgSend(v103, "topAnchor");
            v123 = objc_msgSend(v89, "view");
            if (v123)
            {
              v124 = v123;
              v125 = objc_msgSend(v123, "topAnchor");

              v126 = objc_msgSend(v122, "constraintEqualToAnchor:constant:", v125, 50.0);
              *(_QWORD *)(v116 + 40) = v126;
              aBlock[0] = v116;
              specialized Array._endMutation()();
              v127 = aBlock[0];
              v128 = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v127);
              objc_msgSend(v197, "activateConstraints:", v128);

              goto LABEL_18;
            }
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            goto LABEL_44;
          }
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_18:
  v129 = (void *)objc_opt_self(UIButtonConfiguration);
  v130 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithLegibilityWeight:", 1);
  v131 = objc_msgSend(v129, "sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:", v130);

  objc_msgSend(v131, "setBaseBackgroundColor:", v32);
  objc_msgSend(v131, "setBaseForegroundColor:", v32);
  v132 = objc_msgSend(v199, "bundleForClass:", v200);
  v133 = String._bridgeToObjectiveC()();
  v134 = String._bridgeToObjectiveC()();
  v135 = objc_msgSend(v132, "localizedStringForKey:value:table:", v133, 0, v134);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v135, v136);
  v138 = v137;

  v139 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v138);
  objc_msgSend(v131, "setTitle:", v139);

  sub_100005D40(0, &qword_1000129C0, SBUISystemApertureButton_ptr);
  v140 = v194;
  static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)(v131);
  sub_100005D40(0, &qword_1000129C8, UIAction_ptr);
  v141 = swift_allocObject(&unk_10000C880, 24, 7);
  *(_QWORD *)(v141 + 16) = v89;
  v142 = v89;
  v143 = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100005D38, v141);
  v144 = UIButton.init(configuration:primaryAction:)(v140, v143);
  v145 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton;
  v146 = *(void **)&v142[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton];
  *(_QWORD *)&v142[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton] = v144;

  v147 = *(void **)&v142[v145];
  if (!v147)
    goto LABEL_29;
  objc_msgSend(v147, "setHidden:", 1);
  v148 = *(void **)&v142[v145];
  if (!v148)
    goto LABEL_29;
  objc_msgSend(v148, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v149 = *(void **)&v142[v145];
  if (!v149)
    goto LABEL_29;
  v150 = v149;
  v151 = objc_msgSend(v142, "view");
  if (!v151)
    goto LABEL_42;
  v152 = v151;
  objc_msgSend(v151, "frame");
  v154 = v153;
  v156 = v155;
  v158 = v157;
  v160 = v159;

  objc_msgSend(v150, "setFrame:", v154, v156, v158, v160);
  v161 = *(void **)&v142[v145];
  if (!v161)
    goto LABEL_29;
  v162 = v161;
  v163 = objc_msgSend(v199, "bundleForClass:", v200);
  v164 = String._bridgeToObjectiveC()();
  v165 = String._bridgeToObjectiveC()();
  v166 = objc_msgSend(v163, "localizedStringForKey:value:table:", v164, 0, v165);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v166, v167);
  v169 = v168;

  v170 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v169);
  objc_msgSend(v162, "setAccessibilityLabel:", v170);

  v171 = *(void **)&v142[v145];
  if (!v171)
    goto LABEL_29;
  v172 = v171;
  v173 = objc_msgSend(v142, "view");
  if (!v173)
    goto LABEL_43;
  v174 = v173;
  objc_msgSend(v173, "addSubview:", v172);

  v175 = swift_allocObject(v198, 56, 7);
  *(_OWORD *)(v175 + 16) = xmmword_100007BE0;
  v176 = objc_msgSend(v172, "leadingAnchor");
  v177 = objc_msgSend(v142, "view");
  if (!v177)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v178 = v177;
  v179 = objc_msgSend(v177, "leadingAnchor");

  v180 = objc_msgSend(v176, "constraintEqualToAnchor:constant:", v179, 20.0);
  *(_QWORD *)(v175 + 32) = v180;
  v181 = objc_msgSend(v172, "trailingAnchor");
  v182 = objc_msgSend(v142, "view");
  if (!v182)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v183 = v182;
  v184 = objc_msgSend(v182, "trailingAnchor");

  v185 = objc_msgSend(v181, "constraintEqualToAnchor:constant:", v184, -20.0);
  *(_QWORD *)(v175 + 40) = v185;
  v186 = objc_msgSend(v172, "bottomAnchor");
  v187 = objc_msgSend(v142, "view");
  if (v187)
  {
    v188 = v187;
    v189 = objc_msgSend(v187, "bottomAnchor");

    v190 = objc_msgSend(v186, "constraintEqualToAnchor:constant:", v189, -20.0);
    *(_QWORD *)(v175 + 48) = v190;
    aBlock[0] = v175;
    specialized Array._endMutation()();
    v191 = aBlock[0];
    v192 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v191);
    objc_msgSend(v197, "activateConstraints:", v192);

LABEL_29:
    return;
  }
LABEL_46:
  __break(1u);
}

uint64_t sub_100003DD8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin();
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005D40(0, &qword_1000129D0, OS_dispatch_queue_ptr);
  v10 = (void *)static OS_dispatch_queue.main.getter();
  v11 = swift_allocObject(&unk_10000C8A8, 32, 7);
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_100005DA4;
  v24 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003FE0;
  aBlock[3] = &unk_10000C8C0;
  v12 = _Block_copy(aBlock);
  v13 = v24;
  v14 = a2;
  swift_bridgeObjectRetain(a1, v15);
  v16 = swift_release(v13);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v17 = sub_1000058A0(&qword_1000129D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v18 = sub_100005B30(&qword_1000129E0);
  v19 = sub_100005DC8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v21);
}

uint64_t sub_100003FE0(uint64_t a1)
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

uint64_t sub_10000400C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_retain(v2);
  v3(v4);
  swift_release(v2);
  return swift_bridgeObjectRelease(v4);
}

void sub_100004078()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(AXHAServer), "sharedInstance");
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, "stopLiveListen");

  }
  else
  {
    __break(1u);
  }
}

void sub_1000040CC(uint64_t a1)
{
  char *v1;
  char *v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  Class isa;
  unint64_t v43;
  unint64_t v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;

  v2 = v1;
  v43 = 0xD000000000000014;
  v44 = 0x800000010000ADC0;
  AnyHashable.init<A>(_:)(v45, &v43, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v4 = sub_100005A8C((uint64_t)v45), (v5 & 1) != 0))
  {
    sub_100005BB8(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v46);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }
  sub_100005ABC((uint64_t)v45);
  if (!*((_QWORD *)&v47 + 1))
  {
    v10 = &v46;
LABEL_20:
    sub_100005AF0((uint64_t)v10);
    return;
  }
  v6 = sub_100005D40(0, &qword_1000129A8, NSDictionary_ptr);
  if ((swift_dynamicCast(&v43, &v46, (char *)&type metadata for Any + 8, v6, 6) & 1) == 0)
    return;
  v7 = (void *)v43;
  *(_QWORD *)&v46 = 0x6D614E6574756F52;
  *((_QWORD *)&v46 + 1) = 0xE900000000000065;
  v8 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v46, &type metadata for String);
  v9 = objc_msgSend(v7, "__swift_objectForKeyedSubscript:", v8);
  swift_unknownObjectRelease(v8);
  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(&v46, v9);
    swift_unknownObjectRelease(v9);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }
  sub_100005B70((uint64_t)&v46, (uint64_t)v45);
  if (!v45[3])
  {

    v10 = (__int128 *)v45;
    goto LABEL_20;
  }
  if ((swift_dynamicCast(&v43, v45, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
  {
    v11 = v44;
    v12 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel;
    v13 = *(id *)&v2[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel];
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
    objc_msgSend(v13, "setText:", v14);

    v15 = *(void **)&v2[v12];
    v16 = (void *)objc_opt_self(UIColor);
    v17 = v15;
    v18 = objc_msgSend(v16, "grayColor");
    objc_msgSend(v17, "setTextColor:", v18);

    objc_msgSend(*(id *)&v2[v12], "setHidden:", 1);
    objc_msgSend(*(id *)&v2[v12], "sizeToFit");
    v19 = *(void **)&v2[v12];
    v20 = objc_allocWithZone((Class)UIFontMetrics);
    v21 = v19;
    v22 = objc_msgSend(v20, "initForTextStyle:", UIFontTextStyleFootnote);
    v23 = objc_msgSend((id)objc_opt_self(UIFontDescriptor), "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote);
    objc_msgSend(v23, "pointSize");
    if (v24 <= 20.0)
      v25 = v24;
    else
      v25 = 20.0;
    v26 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", v25, UIFontWeightMedium);
    v27 = objc_msgSend(v22, "scaledFontForFont:", v26);

    objc_msgSend(v21, "setFont:", v27);
    objc_msgSend(*(id *)&v2[v12], "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(*(id *)&v2[v12], "setUserInteractionEnabled:", 0);
    v28 = objc_msgSend(v2, "view");
    if (v28)
    {
      v29 = v28;
      objc_msgSend(v28, "addSubview:", *(_QWORD *)&v2[v12]);

      v30 = sub_100005B30(&qword_1000129B0);
      v31 = swift_allocObject(v30, 48, 7);
      *(_OWORD *)(v31 + 16) = xmmword_100007BD0;
      v32 = objc_msgSend(*(id *)&v2[v12], "leadingAnchor");
      v33 = objc_msgSend(v2, "view");
      if (v33)
      {
        v34 = v33;
        v35 = (void *)objc_opt_self(NSLayoutConstraint);
        v36 = objc_msgSend(v34, "leadingAnchor");

        v37 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v36, 72.0);
        *(_QWORD *)(v31 + 32) = v37;
        v38 = objc_msgSend(*(id *)&v2[v12], "topAnchor");
        v39 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel], "bottomAnchor");
        v40 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, 2.0);

        *(_QWORD *)(v31 + 40) = v40;
        v45[0] = v31;
        specialized Array._endMutation()();
        v41 = v45[0];
        sub_100005D40(0, &qword_1000129B8, NSLayoutConstraint_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v41);
        objc_msgSend(v35, "activateConstraints:", isa);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {

  }
}

void sub_100004654(void *a1, double a2, double a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  objc_super v18;

  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  objc_msgSendSuper2(&v18, "viewWillTransitionToSize:withTransitionCoordinator:", a1, a2, a3);
  v7 = swift_allocObject(&unk_10000C8F8, 24, 7);
  *(_QWORD *)(v7 + 16) = v3;
  v16 = sub_100006290;
  v17 = v7;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_100004988;
  v15 = &unk_10000C910;
  v8 = _Block_copy(&v12);
  v9 = v17;
  v10 = v3;
  swift_release(v9);
  v16 = (void (*)(uint64_t))nullsub_1;
  v17 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_100004988;
  v15 = &unk_10000C938;
  v11 = _Block_copy(&v12);
  objc_msgSend(a1, "animateAlongsideTransition:completion:", v8, v11);
  _Block_release(v11);
  _Block_release(v8);
}

void sub_10000477C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = *(_QWORD *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode);
  switch(v3)
  {
    case 4:
      v5 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView);
      if (v5)
        objc_msgSend(v5, "setHidden:", 1);
      v6 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView);
      if (v6)
        objc_msgSend(v6, "setHidden:", 1);
      v7 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView);
      if (v7)
        objc_msgSend(v7, "setHidden:", 1);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView), "setHidden:", 0);
      v8 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView);
      if (v8)
        objc_msgSend(v8, "setHidden:", 0);
      v9 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton);
      if (v9)
        objc_msgSend(v9, "setHidden:", 0);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel), "setHidden:", 0);
      v4 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel);
      goto LABEL_17;
    case 3:
      v11 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView);
      if (v11)
        objc_msgSend(v11, "setHidden:", 0);
      v12 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView);
      if (v12)
        objc_msgSend(v12, "setHidden:", 0);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView), "setHidden:", 1);
      v13 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView);
      if (v13)
        objc_msgSend(v13, "setHidden:", 1);
      v14 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton);
      if (v14)
        objc_msgSend(v14, "setHidden:", 1);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel), "setHidden:", 1);
      v4 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel);
      v10 = 1;
      goto LABEL_27;
    case 2:
      v4 = *(void **)(a2 + OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView);
      if (v4)
      {
LABEL_17:
        v10 = 0;
LABEL_27:
        objc_msgSend(v4, "setHidden:", v10);
      }
      break;
  }
}

uint64_t sub_100004988(uint64_t a1, uint64_t a2)
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

id sub_100004A48(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  id v25;
  objc_super v27;

  *(_QWORD *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_contentRole] = 2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_maximumLayoutMode] = 4;
  v6 = (void *)SBUISystemApertureElementIdentifierLiveListen;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierLiveListen;
  v7 = &v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_statusBarStyleOverridesToSuppress] = 1024;
  v8 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredHeightForBottomSafeArea;
  v9 = v3;
  v10 = v6;
  *(double *)&v3[v8] = sub_100005E58();
  v11 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView;
  v12 = (objc_class *)type metadata accessor for LiveListenLeadingView();
  v13 = objc_allocWithZone(v12);
  sub_10000504C(1);
  *(_QWORD *)&v9[v11] = v14;
  v15 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView;
  *(_QWORD *)&v9[v15] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LiveListenTrailingView()), "init");
  v16 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView;
  v17 = objc_allocWithZone(v12);
  sub_10000504C(1);
  *(_QWORD *)&v9[v16] = v18;
  v19 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView;
  *(_QWORD *)&v9[v19] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v20 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView;
  *(_QWORD *)&v9[v20] = objc_msgSend(objc_allocWithZone((Class)LiveListenLevels), "initWithFrame:inCompact:", 0, 0.0, 0.0, 160.0, 40.0);
  v21 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel;
  *(_QWORD *)&v9[v21] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v22 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel;
  *(_QWORD *)&v9[v22] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v9[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton] = 0;
  v23 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor;
  *(_QWORD *)&v9[v23] = objc_msgSend((id)objc_opt_self(UIColor), "systemOrangeColor");

  if (a2)
  {
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v24 = 0;
  }
  v27.receiver = v9;
  v27.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  v25 = objc_msgSendSuper2(&v27, "initWithNibName:bundle:", v24, a3);

  return v25;
}

id sub_100004D08(void *a1)
{
  char *v1;
  void *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  objc_super v23;

  *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_contentRole] = 2;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_maximumLayoutMode] = 4;
  v3 = (void *)SBUISystemApertureElementIdentifierLiveListen;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierLiveListen;
  v4 = &v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_statusBarStyleOverridesToSuppress] = 1024;
  v5 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_preferredHeightForBottomSafeArea;
  v6 = v1;
  v7 = v3;
  *(double *)&v1[v5] = sub_100005E58();
  v8 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingView;
  v9 = (objc_class *)type metadata accessor for LiveListenLeadingView();
  v10 = objc_allocWithZone(v9);
  sub_10000504C(1);
  *(_QWORD *)&v6[v8] = v11;
  v12 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingView;
  *(_QWORD *)&v6[v12] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LiveListenTrailingView()), "init");
  v13 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_minimalView;
  v14 = objc_allocWithZone(v9);
  sub_10000504C(1);
  *(_QWORD *)&v6[v13] = v15;
  v16 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_leadingCustomView;
  *(_QWORD *)&v6[v16] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v17 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_trailingCustomView;
  *(_QWORD *)&v6[v17] = objc_msgSend(objc_allocWithZone((Class)LiveListenLevels), "initWithFrame:inCompact:", 0, 0.0, 0.0, 160.0, 40.0);
  v18 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenLabel;
  *(_QWORD *)&v6[v18] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v19 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_liveListenSubtitleLabel;
  *(_QWORD *)&v6[v19] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v6[OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_stopButton] = 0;
  v20 = OBJC_IVAR____TtC10HearingApp38LiveListenSystemApertureViewController_keyColor;
  *(_QWORD *)&v6[v20] = objc_msgSend((id)objc_opt_self(UIColor), "systemOrangeColor");

  v23.receiver = v6;
  v23.super_class = (Class)type metadata accessor for LiveListenSystemApertureViewController();
  v21 = objc_msgSendSuper2(&v23, "initWithCoder:", a1);

  return v21;
}

id sub_100004F54()
{
  return sub_1000054B0(type metadata accessor for LiveListenSystemApertureViewController);
}

uint64_t type metadata accessor for LiveListenSystemApertureViewController()
{
  return objc_opt_self(_TtC10HearingApp38LiveListenSystemApertureViewController);
}

void sub_10000504C(char a1)
{
  char *v1;
  double *v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  void *v13;
  id v14;
  id v15;
  NSString v16;
  id v17;
  id v18;
  id v19;
  id v20;
  objc_super v21;

  v3 = (double *)&v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_compressedElementSize];
  v4 = nullsub_1(14.3, 19.0);
  v6 = v5;
  *v3 = v4;
  v3[1] = v5;
  v7 = (double *)&v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_customElementSize];
  v8 = nullsub_1(28.0, 37.7);
  *v7 = v8;
  v7[1] = v9;
  if ((a1 & 1) == 0)
  {
    v4 = v8;
    v6 = v9;
  }
  v21.receiver = v1;
  v21.super_class = (Class)type metadata accessor for LiveListenLeadingView();
  v10 = objc_msgSendSuper2(&v21, "initWithFrame:", 0.0, 0.0, v4, v6);
  v11 = type metadata accessor for LiveListenSystemApertureViewController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
  v13 = (void *)objc_opt_self(NSBundle);
  v14 = v10;
  v15 = objc_msgSend(v13, "bundleForClass:", ObjCClassFromMetadata);
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:inBundle:", v16, v15);

  if (v17)
  {
    v18 = objc_msgSend(v17, "imageWithRenderingMode:", 2);

    v19 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v18);
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v4, v6);
    v20 = objc_msgSend((id)objc_opt_self(UIColor), "systemOrangeColor");
    objc_msgSend(v19, "setTintColor:", v20);

    objc_msgSend(v14, "addSubview:", v19);
  }
  else
  {
    __break(1u);
  }
}

id sub_100005264(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = &v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_compressedElementSize];
  *(double *)v3 = nullsub_1(14.3, 19.0);
  *((_QWORD *)v3 + 1) = v4;
  v5 = &v1[OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_customElementSize];
  *(double *)v5 = nullsub_1(28.0, 37.7);
  *((_QWORD *)v5 + 1) = v6;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for LiveListenLeadingView();
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100005370()
{
  return sub_1000054B0(type metadata accessor for LiveListenLeadingView);
}

uint64_t type metadata accessor for LiveListenLeadingView()
{
  return objc_opt_self(_TtC10HearingApp21LiveListenLeadingView);
}

id sub_1000054A4()
{
  return sub_1000054B0(type metadata accessor for LiveListenTrailingView);
}

id sub_1000054B0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for LiveListenTrailingView()
{
  return objc_opt_self(_TtC10HearingApp22LiveListenTrailingView);
}

__n128 sub_100005500(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005510(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005530(uint64_t result, int a2, int a3)
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
  sub_1000055BC(a1, &qword_100012950, (uint64_t)&unk_10000C778);
}

void type metadata accessor for _UIStatusBarStyleOverrides(uint64_t a1)
{
  sub_1000055BC(a1, &qword_100012958, (uint64_t)&unk_10000C7A0);
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
  sub_1000055BC(a1, &qword_100012960, (uint64_t)&unk_10000C7C8);
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
  sub_1000055BC(a1, &qword_100012968, (uint64_t)&unk_10000C7F0);
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
  sub_1000055BC(a1, &qword_100012970, (uint64_t)&unk_10000C810);
}

void sub_1000055BC(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100005600(uint64_t a1, uint64_t a2)
{
  return sub_1000058EC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000560C(uint64_t a1, id *a2)
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

uint64_t sub_100005680(uint64_t a1, id *a2)
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

uint64_t sub_1000056FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1, a2);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v5);
  *a3 = v6;
  return result;
}

_QWORD *sub_10000573C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_10000574C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100005758@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_10000579C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v5;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v2, a1);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1000057C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000058A0(&qword_100012990, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100007E20);
  v3 = sub_1000058A0(&qword_100012998, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100007DC8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005848()
{
  return sub_1000058A0(&qword_100012978, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100007D90);
}

uint64_t sub_100005874()
{
  return sub_1000058A0(&qword_100012980, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100007D68);
}

uint64_t sub_1000058A0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000058E0(uint64_t a1, uint64_t a2)
{
  return sub_1000058EC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000058EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3, a2);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100005928(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v2, a2);
  v6 = v5;
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v6);
}

Swift::Int sub_100005968(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v2, a2);
  v6 = v5;
  Hasher.init(_seed:)(v9, a1);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

uint64_t sub_1000059D8(_QWORD *a1, uint64_t *a2)
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
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1, a2);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v4);
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

uint64_t sub_100005A60()
{
  return sub_1000058A0(&qword_100012988, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100007DF8);
}

unint64_t sub_100005A8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100005BF4(a1, v4);
}

uint64_t sub_100005ABC(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100005AF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005B30(&qword_1000129A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005B30(uint64_t *a1)
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

uint64_t sub_100005B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005B30(&qword_1000129A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100005BF4(uint64_t a1, uint64_t a2)
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
      sub_100005CB8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100005ABC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100005CB8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100005CF4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005D18(uint64_t a1)
{
  uint64_t v1;

  return sub_100003DD8(a1, *(void **)(v1 + 16));
}

uint64_t sub_100005D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005D30(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100005D38()
{
  sub_100004078();
}

uint64_t sub_100005D40(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100005D78()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100005DA4()
{
  uint64_t v0;

  sub_1000040CC(*(_QWORD *)(v0 + 24));
}

unint64_t sub_100005DC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000129E8;
  if (!qword_1000129E8)
  {
    v1 = sub_100005E14(&qword_1000129E0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000129E8);
  }
  return result;
}

uint64_t sub_100005E14(uint64_t *a1)
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

double sub_100005E58()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
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
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  double v66;
  id v67;
  double v68;
  uint64_t v69;

  v0 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v1 = objc_msgSend(v0, "preferredContentSizeCategory");

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, v2);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v4);
  if (v3 == v6 && v5 == v7)
    goto LABEL_13;
  v10 = v7;
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  if ((v11 & 1) != 0)
  {
LABEL_14:

    *(double *)&v25 = 160.0;
    return *(double *)&v25;
  }
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraLarge, v12);
  v5 = v14;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v14);
  if (v13 == v15 && v5 == v16)
  {
LABEL_13:
    swift_bridgeObjectRelease_n(v5, 2, v8);
    goto LABEL_14;
  }
  v18 = v16;
  v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v5, v15, v16, 0);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v18);
  if ((v19 & 1) != 0)
    goto LABEL_14;
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraLarge, v20);
  v5 = v22;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v22);
  v24 = v23;
  if (v21 == v8 && v5 == v23)
    goto LABEL_13;
  v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v5, v8, v23, 0);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v24);
  if ((v27 & 1) != 0)
    goto LABEL_14;
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityLarge, v28);
  v5 = v30;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v30);
  v32 = v31;
  if (v29 == v8 && v5 == v31)
    goto LABEL_13;
  v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v5, v8, v31, 0);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v32);
  if ((v33 & 1) != 0)
    goto LABEL_14;
  v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityMedium, v34);
  v37 = v36;
  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v36);
  v40 = v38;
  if (v35 == v39 && v37 == v38)
  {
    swift_bridgeObjectRelease_n(v37, 2, v39);
LABEL_24:

    v43 = 0x200000000000;
LABEL_25:
    v25 = v43 & 0xFFFFFFFFFFFFLL | 0x4062000000000000;
    return *(double *)&v25;
  }
  v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, v39, v38, 0);
  swift_bridgeObjectRelease(v37);
  swift_bridgeObjectRelease(v40);
  if ((v41 & 1) != 0)
    goto LABEL_24;
  v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraExtraExtraLarge, v42);
  v46 = v45;
  v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v45);
  v49 = v47;
  if (v44 == v48 && v46 == v47)
  {
    swift_bridgeObjectRelease_n(v46, 2, v48);
LABEL_30:

    v43 = 0xC00000000000;
    goto LABEL_25;
  }
  v50 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v46, v48, v47, 0);
  swift_bridgeObjectRelease(v46);
  swift_bridgeObjectRelease(v49);
  if ((v50 & 1) != 0)
    goto LABEL_30;
  v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraExtraLarge, v51);
  v54 = v53;
  v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v53);
  v57 = v55;
  if (v52 == v56 && v54 == v55)
  {
    swift_bridgeObjectRelease_n(v54, 2, v56);
LABEL_35:

    *(double *)&v25 = 140.0;
    return *(double *)&v25;
  }
  v58 = _stringCompareWithSmolCheck(_:_:expecting:)(v52, v54, v56, v55, 0);
  swift_bridgeObjectRelease(v54);
  swift_bridgeObjectRelease(v57);
  if ((v58 & 1) != 0)
    goto LABEL_35;
  v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraLarge, v59);
  v62 = v61;
  v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1, v61);
  v69 = v63;
  if (v60 == v64 && v62 == v63)
  {
    v68 = 130.0;
  }
  else
  {
    v65 = _stringCompareWithSmolCheck(_:_:expecting:)(v60, v62, v64, v63, 0);
    v66 = 120.0;
    if ((v65 & 1) != 0)
      v66 = 130.0;
    v68 = v66;
  }
  v67 = v1;

  swift_bridgeObjectRelease(v62);
  swift_bridgeObjectRelease(v69);
  return v68;
}

void sub_100006290(uint64_t a1)
{
  uint64_t v1;

  sub_10000477C(a1, *(_QWORD *)(v1 + 16));
}

void sub_100006370(void *a1, uint64_t a2, void *a3, const char *a4)
{
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v10 = a3;
  v6 = a1;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, a4, v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

}

id sub_100006500()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingSessionSceneDelegate(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006584()
{
  return type metadata accessor for HearingSessionSceneDelegate(0);
}

uint64_t type metadata accessor for HearingSessionSceneDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_100012AE0;
  if (!qword_100012AE0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for HearingSessionSceneDelegate);
  return result;
}

uint64_t sub_1000065C8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100006644(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_100006714(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType();
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_100005BB8((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_100005BB8((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2, v7);
  }
  sub_100006F80(v13);
  return v8;
}

uint64_t sub_100006714(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000068CC(a5, a6);
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

uint64_t sub_1000068CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100006960(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100006B38(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100006B38(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100006960(uint64_t a1, unint64_t a2)
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
      v5 = sub_100006AD4(v4, 0);
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

_QWORD *sub_100006AD4(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005B30((uint64_t *)&unk_100012AF0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006B38(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005B30((uint64_t *)&unk_100012AF0);
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

void sub_100006C84(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint8_t *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *oslog;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v4 = type metadata accessor for ActivityScene(0);
  v5 = swift_dynamicCastClass(a1, v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a1;
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      v26 = v23;
      *(_DWORD *)v10 = 136315138;
      v11 = objc_msgSend(v6, "description");
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
      v15 = v14;

      v25 = sub_100006644(v13, v15, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v10 + 4, v10 + 12);

      swift_bridgeObjectRelease(v15);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "SessionSceneDelegate: Connecting session scene: %s", v10, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      v16 = v10;
      v2 = v1;
      swift_slowDealloc(v16, -1, -1);
    }
    else
    {

    }
    if (objc_msgSend(v6, "SBUI_isHostedBySystemAperture"))
    {
      v19 = Logger.logObject.getter();
      v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Returning system aperture view controller", v21, 2u);
        swift_slowDealloc(v21, -1, -1);
      }

      v22 = OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider;
      objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider), "loadViewIfNeeded");
      objc_msgSend(v6, "setSystemApertureElementViewControllerProvider:", *(_QWORD *)(v2 + v22));
    }

  }
  else
  {
    oslog = Logger.logObject.getter();
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v17, "SessionSceneDelegate: Received a UIScene that is not of type SessionScene.", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

  }
}

uint64_t sub_100006F80(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006FA4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC10HearingAppP33_5F6AF80EE7B326B531B09FC9B9D6E87619ResourceBundleClass);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGPath");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_levels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "levels");
}

id objc_msgSend_registerListener_forLiveListenLevelsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerListener:forLiveListenLevelsHandler:");
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "semanticContentAttribute");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setLevels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevels:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOrangeColor");
}

id objc_msgSend_updateLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLevel:");
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}
