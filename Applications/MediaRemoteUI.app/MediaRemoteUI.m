void sub_100004A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004A50(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = _MRLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100031254((uint64_t)v3, v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "invalidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v8, "isEqualToString:", SBSLockScreenContentAssertionErrorDomain))
    {
      v9 = objc_msgSend(v3, "code");

      if (v9 == (id)4)
        goto LABEL_9;
    }
    else
    {

    }
    objc_msgSend(v7, "delayAcquire");
  }
LABEL_9:

}

id sub_100004B8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "acquire");
}

uint64_t sub_100004C64()
{
  if (qword_10005A880 != -1)
    dispatch_once(&qword_10005A880, &stru_1000450E0);
  return byte_10005A888;
}

void sub_100004CA4(id a1)
{
  byte_10005A888 = MGGetBoolAnswer(CFSTR("GdXjx1ixZYvN9Gg8iSf68A"));
}

uint64_t start(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;

  v4 = (objc_class *)objc_opt_class(MRUIApplication);
  v5 = NSStringFromClass(v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (objc_class *)objc_opt_class(_TtC13MediaRemoteUI11AppDelegate);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v10 = UIApplicationMain(a1, a2, v6, v9);

  return v10;
}

id sub_100004E34()
{
  id v0;
  id v1;
  id v2;
  double v3;
  double v4;

  v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v1 = objc_msgSend((id)objc_opt_self(UIFont), "mru_suggestedRouteBannerTitleFont");
  objc_msgSend(v0, "setFont:", v1);

  v2 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  objc_msgSend(v0, "setTextColor:", v2);

  LODWORD(v3) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  return v0;
}

double sub_100004F2C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  double v4;

  KeyPath = swift_getKeyPath(&unk_100033950);
  v2 = swift_getKeyPath(&unk_100033978);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

char *sub_100004F9C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_class *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSString v36;
  id v37;
  void *v38;
  double v39;
  uint64_t v41;
  objc_super v42;
  _BYTE v43[216];
  _QWORD v44[28];

  v3 = sub_100006CE8((uint64_t *)&unk_100058B80);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel;
  v8 = v1;
  *(_QWORD *)&v1[v7] = sub_100004E34();
  v9 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView;
  v10 = objc_msgSend(objc_allocWithZone((Class)MRUCAPackageView), "init");
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v8[v9] = v10;
  v11 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide;
  *(_QWORD *)&v8[v11] = objc_msgSend(objc_allocWithZone((Class)UILayoutGuide), "init");
  v12 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide;
  *(_QWORD *)&v8[v12] = objc_msgSend(objc_allocWithZone((Class)UILayoutGuide), "init");
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding] = 0x4020000000000000;
  v13 = &v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth];
  v44[0] = 0;
  Published.init(initialValue:)(v44, &type metadata for CGFloat);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v6, v3);
  v14 = &v8[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v14 = *(_OWORD *)a1;
  *((_OWORD *)v14 + 1) = v15;
  v16 = *(_OWORD *)(a1 + 80);
  v18 = *(_OWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v14 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v14 + 5) = v16;
  *((_OWORD *)v14 + 2) = v18;
  *((_OWORD *)v14 + 3) = v17;
  v19 = *(_OWORD *)(a1 + 144);
  v21 = *(_OWORD *)(a1 + 96);
  v20 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v14 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v14 + 9) = v19;
  *((_OWORD *)v14 + 6) = v21;
  *((_OWORD *)v14 + 7) = v20;
  v23 = *(_OWORD *)(a1 + 176);
  v22 = *(_OWORD *)(a1 + 192);
  v24 = *(_OWORD *)(a1 + 160);
  *((_QWORD *)v14 + 26) = *(_QWORD *)(a1 + 208);
  *((_OWORD *)v14 + 11) = v23;
  *((_OWORD *)v14 + 12) = v22;
  *((_OWORD *)v14 + 10) = v24;
  sub_100006D28((_QWORD *)a1);

  v25 = (objc_class *)type metadata accessor for SuggestedRouteBannerTitleView(0);
  v42.receiver = v8;
  v42.super_class = v25;
  v26 = (char *)objc_msgSendSuper2(&v42, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v27 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView;
  v28 = *(void **)&v26[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
  v29 = (void *)objc_opt_self(MRUAssetsProvider);
  v30 = v26;
  v31 = v28;
  v32 = objc_msgSend(v29, "suggestedRouteWaveformPackageName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  v34 = v33;

  v35 = objc_allocWithZone((Class)MRUCAPackageAsset);
  v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v34);
  v37 = objc_msgSend(v35, "initWithPackageName:", v36);

  objc_msgSend(v31, "setAsset:", v37);
  v38 = *(void **)&v26[v27];
  objc_msgSend(v38, "setScale:", 0.3017);
  LODWORD(v39) = 1148846080;
  objc_msgSend(v38, "setContentCompressionResistancePriority:forAxis:", 0, v39);
  objc_msgSend(v30, "addLayoutGuide:", *(_QWORD *)&v30[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide]);
  objc_msgSend(v30, "addLayoutGuide:", *(_QWORD *)&v30[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide]);
  objc_msgSend(v30, "addSubview:", *(_QWORD *)&v30[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel]);
  objc_msgSend(v30, "addSubview:", v38);
  sub_100005310();
  sub_100006E10((uint64_t)v44);
  sub_100006E38((uint64_t)v44, (uint64_t)v43);
  sub_1000059D8((uint64_t)v43);
  sub_100006E80((_QWORD *)a1);

  return v30;
}

void sub_100005310()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
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
  id v22;
  id v23;
  id v24;
  id v25;
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
  id v36;
  id v37;
  void *v38;
  id v39;
  Class isa;

  v1 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel];
  v2 = objc_msgSend(v1, "trailingAnchor");
  v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide];
  v4 = objc_msgSend(v3, "leadingAnchor");
  v5 = objc_msgSend(v2, "constraintEqualToAnchor:", v4);

  v6 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint];
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint] = v5;

  v7 = objc_msgSend(v1, "trailingAnchor");
  v39 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
  v8 = objc_msgSend(v39, "leadingAnchor");
  v9 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -*(double *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding]);

  v10 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint];
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint] = v9;

  v38 = (void *)objc_opt_self(NSLayoutConstraint);
  v11 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v12 = swift_allocObject(v11, 96, 7);
  *(_OWORD *)(v12 + 16) = xmmword_1000334D0;
  v13 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide];
  v14 = objc_msgSend(v13, "leadingAnchor");
  v15 = objc_msgSend(v0, "leadingAnchor");
  v16 = objc_msgSend(v14, "constraintEqualToAnchor:", v15);

  *(_QWORD *)(v12 + 32) = v16;
  v17 = objc_msgSend(v3, "trailingAnchor");
  v18 = objc_msgSend(v0, "trailingAnchor");
  v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);

  *(_QWORD *)(v12 + 40) = v19;
  v20 = objc_msgSend(v13, "widthAnchor");
  v21 = objc_msgSend(v3, "widthAnchor");
  v22 = objc_msgSend(v20, "constraintEqualToAnchor:", v21);

  *(_QWORD *)(v12 + 48) = v22;
  v23 = objc_msgSend(v1, "leadingAnchor");
  v24 = objc_msgSend(v13, "trailingAnchor");
  v25 = objc_msgSend(v23, "constraintEqualToAnchor:", v24);

  *(_QWORD *)(v12 + 56) = v25;
  v26 = objc_msgSend(v1, "topAnchor");
  v27 = objc_msgSend(v0, "topAnchor");
  v28 = objc_msgSend(v26, "constraintEqualToAnchor:", v27);

  *(_QWORD *)(v12 + 64) = v28;
  v29 = objc_msgSend(v1, "bottomAnchor");
  v30 = objc_msgSend(v0, "bottomAnchor");
  v31 = objc_msgSend(v29, "constraintEqualToAnchor:", v30);

  *(_QWORD *)(v12 + 72) = v31;
  v32 = objc_msgSend(v39, "centerYAnchor");
  v33 = objc_msgSend(v0, "centerYAnchor");
  v34 = objc_msgSend(v32, "constraintEqualToAnchor:", v33);

  *(_QWORD *)(v12 + 80) = v34;
  v35 = objc_msgSend(v39, "trailingAnchor");
  v36 = objc_msgSend(v3, "leadingAnchor");
  v37 = objc_msgSend(v35, "constraintEqualToAnchor:", v36);

  *(_QWORD *)(v12 + 88) = v37;
  specialized Array._endMutation()();
  sub_100006F84();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  objc_msgSend(v38, "activateConstraints:", isa);

}

double sub_10000582C()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSString v13;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel);
  objc_msgSend(v1, "intrinsicContentSize");
  v3 = v2;
  v4 = *(double *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView), "intrinsicContentSize");
  v6 = v5;
  v7 = objc_msgSend(v1, "text");
  if (!v7)
    goto LABEL_5;
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  swift_bridgeObjectRelease(v11);
  v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v12 = v9 & 0xFFFFFFFFFFFFLL;
  if (!v12)
  {
LABEL_5:
    v13 = String._bridgeToObjectiveC()();
    objc_msgSend(v1, "setText:", v13);

  }
  objc_msgSend(v1, "intrinsicContentSize");
  return v3 + v4 + v6;
}

id sub_1000059D8(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString v7;
  char v8;
  BOOL v9;
  uint64_t v10;
  id result;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSString v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[216];
  _BYTE v26[32];
  uint64_t v27;
  uint64_t v28;

  v3 = &v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  v4 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 40];
  sub_100006E38(a1, (uint64_t)v26);
  if (sub_100006F6C((uint64_t)v26) != 1
    && (v5 == v27 ? (v9 = v4 == v28) : (v9 = 0),
        v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v4, v27, v28, 0) & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    v6 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel];
    swift_bridgeObjectRetain(v4);
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    objc_msgSend(v6, "setText:", v7);

    v8 = 0;
  }
  v10 = v3[112];
  sub_100006E38(a1, (uint64_t)v25);
  result = (id)sub_100006F6C((uint64_t)v25);
  if ((_DWORD)result == 1 || (v25[112] & 1) != (_DWORD)v10)
  {
    v12 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint];
    if (v12)
    {
      v13 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint];
      if (v13)
      {
        v14 = v12;
        v15 = v13;
        objc_msgSend(v14, "setActive:", v10);
        objc_msgSend(v15, "setActive:", (v3[112] & 1) == 0);

      }
    }
    v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel];
    if (v3[112] == 1)
    {
      objc_msgSend(v16, "setTextAlignment:", 2);
      v17 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
      v18 = objc_msgSend((id)objc_opt_self(MRUAssetsProvider), "suggestedRouteWaveformPackageStateOn");
      if (!v18)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v20 = v19;
        v18 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v20);
      }
      objc_msgSend(v17, "setGlyphState:", v18);

      objc_msgSend(v17, "setAlpha:", 1.0);
    }
    else
    {
      objc_msgSend(v16, "setTextAlignment:", 1);
      v21 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
      v22 = objc_msgSend((id)objc_opt_self(MRUAssetsProvider), "suggestedRouteWaveformPackageStateOff");
      if (!v22)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v24 = v23;
        v22 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v24);
      }
      objc_msgSend(v21, "setGlyphState:", v22);

      objc_msgSend(v21, "setAlpha:", 0.0);
    }
    return objc_msgSend(v1, "invalidateIntrinsicContentSize");
  }
  if ((v8 & 1) == 0)
    return objc_msgSend(v1, "invalidateIntrinsicContentSize");
  return result;
}

id sub_100005CC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerTitleView(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of LockScreenCoordinator.artwork()
{
  return 0;
}

double variable initialization expression of LockScreenCoordinator.bottomBounds@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

uint64_t variable initialization expression of LockScreenCoordinator.platterContentSize()
{
  return 0;
}

id variable initialization expression of LockScreenCoordinator.wallpaperService()
{
  return objc_msgSend(objc_allocWithZone((Class)SBSWallpaperService), "init");
}

uint64_t variable initialization expression of LockScreenCoordinator.prefersExpandedState()
{
  return MRPrefersExpandedLockScreenPlatter();
}

uint64_t variable initialization expression of LockScreenCoordinator.shouldExpandWhenAmbientSceneDisconnects()
{
  return 0;
}

double variable initialization expression of LockScreenCoordinator.ambientLifecycleCancellable@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_100005E78()
{
  return type metadata accessor for SuggestedRouteBannerTitleView(0);
}

uint64_t type metadata accessor for SuggestedRouteBannerTitleView(uint64_t a1)
{
  uint64_t result;

  result = qword_100058A70;
  if (!qword_100058A70)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SuggestedRouteBannerTitleView);
  return result;
}

void sub_100005EBC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[9];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[4] = "\b";
  v4[5] = "\b";
  v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[7] = &unk_100033528;
  sub_100006FF8(319, (unint64_t *)&qword_100058A80, (uint64_t)&type metadata for CGFloat, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Published);
  if (v3 <= 0x3F)
  {
    v4[8] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 9, v4, a1 + 80);
  }
}

void type metadata accessor for MRGroupSessionRouteType(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058AE8, (uint64_t)&unk_100045268, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

__n128 sub_100005F94(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005FA4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005FC4(uint64_t result, int a2, int a3)
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
  sub_100006FF8(a1, &qword_100058AF0, (uint64_t)&unk_1000452E0, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

uint64_t initializeBufferWithCopyOfBuffer for SuggestedRoute(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100006038(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006044(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100006064(uint64_t result, int a2, int a3)
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
  sub_100006FF8(a1, &qword_100058AF8, (uint64_t)&unk_100045360, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B00, (uint64_t)&unk_100045388, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for SBUISystemApertureCustomLayout(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B08, (uint64_t)&unk_1000453B0, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B10, (uint64_t)&unk_1000453D0, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B18, (uint64_t)&unk_1000453F0, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for BNPresentableBehavior(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B20, (uint64_t)&unk_100045418, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

uint64_t sub_100006138(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_10000614C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000616C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

void type metadata accessor for CAFrameRateRange(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B28, (uint64_t)&unk_100045490, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058B30, (uint64_t)&unk_1000454C0, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

double sub_1000061D0@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  double v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100033950);
  v5 = swift_getKeyPath(&unk_100033978);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = v7;
  *a2 = v7;
  return result;
}

uint64_t sub_10000624C(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100033950);
  v5 = swift_getKeyPath(&unk_100033978);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_1000062C0(uint64_t a1, uint64_t a2)
{
  return sub_1000068CC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000062CC(uint64_t a1, id *a2)
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

uint64_t sub_100006340(uint64_t a1, id *a2)
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

uint64_t sub_1000063BC@<X0>(_QWORD *a1@<X8>)
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

uint64_t sub_1000063FC(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033A00, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_100006438(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033A00, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100006480(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5);
  WitnessTable = swift_getWitnessTable(&unk_100033A00, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

void sub_1000064D8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_1000064E0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1000064F4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100006508(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100006538(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_10000654C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

void sub_100006564(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_100006570@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_100006584@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_100006598@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_1000065C4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_1000065E8(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1000065FC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100006610(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_100006624()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_100006634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_10000664C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

void sub_100006660(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_10000666C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_100033A00, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

BOOL sub_1000066B8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1000066CC(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

_QWORD *sub_1000066E0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000066EC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006714@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_100006CB0(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_100006750@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100006794(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006870(&qword_100058B70, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100033738);
  v3 = sub_100006870(&qword_100058B78, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_1000336E0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006818()
{
  return sub_100006870(&qword_100058B38, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_1000336A8);
}

uint64_t sub_100006844()
{
  return sub_100006870(&qword_100058B40, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100033680);
}

uint64_t sub_100006870(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

_QWORD *sub_1000068B0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1000068C0(uint64_t a1, uint64_t a2)
{
  return sub_1000068CC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000068CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100006908(uint64_t a1)
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

Swift::Int sub_100006948()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::Int v4;
  _QWORD v6[9];

  v1 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v0);
  v3 = v2;
  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, v1, v3);
  v4 = Hasher._finalize()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_1000069B8(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100006A40()
{
  return sub_100006870(&qword_100058B48, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100033710);
}

uint64_t sub_100006A6C()
{
  return sub_100006870(&qword_100058B50, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_1000337F0);
}

uint64_t sub_100006A98()
{
  return sub_100006870(&qword_100058B58, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_1000337C0);
}

uint64_t sub_100006AC4()
{
  return sub_100006870(&qword_100058B60, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100033818);
}

uint64_t sub_100006AF0()
{
  return sub_100006870(&qword_100058B68, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100033850);
}

void sub_100006B1C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = sub_100006CE8((uint64_t *)&unk_100058B80);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel;
  *(_QWORD *)&v0[v5] = sub_100004E34();
  v6 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView;
  v7 = objc_msgSend(objc_allocWithZone((Class)MRUCAPackageView), "init");
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v6] = v7;
  v8 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide;
  *(_QWORD *)&v0[v8] = objc_msgSend(objc_allocWithZone((Class)UILayoutGuide), "init");
  v9 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide;
  *(_QWORD *)&v0[v9] = objc_msgSend(objc_allocWithZone((Class)UILayoutGuide), "init");
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPadding] = 0x4020000000000000;
  v10 = &v0[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth];
  v12 = 0;
  Published.init(initialValue:)(&v12, &type metadata for CGFloat);
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v10, v4, v1);

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteBannerTitleView.swift", 49, 2, 134, 0);
  __break(1u);
}

uint64_t sub_100006CB0(uint64_t a1)
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

uint64_t sub_100006CE8(uint64_t *a1)
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

_QWORD *sub_100006D28(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[6];
  v7 = a1[8];
  v6 = (void *)a1[9];
  v8 = a1[11];
  v9 = (void *)a1[12];
  v10 = (void *)a1[13];
  v15 = a1[16];
  v16 = a1[18];
  v17 = a1[20];
  v18 = a1[22];
  v19 = a1[25];
  swift_bridgeObjectRetain(a1[26]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  v11 = v6;
  swift_bridgeObjectRetain(v8);
  v12 = v9;
  v13 = v10;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  return a1;
}

double sub_100006E10(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 208) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_100006E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CE8((uint64_t *)&unk_10005A070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100006E80(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[8];
  v7 = (void *)a1[9];
  v8 = a1[11];
  v9 = (void *)a1[12];
  v10 = (void *)a1[13];
  v12 = a1[16];
  v13 = a1[18];
  v14 = a1[20];
  v15 = a1[22];
  v16 = a1[26];
  swift_bridgeObjectRelease(a1[25]);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

uint64_t sub_100006F6C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

unint64_t sub_100006F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059040;
  if (!qword_100059040)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059040);
  }
  return result;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058CC0, (uint64_t)&unk_1000454E0, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100006FF8(a1, &qword_100058CC8, (uint64_t)&unk_100045568, (uint64_t (*)(_QWORD, uint64_t))&swift_getForeignTypeMetadata);
}

void sub_100006FF8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_10000703C()
{
  return sub_100006870((unint64_t *)&qword_100058CD0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100033A2C);
}

uint64_t sub_100007068()
{
  return sub_100006870(&qword_100058CD8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_1000339D4);
}

id sub_1000070C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack);
  }
  else
  {
    v4 = sub_100007128(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100007128(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  Class isa;
  id v10;
  uint64_t v12;

  v2 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100033A80;
  v4 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel);
  v5 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  v12 = v3;
  specialized Array._endMutation()();
  v6 = objc_allocWithZone((Class)UIStackView);
  sub_100008314(0, (unint64_t *)&qword_10005A390, UIView_ptr);
  v7 = v4;
  v8 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  v10 = objc_msgSend(v6, "initWithArrangedSubviews:", isa);

  objc_msgSend(v10, "setAxis:", 1);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v10;
}

_BYTE *sub_100007240()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon);
  if (v2)
  {
    v3 = *(_BYTE **)(v0
                   + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon);
  }
  else
  {
    v4 = v0;
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
    v6 = objc_opt_self(MRGroupSessionBannerRequest);
    LOBYTE(v5) = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v5, v6, 0, 0, 0), "routeType");
    v7 = objc_allocWithZone((Class)type metadata accessor for RouteIconView());
    v8 = sub_10002A824(v5);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_100007314()
{
  NSString v0;
  id v1;
  id v2;
  id v3;

  v0 = String._bridgeToObjectiveC()();
  v1 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v0);

  v2 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v1);
  objc_msgSend(v2, "setContentMode:", 1);
  v3 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

id sub_100007404(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  id v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  id v20;
  id v21;
  objc_super v25;

  v5 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = v3;
  v8 = objc_msgSend(v6, "init");
  v9 = (void *)objc_opt_self(UIFont);
  v10 = objc_msgSend(v9, "systemFontOfSize:weight:", 14.0, UIFontWeightSemibold);
  objc_msgSend(v8, "setFont:", v10);

  *(_QWORD *)&v3[v5] = v8;
  v11 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel;
  v12 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v13 = objc_msgSend(v9, "systemFontOfSize:", 10.0);
  objc_msgSend(v12, "setFont:", v13);

  v14 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  objc_msgSend(v12, "setTextColor:", v14);

  *(_QWORD *)&v7[v11] = v12;
  *(_QWORD *)&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon] = 0;
  v15 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon;
  *(_QWORD *)&v7[v15] = sub_100007314();
  *(_QWORD *)&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode] = 1;
  swift_unknownObjectWeakInit(&v7[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext], 0);

  v16 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  *((_QWORD *)v16 + 1) = 0;
  v17 = swift_unknownObjectWeakInit(v16, 0);
  v18 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(_QWORD *)v18 = 0xD000000000000017;
  *((_QWORD *)v18 + 1) = 0x8000000100039710;
  v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  v19 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a1;
  *(_QWORD *)(v17 + 8) = a3;
  swift_unknownObjectWeakAssign(v17, a2);
  v25.receiver = v7;
  v25.super_class = (Class)type metadata accessor for BannerBaseViewController();
  v20 = a1;
  v21 = objc_msgSendSuper2(&v25, "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v21, "setPreferredContentSize:", 300.0, 70.0);

  swift_unknownObjectRelease(a2);
  return v21;
}

id sub_1000076E8()
{
  char *v0;
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id result;
  void *v14;
  id v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _BYTE *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _BYTE *v38;
  id v39;
  id v40;
  _BYTE *v41;
  id v42;
  _BYTE *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  _BYTE *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  _BYTE *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  _BYTE *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  Class isa;
  objc_super v85;
  uint64_t v86;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel];
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration];
  v4 = objc_opt_self(MRGroupSessionBannerRequest);
  swift_dynamicCastObjCClassUnconditional(v3, v4, 0, 0, 0);
  swift_unknownObjectRetain(v3);
  sub_10000FB14();
  v6 = v5;
  swift_unknownObjectRelease(v3);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v2, "setText:", v7);

  v8 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel];
  v9 = objc_opt_self(MRGroupSessionBannerRequest);
  swift_dynamicCastObjCClassUnconditional(v3, v9, 0, 0, 0);
  swift_unknownObjectRetain(v3);
  sub_10000FD4C();
  v11 = v10;
  swift_unknownObjectRelease(v3);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  objc_msgSend(v8, "setText:", v12);

  result = objc_msgSend(v1, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  v14 = result;
  v15 = sub_1000070C8();
  objc_msgSend(v14, "addSubview:", v15);

  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = result;
  v17 = sub_100007240();
  objc_msgSend(v16, "addSubview:", v17);

  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v18 = result;
  v19 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon];
  objc_msgSend(result, "addSubview:", v19);

  v20 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v21 = swift_allocObject(v20, 144, 7);
  *(_OWORD *)(v21 + 16) = xmmword_100033A90;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22 = result;
  v23 = objc_msgSend(result, "SBUISA_systemApertureObstructedAreaLayoutGuide");

  v24 = objc_msgSend(v23, "bottomAnchor");
  v25 = sub_1000070C8();
  v26 = objc_msgSend(v25, "topAnchor");

  v27 = objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  *(_QWORD *)(v21 + 32) = v27;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v28 = result;
  v29 = objc_msgSend(result, "bottomAnchor");

  v30 = sub_1000070C8();
  v31 = objc_msgSend(v30, "bottomAnchor");

  v32 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 16.0);
  *(_QWORD *)(v21 + 40) = v32;
  v33 = sub_100007240();
  v34 = objc_msgSend(v33, "trailingAnchor");

  v35 = sub_1000070C8();
  v36 = objc_msgSend(v35, "leadingAnchor");

  v37 = objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -8.0);
  *(_QWORD *)(v21 + 48) = v37;
  v38 = sub_100007240();
  v39 = objc_msgSend(v38, "widthAnchor");

  v40 = objc_msgSend(v39, "constraintEqualToConstant:", 50.0);
  *(_QWORD *)(v21 + 56) = v40;
  v41 = sub_100007240();
  v42 = objc_msgSend(v41, "heightAnchor");

  v43 = sub_100007240();
  v44 = objc_msgSend(v43, "widthAnchor");

  v45 = objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  *(_QWORD *)(v21 + 64) = v45;
  v46 = objc_msgSend(v19, "leadingAnchor");
  v47 = sub_1000070C8();
  v48 = objc_msgSend(v47, "trailingAnchor");

  v49 = objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  *(_QWORD *)(v21 + 72) = v49;
  v50 = objc_msgSend(v19, "widthAnchor");
  v51 = objc_msgSend(v50, "constraintEqualToConstant:", 40.0);

  *(_QWORD *)(v21 + 80) = v51;
  v52 = objc_msgSend(v19, "heightAnchor");
  v53 = objc_msgSend(v19, "widthAnchor");
  v54 = objc_msgSend(v52, "constraintEqualToAnchor:", v53);

  *(_QWORD *)(v21 + 88) = v54;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v55 = result;
  v56 = objc_msgSend(result, "topAnchor");

  v57 = sub_100007240();
  v58 = objc_msgSend(v57, "topAnchor");

  v59 = objc_msgSend(v56, "constraintEqualToAnchor:", v58);
  *(_QWORD *)(v21 + 96) = v59;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v60 = result;
  v61 = objc_msgSend(result, "leadingAnchor");

  v62 = sub_100007240();
  v63 = objc_msgSend(v62, "leadingAnchor");

  v64 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, -16.0);
  *(_QWORD *)(v21 + 104) = v64;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v65 = result;
  v66 = objc_msgSend(result, "bottomAnchor");

  v67 = sub_100007240();
  v68 = objc_msgSend(v67, "bottomAnchor");

  v69 = objc_msgSend(v66, "constraintEqualToAnchor:", v68);
  *(_QWORD *)(v21 + 112) = v69;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v70 = result;
  v71 = objc_msgSend(result, "topAnchor");

  v72 = objc_msgSend(v19, "topAnchor");
  v73 = objc_msgSend(v71, "constraintEqualToAnchor:", v72);

  *(_QWORD *)(v21 + 120) = v73;
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v74 = result;
  v75 = objc_msgSend(result, "trailingAnchor");

  v76 = objc_msgSend(v19, "trailingAnchor");
  v77 = objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 16.0);

  *(_QWORD *)(v21 + 128) = v77;
  result = objc_msgSend(v1, "view");
  if (result)
  {
    v78 = result;
    v79 = (void *)objc_opt_self(NSLayoutConstraint);
    v80 = objc_msgSend(v78, "bottomAnchor");

    v81 = objc_msgSend(v19, "bottomAnchor");
    v82 = objc_msgSend(v80, "constraintEqualToAnchor:", v81);

    *(_QWORD *)(v21 + 136) = v82;
    v86 = v21;
    specialized Array._endMutation()();
    v83 = v21;
    sub_100008314(0, (unint64_t *)&qword_100059040, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v83);
    objc_msgSend(v79, "activateConstraints:", isa);

    v85.receiver = v1;
    v85.super_class = (Class)type metadata accessor for GroupSessionSystemApertureViewController();
    return objc_msgSendSuper2(&v85, "viewDidLoad");
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_1000081BC()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon));

  return sub_1000082F0(v0 + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext);
}

id sub_100008228()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionSystemApertureViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GroupSessionSystemApertureViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI40GroupSessionSystemApertureViewController);
}

uint64_t sub_1000082F0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_100008314(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_10000834C()
{
  char *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel;
  v2 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v3 = (void *)objc_opt_self(UIFont);
  v4 = objc_msgSend(v3, "systemFontOfSize:weight:", 14.0, UIFontWeightSemibold);
  objc_msgSend(v2, "setFont:", v4);

  *(_QWORD *)&v0[v1] = v2;
  v5 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel;
  v6 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v7 = objc_msgSend(v3, "systemFontOfSize:", 10.0);
  objc_msgSend(v6, "setFont:", v7);

  v8 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  objc_msgSend(v6, "setTextColor:", v8);

  *(_QWORD *)&v0[v5] = v6;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon] = 0;
  v9 = OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon;
  *(_QWORD *)&v0[v9] = sub_100007314();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode] = 1;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext], 0);

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/GroupSessionSystemApertureViewController.swift", 60, 2, 49, 0);
  __break(1u);
}

void sub_100008514(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView, a2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView), "artworkImageView");
    objc_msgSend(v5, "bounds");

    objc_msgSend(v4, "bounds");
    v6 = (void *)objc_opt_self(MRSharedSettings);
    v7 = objc_msgSend(v6, "currentSettings");
    objc_msgSend(v7, "lockScreenAPLRatio");

    v8 = objc_msgSend(v6, "currentSettings");
    objc_msgSend(v8, "lockScreenAPLTarget");

  }
}

void sub_10000863C(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t Strong;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;

  if (v2[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed] == 1)
  {
    sub_100008E58(a1, a2);
  }
  else
  {
    Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView], a2);
    if (Strong)
    {
      v4 = (void *)Strong;
      v5 = (void *)objc_opt_self(UIView);
      objc_msgSend((id)objc_opt_self(MRUIBacklight), "defaultAnimationDuration");
      v7 = v6;
      v8 = swift_allocObject(&unk_100045798, 32, 7);
      *(_QWORD *)(v8 + 16) = v2;
      *(_QWORD *)(v8 + 24) = v4;
      v13[4] = sub_1000098F4;
      v14 = v8;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 1107296256;
      v13[2] = sub_100011C50;
      v13[3] = &unk_1000457B0;
      v9 = _Block_copy(v13);
      v10 = v14;
      v11 = v2;
      v12 = v4;
      swift_release(v10);
      objc_msgSend(v5, "animateWithDuration:animations:", v9, v7);
      _Block_release(v9);

    }
  }
}

void sub_100008780(char a1)
{
  uint64_t v1;
  void *v3;
  CGFloat v4;
  CGFloat v5;
  id v6;
  uint64_t v7;
  CGAffineTransform v8;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) == 1)
  {
    v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) == 0)
    {
      *(_OWORD *)&v8.a = 0x3FF0000000000000uLL;
      v8.c = 0.0;
      v8.d = 1.0;
      *(_OWORD *)&v8.tx = 0uLL;
      v6 = objc_msgSend(v3, "setTransform:", &v8);
      goto LABEL_7;
    }
    v4 = 0.98;
    v5 = 0.98;
  }
  else
  {
    v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    v4 = 0.5;
    v5 = 0.5;
  }
  CGAffineTransformMakeScale(&v8, v4, v5);
  v6 = objc_msgSend(v3, "setTransform:", &v8);
LABEL_7:
  *(_BYTE *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) = a1 & 1;
  sub_10000863C((uint64_t)v6, v7);
}

id sub_10000885C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *Strong;
  void *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGAffineTransform v11;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
  v2 = OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView), "setAlpha:", v3);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView, v4);
  if (Strong)
  {
    v6 = Strong;
    if (*(_BYTE *)(v0 + v2))
      v7 = 1.0;
    else
      v7 = 0.0;
    objc_msgSend(Strong, "setAlpha:", v7);

  }
  if (*(_BYTE *)(v0 + v2) != 1)
  {
    v8 = 0.5;
    v9 = 0.5;
    goto LABEL_13;
  }
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) != 0)
  {
    v8 = 0.98;
    v9 = 0.98;
LABEL_13:
    CGAffineTransformMakeScale(&v11, v8, v9);
    return objc_msgSend(v1, "setTransform:", &v11);
  }
  *(_OWORD *)&v11.a = 0x3FF0000000000000uLL;
  v11.c = 0.0;
  v11.d = 1.0;
  *(_OWORD *)&v11.tx = 0uLL;
  return objc_msgSend(v1, "setTransform:", &v11);
}

id sub_10000897C(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  char *v9;
  char *v10;
  id v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isOnScreen] = 0;
  v9 = &v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_bottomGap];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView], 0);
  v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed] = 0;
  v4[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible] = 0;
  v11 = objc_allocWithZone((Class)MRUArtworkView);
  v12 = v4;
  v13 = objc_msgSend(v11, "init");
  objc_msgSend(v13, "setUseVisualEffectPlaceholder:", 1);
  objc_msgSend(v13, "setStyle:", 3);
  objc_msgSend(v13, "setShowPlaceholder:", 0);
  *(_QWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView] = v13;
  v14 = v13;

  v17.receiver = v12;
  v17.super_class = (Class)type metadata accessor for CoverSheetBackgroundView();
  v15 = objc_msgSendSuper2(&v17, "initWithFrame:", a1, a2, a3, a4);
  objc_msgSend(v15, "addSubview:", v14);
  objc_msgSend(v14, "addObserver:", v15);

  return v15;
}

void sub_100008C30()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __n128 v15;
  double Width;
  double v17;
  double v18;
  double Height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  if ((v0[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap + 8] & 1) == 0
    && (v0[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_bottomGap + 8] & 1) == 0)
  {
    objc_msgSend(v0, "bounds");
    CGRectGetWidth(v25);
    v1 = UIRectInset(objc_msgSend(v0, "bounds"));
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v8 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView];
    v9 = objc_msgSend(v8, "artworkImage");
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "size");
      if (vabdd_f64(1.0, v11 / v12) >= 0.03)
      {
        v28.origin.x = v1;
        v28.origin.y = v3;
        v28.size.width = v5;
        v28.size.height = v7;
        Width = CGRectGetWidth(v28);
        objc_msgSend(v10, "size");
        v18 = Width / v17;
        v29.origin.x = v1;
        v29.origin.y = v3;
        v29.size.width = v5;
        v29.size.height = v7;
        Height = CGRectGetHeight(v29);
        objc_msgSend(v10, "size");
        if (Height / v20 >= v18)
          v21 = v18;
        else
          v21 = Height / v20;
        objc_msgSend(v10, "size");
        v13 = v22 * v21;
        objc_msgSend(v10, "size");
        v24 = v23;

        v15.n128_f64[0] = v21 * v24;
        goto LABEL_14;
      }

    }
    v26.origin.x = v1;
    v26.origin.y = v3;
    v26.size.width = v5;
    v26.size.height = v7;
    v13 = CGRectGetWidth(v26);
    v27.origin.x = v1;
    v27.origin.y = v3;
    v27.size.width = v5;
    v27.size.height = v7;
    v14 = CGRectGetHeight(v27);
    if (v14 < v13)
      v13 = v14;
    v15.n128_f64[0] = v13;
LABEL_14:
    UIRectCenteredRect(0.0, 0.0, v13, v15, v1, v3, v5, v7);
    objc_msgSend(v8, "setFrame:");
  }
}

void sub_100008E58(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  void *Strong;
  void *v5;
  id v6;
  NSString v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  void (*v33)();
  uint64_t v34;

  v3 = v2;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView], a2);
  if (Strong)
  {
    v5 = Strong;
    v6 = objc_msgSend(Strong, "layer");
    v7 = String._bridgeToObjectiveC()();
    v8 = objc_msgSend(v6, "valueForKeyPath:", v7);

    if (v8)
    {
      _bridgeAnyObjectToAny(_:)(&v31, v8);
      swift_unknownObjectRelease(v8);
      sub_100009728((uint64_t)&v31);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      sub_100009728((uint64_t)&v31);

      v9 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
      objc_msgSend(v9, "lockScreenAPLRatio");

      sub_100008514(v10, v11);
      v12 = sub_100009768();
      v6 = objc_msgSend(v5, "layer");
      sub_10000918C(v12);

    }
    v13 = *(void **)&v3[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView];
    v14 = objc_msgSend(v13, "artworkImageView");
    v15 = objc_msgSend(v14, "layer");

    v16 = String._bridgeToObjectiveC()();
    v17 = objc_msgSend(v15, "valueForKeyPath:", v16);

    if (v17)
    {
      _bridgeAnyObjectToAny(_:)(&v31, v17);
      swift_unknownObjectRelease(v17);
      sub_100009728((uint64_t)&v31);

    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      sub_100009728((uint64_t)&v31);

      sub_100008514(v18, v19);
      v20 = sub_100009768();
      v21 = objc_msgSend(v13, "artworkImageView");
      v22 = objc_msgSend(v21, "layer");

      sub_10000918C(v20);
    }
    v23 = (void *)objc_opt_self(UIView);
    objc_msgSend((id)objc_opt_self(MRUIBacklight), "defaultAnimationDuration");
    v25 = v24;
    v26 = swift_allocObject(&unk_100045748, 32, 7);
    *(_QWORD *)(v26 + 16) = v3;
    *(_QWORD *)(v26 + 24) = v5;
    v33 = sub_100009888;
    v34 = v26;
    *(_QWORD *)&v31 = _NSConcreteStackBlock;
    *((_QWORD *)&v31 + 1) = 1107296256;
    *(_QWORD *)&v32 = sub_100011C50;
    *((_QWORD *)&v32 + 1) = &unk_100045760;
    v27 = _Block_copy(&v31);
    v28 = v34;
    v29 = v3;
    v30 = v5;
    swift_release(v28);
    objc_msgSend(v23, "animateWithDuration:animations:", v27, v25);
    _Block_release(v27);

  }
}

void sub_10000918C(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  char *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  Class isa;
  __int128 v10;
  unint64_t v11;

  v3 = objc_msgSend(v1, "filters");
  if (v3)
  {
    v4 = v3;
    v5 = (char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, (char *)&type metadata for Any + 8);

  }
  else
  {
    v5 = (char *)&_swiftEmptyArrayStorage;
  }
  v11 = sub_1000098A8();
  *(_QWORD *)&v10 = a1;
  v6 = a1;
  if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0)
    v5 = sub_10002212C(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
  v8 = *((_QWORD *)v5 + 2);
  v7 = *((_QWORD *)v5 + 3);
  if (v8 >= v7 >> 1)
    v5 = sub_10002212C((char *)(v7 > 1), v8 + 1, 1, v5);
  *((_QWORD *)v5 + 2) = v8 + 1;
  sub_1000098E4(&v10, &v5[32 * v8 + 32]);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  objc_msgSend(v1, "setFilters:", isa, (_QWORD)v10);

}

void sub_1000092B8(uint64_t a1, void *a2)
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  id v6;
  id v7;
  Class isa;
  NSString v9;
  id v10;
  Class v11;
  NSString v12;
  CGAffineTransform v13;

  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) == 1)
  {
    v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) == 0)
    {
      *(_OWORD *)&v13.a = 0x3FF0000000000000uLL;
      v13.c = 0.0;
      v13.d = 1.0;
      *(_OWORD *)&v13.tx = 0uLL;
      objc_msgSend(v3, "setTransform:", &v13);
      goto LABEL_7;
    }
    v4 = 0.98;
    v5 = 0.98;
  }
  else
  {
    v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    v4 = 0.5;
    v5 = 0.5;
  }
  CGAffineTransformMakeScale(&v13, v4, v5);
  objc_msgSend(v3, "setTransform:", &v13);
LABEL_7:
  v6 = objc_msgSend(v3, "artworkImageView");
  v7 = objc_msgSend(v6, "layer");

  isa = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease(*(_QWORD *)&v13.b);
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "setValue:forKeyPath:", isa, v9);

  v10 = objc_msgSend(a2, "layer");
  v11 = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease(*(_QWORD *)&v13.b);
  v12 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setValue:forKeyPath:", v11, v12);

}

void sub_1000094AC(uint64_t a1, void *a2)
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  id v6;
  id v7;
  Class isa;
  NSString v9;
  id v10;
  Class v11;
  NSString v12;
  CGAffineTransform v13;

  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkVisible) == 1)
  {
    v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed) & 1) == 0)
    {
      *(_OWORD *)&v13.a = 0x3FF0000000000000uLL;
      v13.c = 0.0;
      v13.d = 1.0;
      *(_OWORD *)&v13.tx = 0uLL;
      objc_msgSend(v3, "setTransform:", &v13);
      goto LABEL_7;
    }
    v4 = 0.98;
    v5 = 0.98;
  }
  else
  {
    v3 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);
    v4 = 0.5;
    v5 = 0.5;
  }
  CGAffineTransformMakeScale(&v13, v4, v5);
  objc_msgSend(v3, "setTransform:", &v13);
LABEL_7:
  v6 = objc_msgSend(v3, "artworkImageView");
  v7 = objc_msgSend(v6, "layer");

  isa = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease(*(_QWORD *)&v13.b);
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "setValue:forKeyPath:", isa, v9);

  v10 = objc_msgSend(a2, "layer");
  v11 = Float._bridgeToObjectiveC()().super.super.isa;
  v13.a = 0.0;
  v13.b = -2.68156159e154;
  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease(*(_QWORD *)&v13.b);
  v12 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "setValue:forKeyPath:", v11, v12);

}

id sub_1000096A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoverSheetBackgroundView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CoverSheetBackgroundView()
{
  return objc_opt_self(_TtC13MediaRemoteUI24CoverSheetBackgroundView);
}

uint64_t sub_100009728(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CE8(&qword_100059230);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100009768()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  id v4;
  Class isa;
  NSString v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kCAFilterLimitAveragePixelLuminance);
  v1 = v0;
  v2 = objc_allocWithZone((Class)CAFilter);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  v4 = objc_msgSend(v2, "initWithType:", v3);

  isa = Double._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v4, "setValue:forKey:", isa, kCAFilterInputAmount);

  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setName:", v6);

  return v4;
}

uint64_t sub_10000985C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100009888()
{
  uint64_t v0;

  sub_1000092B8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100009890(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000098A0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000098A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059238;
  if (!qword_100059238)
  {
    v1 = objc_opt_self(CAFilter);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059238);
  }
  return result;
}

_OWORD *sub_1000098E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1000098F4()
{
  uint64_t v0;

  sub_1000094AC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_100009A1C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OutputDevicePickerSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OutputDevicePickerSceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI31OutputDevicePickerSceneDelegate);
}

unint64_t sub_100009B04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059338;
  if (!qword_100059338)
  {
    v1 = sub_100008314(255, &qword_100059330, SBUIRemoteAlertButtonAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100059338);
  }
  return result;
}

uint64_t sub_100009B5C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;

  v1 = objc_msgSend(a1, "userInfo");
  if (!v1)
  {
    v16 = 0u;
    v17 = 0u;
LABEL_10:
    sub_100009728((uint64_t)&v16);
    return 0;
  }
  v2 = v1;
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v14 = kMRMediaRemoteMediaControlsConfigurationKey;
  v4 = kMRMediaRemoteMediaControlsConfigurationKey;
  v5 = sub_100006CE8(&qword_100059350);
  v6 = sub_10000A388();
  AnyHashable.init<A>(_:)(v15, &v14, v5, v6);
  if (*(_QWORD *)(v3 + 16) && (v7 = sub_10002CA08((uint64_t)v15), (v8 & 1) != 0))
  {
    sub_10000A4F0(*(_QWORD *)(v3 + 56) + 32 * v7, (uint64_t)&v16);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_10000A478((uint64_t)v15);
  swift_bridgeObjectRelease(v3);
  if (!*((_QWORD *)&v17 + 1))
    goto LABEL_10;
  if ((swift_dynamicCast(v15, &v16, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) == 0)
    return 0;
  v9 = v15[0];
  v10 = v15[1];
  sub_100008314(0, &qword_100059368, NSKeyedUnarchiver_ptr);
  v11 = sub_100008314(0, (unint64_t *)&unk_100059370, MROutputDeviceConfiguration_ptr);
  v13 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v11, v9, v10, v11);
  sub_10000A4AC(v9, v10);
  return v13;
}

void sub_100009D00(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  Class isa;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD aBlock[5];
  uint64_t v23;

  v2 = v1;
  v4 = objc_opt_self(SBSUIRemoteAlertScene);
  v5 = swift_dynamicCastObjCClass(a1, v4);
  if (v5)
  {
    v6 = (void *)v5;
    v21 = a1;
    objc_msgSend(v6, "setDelegate:", v2);
    objc_msgSend(v6, "setAllowsAlertStacking:", 1);
    objc_msgSend(v6, "setAllowsMenuButtonDismissal:", 1);
    objc_msgSend(v6, "setDesiredHardwareButtonEvents:", 16);
    objc_msgSend(v6, "setSwipeDismissalStyle:", 1);
    objc_msgSend(v6, "setDismissalAnimationStyle:", 0);
    sub_100008314(0, (unint64_t *)&qword_100059340, NSNumber_ptr);
    isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
    objc_msgSend(v6, "setSceneDeactivationReason:", isa);

    objc_msgSend(v6, "setOrientationChangedEventsDisabled:", 1);
    v8 = objc_msgSend(v6, "configurationContext");
    if (v8)
    {
      v9 = v8;
      v10 = sub_100009B5C(v8);
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(v9, "xpcEndpoint");
        if (v12)
        {
          v13 = v12;
          v14 = swift_allocObject(&unk_1000457E8, 24, 7);
          *(_QWORD *)(v14 + 16) = v6;
          v15 = objc_allocWithZone((Class)MRUOutputDevicePickerViewController);
          aBlock[4] = sub_10000A338;
          v23 = v14;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_100011C50;
          aBlock[3] = &unk_100045800;
          v16 = _Block_copy(aBlock);
          v17 = v21;
          v18 = objc_msgSend(v15, "initWithConfiguration:endpoint:dismiss:", v11, v13, v16);
          _Block_release(v16);
          swift_release(v23);
          v19 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v6);
          objc_msgSend(v19, "setRootViewController:", v18);
          objc_msgSend(v19, "makeKeyAndVisible");
          v20 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI31OutputDevicePickerSceneDelegate_window);
          *(_QWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI31OutputDevicePickerSceneDelegate_window) = v19;

          swift_unknownObjectRelease(v13);
          return;
        }

        v9 = v11;
      }

    }
    objc_msgSend(v6, "invalidate");

  }
}

void sub_100009FE0(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  void (**v15)(void);
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];

  v2 = a2;
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (a2 < 0)
      v3 = a2;
    else
      v3 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v4 = __CocoaSet.makeIterator()(v3);
    v5 = sub_100008314(0, &qword_100059330, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_100009B04();
    v7 = Set.Iterator.init(_cocoa:)(v35, v4, v5, v6);
    v2 = v35[0];
    v31 = v35[1];
    v8 = v35[2];
    v9 = v35[3];
    v10 = v35[4];
  }
  else
  {
    v11 = -1 << *(_BYTE *)(a2 + 32);
    v31 = a2 + 56;
    v8 = ~v11;
    v12 = -v11;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v10 = v13 & *(_QWORD *)(a2 + 56);
    v7 = (_QWORD *)swift_bridgeObjectRetain(a2);
    v9 = 0;
  }
  v14 = (unint64_t)(v8 + 64) >> 6;
  while (1)
  {
    v17 = v9;
    if (v2 < 0)
    {
      v20 = __CocoaSet.Iterator.next()(v7);
      if (!v20)
        goto LABEL_39;
      v21 = v20;
      v33 = v20;
      v22 = sub_100008314(0, &qword_100059330, SBUIRemoteAlertButtonAction_ptr);
      swift_unknownObjectRetain(v21);
      swift_dynamicCast(&v34, &v33, (char *)&type metadata for Swift.AnyObject + 8, v22, 7);
      v16 = v34;
      swift_unknownObjectRelease(v21);
      if (!v16)
        goto LABEL_39;
      goto LABEL_34;
    }
    if (!v10)
      break;
    v18 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v19 = v18 | (v9 << 6);
LABEL_33:
    v16 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v19);
    if (!v16)
      goto LABEL_39;
LABEL_34:
    if ((objc_msgSend(v16, "events") & 0x10) != 0
      && (v26 = objc_msgSend(a1, "keyWindow")) != 0
      && (v27 = v26,
          v28 = objc_msgSend(v26, "rootViewController"),
          v27,
          v28))
    {
      v29 = objc_opt_self(MRUOutputDevicePickerViewController);
      v30 = (void *)swift_dynamicCastObjCClass(v28, v29);
      if (v30)
      {
        v15 = (void (**)(void))objc_msgSend(v30, "dismissal");
        v15[2]();

        _Block_release(v15);
        v16 = v28;
        goto LABEL_12;
      }

    }
    else
    {
LABEL_12:

    }
  }
  v23 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v23 >= v14)
      goto LABEL_39;
    v24 = *(_QWORD *)(v31 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v17 + 2;
      if (v17 + 2 >= v14)
        goto LABEL_39;
      v24 = *(_QWORD *)(v31 + 8 * v9);
      if (!v24)
      {
        v9 = v17 + 3;
        if (v17 + 3 >= v14)
          goto LABEL_39;
        v24 = *(_QWORD *)(v31 + 8 * v9);
        if (!v24)
        {
          v9 = v17 + 4;
          if (v17 + 4 >= v14)
            goto LABEL_39;
          v24 = *(_QWORD *)(v31 + 8 * v9);
          if (!v24)
          {
            v25 = v17 + 5;
            while (v14 != v25)
            {
              v24 = *(_QWORD *)(v31 + 8 * v25++);
              if (v24)
              {
                v9 = v25 - 1;
                goto LABEL_32;
              }
            }
LABEL_39:
            sub_10000A30C(v2);
            return;
          }
        }
      }
    }
LABEL_32:
    v10 = (v24 - 1) & v24;
    v19 = __clz(__rbit64(v24)) + (v9 << 6);
    goto LABEL_33;
  }
  __break(1u);
}

uint64_t sub_10000A30C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A314()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10000A338()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, "deactivate");
  return objc_msgSend(v1, "invalidate");
}

uint64_t sub_10000A370(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A380(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000A388()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059358;
  if (!qword_100059358)
  {
    v1 = sub_10000A3EC(&qword_100059350);
    sub_10000A430();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100059358);
  }
  return result;
}

uint64_t sub_10000A3EC(uint64_t *a1)
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

unint64_t sub_10000A430()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100058CD0;
  if (!qword_100058CD0)
  {
    type metadata accessor for CFString(255);
    result = swift_getWitnessTable(&unk_100033A2C, v1);
    atomic_store(result, (unint64_t *)&qword_100058CD0);
  }
  return result;
}

uint64_t sub_10000A478(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000A4AC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double sub_10000A52C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  double v4;

  KeyPath = swift_getKeyPath(&unk_100033C00);
  v2 = swift_getKeyPath(&unk_100033C28);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

char *sub_10000A59C(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_class *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  NSString v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  char *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  void *v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v85;
  uint64_t v86;
  uint64_t v87;
  _BYTE v88[216];
  objc_super v89;
  _QWORD v90[28];

  v87 = a2;
  v86 = sub_100006CE8((uint64_t *)&unk_100058B80);
  v4 = *(_QWORD *)(v86 - 8);
  __chkstk_darwin(v86);
  v6 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView;
  v8 = objc_allocWithZone((Class)MRUActivityRouteView);
  v9 = v2;
  v10 = objc_msgSend(v8, "init");
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v2[v7] = v10;
  v11 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel;
  v12 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v9[v11] = v12;
  v13 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView;
  v14 = objc_msgSend(objc_allocWithZone((Class)MRUCAPackageView), "init");
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v9[v13] = v14;
  v15 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel;
  v16 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v9[v15] = v16;
  v17 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel;
  v18 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v9[v17] = v18;
  v19 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton;
  v20 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 0);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v9[v19] = v20;
  v21 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide;
  *(_QWORD *)&v9[v21] = objc_msgSend(objc_allocWithZone((Class)UILayoutGuide), "init");
  *(_QWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint] = 0;
  v22 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOn];
  *(_QWORD *)v22 = 28239;
  *((_QWORD *)v22 + 1) = 0xE200000000000000;
  v23 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOff];
  *(_QWORD *)v23 = 6710863;
  *((_QWORD *)v23 + 1) = 0xE300000000000000;
  v24 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth];
  v90[0] = 0;
  Published.init(initialValue:)(v90, &type metadata for CGFloat);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v24, v6, v86);
  v25 = &v9[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v25 = *(_OWORD *)a1;
  *((_OWORD *)v25 + 1) = v26;
  v27 = *(_OWORD *)(a1 + 80);
  v29 = *(_OWORD *)(a1 + 32);
  v28 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v25 + 5) = v27;
  *((_OWORD *)v25 + 2) = v29;
  *((_OWORD *)v25 + 3) = v28;
  v30 = *(_OWORD *)(a1 + 144);
  v32 = *(_OWORD *)(a1 + 96);
  v31 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v25 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v25 + 9) = v30;
  *((_OWORD *)v25 + 6) = v32;
  *((_OWORD *)v25 + 7) = v31;
  v34 = *(_OWORD *)(a1 + 176);
  v33 = *(_OWORD *)(a1 + 192);
  v35 = *(_OWORD *)(a1 + 160);
  *((_QWORD *)v25 + 26) = *(_QWORD *)(a1 + 208);
  *((_OWORD *)v25 + 11) = v34;
  *((_OWORD *)v25 + 12) = v33;
  *((_OWORD *)v25 + 10) = v35;
  sub_100006D28((_QWORD *)a1);

  v36 = (objc_class *)type metadata accessor for SuggestedRouteSystemApertureView(0);
  v89.receiver = v9;
  v89.super_class = v36;
  v37 = (char *)objc_msgSendSuper2(&v89, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v38 = *(_QWORD *)&v37[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide];
  v39 = v37;
  objc_msgSend(v39, "addLayoutGuide:", v38);
  objc_msgSend(v39, "addSubview:", *(_QWORD *)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView]);
  v86 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton;
  v40 = *(void **)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];
  objc_msgSend(v40, "setPreferredSymbolConfiguration:forImageInState:", *(_QWORD *)(a1 + 96), 0);
  LODWORD(v41) = 1148846080;
  objc_msgSend(v40, "setContentHuggingPriority:forAxis:", 0, v41);
  objc_msgSend(v39, "addSubview:", v40);
  v42 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel;
  v43 = *(void **)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel];
  v44 = (void *)objc_opt_self(UIFont);
  v45 = v43;
  v46 = objc_msgSend(v44, "mru_suggestedRouteActivityTitleFont");
  objc_msgSend(v45, "setFont:", v46);

  v47 = *(void **)&v39[v42];
  v48 = (void *)objc_opt_self(UIColor);
  v49 = v47;
  v50 = objc_msgSend(v48, "whiteColor");
  objc_msgSend(v49, "setTextColor:", v50);

  objc_msgSend(v39, "addSubview:", *(_QWORD *)&v39[v42]);
  v51 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView;
  v52 = *(void **)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
  v53 = (void *)objc_opt_self(MRUAssetsProvider);
  v54 = v52;
  v55 = objc_msgSend(v53, "suggestedRouteWaveformPackageName");
  if (!v55)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v57 = v56;
    v55 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v57);
  }
  v58 = objc_msgSend((id)objc_opt_self(MRUCAPackageAsset), "packageNamed:", v55);

  objc_msgSend(v54, "setAsset:", v58);
  v59 = *(void **)&v39[v51];
  objc_msgSend(v59, "setScale:", 0.3017);
  objc_msgSend(v39, "addSubview:", v59);
  v60 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel;
  v61 = *(id *)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel];
  v62 = objc_msgSend(v44, "mru_suggestedRouteActivityTitleFont");
  objc_msgSend(v61, "setFont:", v62);

  v63 = *(id *)&v39[v60];
  v64 = objc_msgSend(v48, "secondaryLabelColor");
  objc_msgSend(v63, "setTextColor:", v64);

  v65 = *(id *)&v39[v60];
  objc_msgSend(v39, "alpha");
  objc_msgSend(v65, "setAlpha:");

  objc_msgSend(v39, "addSubview:", *(_QWORD *)&v39[v60]);
  v66 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel;
  v67 = *(id *)&v39[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel];
  v68 = objc_msgSend(v44, "mru_suggestedRouteActivitySubtitleFont");
  objc_msgSend(v67, "setFont:", v68);

  v69 = *(id *)&v39[v66];
  v85 = v48;
  v70 = objc_msgSend(v48, "secondaryLabelColor");
  objc_msgSend(v69, "setTextColor:", v70);

  objc_msgSend(v39, "addSubview:", *(_QWORD *)&v39[v66]);
  v71 = objc_allocWithZone((Class)UIColor);
  v72 = v39;
  v73 = objc_msgSend(v71, "initWithWhite:alpha:", 0.01, 1.0);
  objc_msgSend(v72, "setBackgroundColor:", v73);

  v74 = objc_opt_self(MRRouteBannerRequest);
  v75 = v87;
  v76 = swift_dynamicCastObjCClass(v87, v74);
  if (v76)
  {
    v78 = (void *)v76;
    swift_unknownObjectRetain(v75);
    if (objc_msgSend(v78, "bannerType") == (id)1 || objc_msgSend(v78, "bannerType") == (id)4)
    {
      v79 = v86;
      v80 = *(id *)&v39[v86];
      v81 = objc_msgSend(v85, "systemCyanColor");
      v82 = objc_msgSend(v81, "colorWithAlphaComponent:", 0.3);

      objc_msgSend(v80, "setBackgroundColor:", v82);
      v83 = *(void **)&v39[v79];
      objc_msgSend(v83, "setClipsToBounds:", 1);
      objc_msgSend(v83, "_setCornerRadius:", 25.0);
    }
    swift_unknownObjectRelease(v75);
  }
  sub_10000AE58(v77);
  sub_100006E10((uint64_t)v88);
  sub_100006E38((uint64_t)v88, (uint64_t)v90);
  sub_10000BA5C((uint64_t)v90, 0);
  swift_unknownObjectRelease(v75);
  sub_100006E80((_QWORD *)a1);

  return v72;
}

void sub_10000AE58(double a1)
{
  char *v1;
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  Class isa;

  v2 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel];
  LODWORD(a1) = 1148846080;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, a1);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 1, v3);
  v4 = v2;
  LODWORD(v5) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  v6 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v8);
  v99 = *(id *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel];
  v9 = objc_msgSend(v99, "trailingAnchor");
  v10 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];
  v11 = objc_msgSend(v10, "leadingAnchor");
  v12 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -8.0);

  v13 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint] = v12;

  v14 = objc_msgSend(v4, "widthAnchor");
  v15 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide];
  v16 = objc_msgSend(v15, "widthAnchor");
  v17 = objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:multiplier:", v16, 0.5);

  v18 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint] = v17;

  v19 = objc_msgSend(v4, "trailingAnchor");
  v20 = objc_msgSend(v10, "leadingAnchor");
  v21 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -8.0);

  v22 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint] = v21;

  v23 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v24 = swift_allocObject(v23, 208, 7);
  *(_OWORD *)(v24 + 16) = xmmword_100033B70;
  v25 = objc_msgSend(v15, "leadingAnchor");
  v26 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView];
  v27 = objc_msgSend(v26, "trailingAnchor");
  v28 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 8.0);

  *(_QWORD *)(v24 + 32) = v28;
  v29 = objc_msgSend(v15, "trailingAnchor");
  v30 = objc_msgSend(v10, "leadingAnchor");
  v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -8.0);

  *(_QWORD *)(v24 + 40) = v31;
  v32 = objc_msgSend(v26, "heightAnchor");
  v33 = objc_msgSend(v1, "heightAnchor");
  v34 = objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v33, 0.707106781);

  *(_QWORD *)(v24 + 48) = v34;
  v35 = objc_msgSend(v26, "leadingAnchor");
  v36 = objc_msgSend(v1, "leadingAnchor");
  v37 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 12.0);

  *(_QWORD *)(v24 + 56) = v37;
  v38 = objc_msgSend(v26, "centerYAnchor");
  v39 = objc_msgSend(v1, "centerYAnchor");
  v40 = objc_msgSend(v38, "constraintEqualToAnchor:", v39);

  *(_QWORD *)(v24 + 64) = v40;
  v41 = objc_msgSend(v26, "widthAnchor");
  v42 = objc_msgSend(v26, "heightAnchor");
  v43 = objc_msgSend(v41, "constraintEqualToAnchor:", v42);

  *(_QWORD *)(v24 + 72) = v43;
  v44 = objc_msgSend(v10, "leadingAnchor");
  v45 = objc_msgSend(v1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v46 = objc_msgSend(v45, "trailingAnchor");

  v47 = objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:constant:", v46, 8.0);
  *(_QWORD *)(v24 + 80) = v47;
  v48 = objc_msgSend(v10, "trailingAnchor");
  v49 = objc_msgSend(v1, "trailingAnchor");
  v50 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -16.0);

  *(_QWORD *)(v24 + 88) = v50;
  v51 = objc_msgSend(v10, "topAnchor");
  v52 = objc_msgSend(v1, "topAnchor");
  v53 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 17.0);

  *(_QWORD *)(v24 + 96) = v53;
  v54 = objc_msgSend(v10, "bottomAnchor");
  v55 = objc_msgSend(v1, "bottomAnchor");
  v56 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -17.0);

  *(_QWORD *)(v24 + 104) = v56;
  v57 = objc_msgSend(v10, "widthAnchor");
  v58 = objc_msgSend(v10, "heightAnchor");
  v59 = objc_msgSend(v57, "constraintEqualToAnchor:", v58);

  *(_QWORD *)(v24 + 112) = v59;
  v60 = objc_msgSend(v10, "widthAnchor");
  v61 = objc_msgSend(v60, "constraintEqualToConstant:", 50.0);

  *(_QWORD *)(v24 + 120) = v61;
  v62 = objc_msgSend(v4, "_tightBoundingBoxLayoutGuide");
  v63 = objc_msgSend(v62, "topAnchor");

  v64 = objc_msgSend(v1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v65 = objc_msgSend(v64, "bottomAnchor");

  v66 = objc_msgSend(v63, "constraintEqualToAnchor:", v65);
  *(_QWORD *)(v24 + 128) = v66;
  v67 = objc_msgSend(v4, "leadingAnchor");
  v68 = objc_msgSend(v26, "trailingAnchor");
  v69 = objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, 8.0);

  *(_QWORD *)(v24 + 136) = v69;
  v70 = objc_msgSend(v4, "trailingAnchor");
  v71 = objc_msgSend(v6, "leadingAnchor");
  v72 = objc_msgSend(v70, "constraintEqualToAnchor:constant:", v71, -8.0);

  *(_QWORD *)(v24 + 144) = v72;
  v73 = objc_msgSend(v6, "centerYAnchor");
  v74 = objc_msgSend(v4, "centerYAnchor");
  v75 = objc_msgSend(v73, "constraintEqualToAnchor:", v74);

  *(_QWORD *)(v24 + 152) = v75;
  v76 = objc_msgSend(v6, "topAnchor");
  v77 = objc_msgSend(v1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v78 = objc_msgSend(v77, "bottomAnchor");

  v79 = objc_msgSend(v76, "constraintEqualToAnchor:", v78);
  *(_QWORD *)(v24 + 160) = v79;
  v80 = objc_msgSend(v99, "_tightBoundingBoxLayoutGuide");
  v81 = objc_msgSend(v80, "topAnchor");

  v82 = objc_msgSend(v1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
  v83 = objc_msgSend(v82, "bottomAnchor");

  v84 = objc_msgSend(v81, "constraintEqualToAnchor:", v83);
  *(_QWORD *)(v24 + 168) = v84;
  v85 = objc_msgSend(v99, "leadingAnchor");
  v86 = objc_msgSend(v6, "trailingAnchor");
  v87 = objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, 8.0);

  *(_QWORD *)(v24 + 176) = v87;
  v88 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel];
  v89 = objc_msgSend(v88, "leadingAnchor");
  v90 = objc_msgSend(v26, "trailingAnchor");
  v91 = objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, 8.0);

  *(_QWORD *)(v24 + 184) = v91;
  v92 = objc_msgSend(v88, "trailingAnchor");
  v93 = objc_msgSend(v10, "leadingAnchor");
  v94 = objc_msgSend(v92, "constraintEqualToAnchor:constant:", v93, -8.0);

  *(_QWORD *)(v24 + 192) = v94;
  v95 = objc_msgSend(v88, "firstBaselineAnchor");
  v96 = objc_msgSend(v1, "bottomAnchor");
  v97 = objc_msgSend(v95, "constraintEqualToAnchor:constant:", v96, -17.0);

  *(_QWORD *)(v24 + 200) = v97;
  specialized Array._endMutation()();
  v98 = (void *)objc_opt_self(NSLayoutConstraint);
  sub_100006F84();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v24);
  objc_msgSend(v98, "activateConstraints:", isa);

}

void sub_10000BA5C(uint64_t a1, char a2)
{
  _BYTE *v2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  NSString v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSString v15;
  void *v16;
  uint64_t v17;
  NSString v18;
  void *v19;
  uint64_t v20;
  NSString v21;
  int v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  char *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  NSString v44;
  void **v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _BYTE v51[224];

  v5 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint];
  if (v5)
    objc_msgSend(v5, "setActive:", v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112]);
  v6 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint];
  if (v6)
    objc_msgSend(v6, "setActive:", v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112]);
  v7 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint];
  if (v7)
    objc_msgSend(v7, "setActive:", (v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112] & 1) == 0);
  v8 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];
  v9 = &v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  objc_msgSend(v8, "setPreferredSymbolConfiguration:forImageInState:", *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96], 0);
  v10 = *((_QWORD *)v9 + 11);
  swift_bridgeObjectRetain(v10);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  v12 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v11);

  objc_msgSend(v8, "setImage:forState:", v12, 0);
  v13 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel];
  v14 = *((_QWORD *)v9 + 5);
  swift_bridgeObjectRetain(v14);
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v13, "setText:", v15);

  v16 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel];
  v17 = *((_QWORD *)v9 + 16);
  if (v17)
  {
    swift_bridgeObjectRetain(*((_QWORD *)v9 + 16));
    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v16, "setText:", v18);

  v19 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel];
  v20 = *((_QWORD *)v9 + 8);
  if (v20)
  {
    swift_bridgeObjectRetain(*((_QWORD *)v9 + 8));
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v19, "setText:", v21);

  v22 = v9[112];
  sub_100006E38(a1, (uint64_t)v51);
  if (sub_100006F6C((uint64_t)v51) == 1 || (v51[112] & 1) != v22)
  {
    if (v22)
      v23 = 1.0;
    else
      v23 = 0.0;
    v24 = swift_allocObject(&unk_100045838, 32, 7);
    *(_QWORD *)(v24 + 16) = v2;
    *(double *)(v24 + 24) = v23;
    if ((a2 & 1) != 0)
    {
      if (v22)
      {
        v25 = v9[112];
        v26 = v2;
        objc_msgSend(v16, "setMarqueeEnabled:", v25);
        objc_msgSend(v26, "layoutIfNeeded");
      }
      else
      {
        v29 = v2;
      }
      v30 = (void *)objc_opt_self(UIView);
      v31 = swift_allocObject(&unk_100045860, 32, 7);
      *(_QWORD *)(v31 + 16) = sub_10000C404;
      *(_QWORD *)(v31 + 24) = v24;
      v49 = sub_10000C480;
      v50 = v31;
      v45 = _NSConcreteStackBlock;
      v46 = 1107296256;
      v47 = sub_100011C50;
      v48 = &unk_100045878;
      v32 = _Block_copy(&v45);
      v33 = v50;
      swift_retain(v24);
      swift_release(v33);
      v34 = swift_allocObject(&unk_1000458B0, 32, 7);
      *(_BYTE *)(v34 + 16) = v22;
      *(_QWORD *)(v34 + 24) = v2;
      v49 = sub_10000C4DC;
      v50 = v34;
      v45 = _NSConcreteStackBlock;
      v46 = 1107296256;
      v47 = sub_100026418;
      v48 = &unk_1000458C8;
      v35 = _Block_copy(&v45);
      v36 = v50;
      v37 = v2;
      swift_release(v36);
      objc_msgSend(v30, "animateWithDuration:animations:completion:", v32, v35, 0.375);
      _Block_release(v35);
      _Block_release(v32);
      if ((v22 & 1) != 0)
      {
        v28 = *(void **)&v37[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
        goto LABEL_26;
      }
      v39 = swift_allocObject(&unk_100045900, 24, 7);
      *(_QWORD *)(v39 + 16) = v37;
      v49 = sub_10000C538;
      v50 = v39;
      v45 = _NSConcreteStackBlock;
      v46 = 1107296256;
      v47 = sub_100011C50;
      v48 = &unk_100045918;
      v40 = _Block_copy(&v45);
      v41 = v50;
      v42 = v37;
      swift_release(v41);
      objc_msgSend(v30, "animateWithDuration:delay:options:animations:completion:", 0, v40, 0, 0.25, 0.25);
      _Block_release(v40);
      v28 = *(void **)&v42[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
    }
    else
    {
      v27 = v2;
      objc_msgSend(v16, "setAlpha:", v23);
      v28 = *(void **)&v27[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView];
      objc_msgSend(v28, "setAlpha:", v23);
      objc_msgSend(v16, "setMarqueeEnabled:", v9[112]);
      if ((v22 & 1) != 0)
      {
LABEL_26:
        v38 = &OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOn;
LABEL_29:
        v43 = *(_QWORD *)&v2[*v38 + 8];
        swift_bridgeObjectRetain(v43);
        v44 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v43);
        objc_msgSend(v28, "setGlyphState:", v44);
        swift_release(v24);

        return;
      }
    }
    v38 = &OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOff;
    goto LABEL_29;
  }
}

id sub_10000C00C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteSystemApertureView(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C1AC()
{
  return type metadata accessor for SuggestedRouteSystemApertureView(0);
}

uint64_t type metadata accessor for SuggestedRouteSystemApertureView(uint64_t a1)
{
  uint64_t result;

  result = qword_100059418;
  if (!qword_100059418)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SuggestedRouteSystemApertureView);
  return result;
}

void sub_10000C1F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[14];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[7] = "\b";
  v4[8] = "\b";
  v4[9] = "\b";
  v4[10] = &unk_100033BD0;
  v4[11] = &unk_100033BD0;
  v4[12] = &unk_100033BE8;
  sub_10000C29C();
  if (v3 <= 0x3F)
  {
    v4[13] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 14, v4, a1 + 80);
  }
}

void sub_10000C29C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100058A80)
  {
    v0 = type metadata accessor for Published(0, &type metadata for CGFloat);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100058A80);
  }
}

double sub_10000C2F0@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  double v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100033C00);
  v5 = swift_getKeyPath(&unk_100033C28);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = v7;
  *a2 = v7;
  return result;
}

uint64_t sub_10000C36C(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100033C00);
  v5 = swift_getKeyPath(&unk_100033C28);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10000C3E0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_10000C404()
{
  uint64_t v0;
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(double *)(v0 + 24);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel), "setAlpha:", v2);
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView), "setAlpha:", v2);
}

uint64_t sub_10000C45C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C480()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000C4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C4B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000C4B8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_10000C4DC()
{
  uint64_t v0;
  id result;

  if ((*(_BYTE *)(v0 + 16) & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel), "setMarqueeEnabled:", *(unsigned __int8 *)(*(_QWORD *)(v0 + 24)+ OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute+ 112));
  return result;
}

uint64_t sub_10000C514()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10000C538()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "layoutIfNeeded");
}

void sub_10000C550()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v1 = sub_100006CE8((uint64_t *)&unk_100058B80);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView;
  v6 = objc_msgSend(objc_allocWithZone((Class)MRUActivityRouteView), "init");
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v5] = v6;
  v7 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel;
  v8 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v7] = v8;
  v9 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView;
  v10 = objc_msgSend(objc_allocWithZone((Class)MRUCAPackageView), "init");
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v9] = v10;
  v11 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel;
  v12 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v11] = v12;
  v13 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel;
  v14 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v13] = v14;
  v15 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton;
  v16 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 0);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v15] = v16;
  v17 = OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide;
  *(_QWORD *)&v0[v17] = objc_msgSend(objc_allocWithZone((Class)UILayoutGuide), "init");
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint] = 0;
  v18 = &v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOn];
  *(_QWORD *)v18 = 28239;
  *((_QWORD *)v18 + 1) = 0xE200000000000000;
  v19 = &v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageStateNameOff];
  *(_QWORD *)v19 = 6710863;
  *((_QWORD *)v19 + 1) = 0xE300000000000000;
  v20 = &v0[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth];
  v22 = 0;
  Published.init(initialValue:)(&v22, &type metadata for CGFloat);
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v20, v4, v1);

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteSystemApertureView.swift", 52, 2, 193, 0);
  __break(1u);
}

void sub_10000C920(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  id v10;

  v8 = a3;
  v10 = a1;
  v9 = static os_log_type_t.default.getter(v10);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, qword_10005B240, a4, a5, 2, &_swiftEmptyArrayStorage);

}

id sub_10000CA60()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AmbientCompactSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AmbientCompactSceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI27AmbientCompactSceneDelegate);
}

void sub_10000CAE8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id Strong;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = v4;
    v6 = a1;
    v7 = static os_log_type_t.default.getter();
    if (qword_1000589C0 != -1)
      swift_once(&qword_1000589C0, sub_10001E320);
    os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, qword_10005B240, "AmbientCompactScene will connect", 32, 2, &_swiftEmptyArrayStorage);
    if (qword_1000589B0 != -1)
      swift_once(&qword_1000589B0, sub_100014740);
    v8 = qword_10005B1A0;
    KeyPath = swift_getKeyPath(&unk_100033C80);
    v10 = swift_getKeyPath(&unk_100033CA8);
    v18 = 1;
    swift_retain(v8);
    static Published.subscript.setter(&v18, v8, KeyPath, v10);
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_dependency) + 16;
    Strong = (id)swift_unknownObjectWeakLoadStrong(v11, v12);
    if (!Strong)
    {
      v14 = objc_msgSend((id)objc_opt_self(MRUEndpointController), "proactiveEndpointController");
      Strong = objc_msgSend(objc_allocWithZone((Class)MRUNowPlayingController), "initWithEndpointController:", v14);

      swift_unknownObjectWeakAssign(v11, Strong);
    }
    v15 = objc_msgSend(objc_allocWithZone((Class)MRUAmbientCompactNowPlayingViewController), "initWithNowPlayingController:", Strong);

    v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v5);
    objc_msgSend(v16, "setRootViewController:", v15);
    objc_msgSend(v16, "makeKeyAndVisible");
    v17 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = v16;

  }
}

uint64_t sub_10000CD0C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI27AmbientCompactSceneDelegate_window) = 0;

  if (qword_1000589B0 != -1)
    swift_once(&qword_1000589B0, sub_100014740);
  v2 = qword_10005B1A0;
  KeyPath = swift_getKeyPath(&unk_100033C80);
  v4 = swift_getKeyPath(&unk_100033CA8);
  v8 = 0;
  swift_retain(v2);
  v5 = static Published.subscript.setter(&v8, v2, KeyPath, v4);
  v6 = static os_log_type_t.default.getter(v5);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return os_log(_:dso:log:_:_:)(v6, &_mh_execute_header, qword_10005B240, "AmbientCompactScene did disconnect", 34, 2, &_swiftEmptyArrayStorage);
}

float sub_10000CE20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Float v3;
  Swift::Float v4;
  float result;
  int v6;

  v0 = MGGetProductType();
  v1 = v0;
  if (v0 <= 2270970152)
  {
    if (v0 <= 1429914405)
    {
      if (v0 == 502329937)
        goto LABEL_17;
      if (v0 != 1060988941)
        goto LABEL_21;
      goto LABEL_10;
    }
    if (v0 == 1429914406 || v0 == 1721691077)
      goto LABEL_17;
  }
  else
  {
    if (v0 > 3242623366)
    {
      if (v0 == 3242623367)
        goto LABEL_17;
      if (v0 != 3885279870)
      {
        if (v0 != 3645319985)
          goto LABEL_21;
LABEL_17:
        sub_100004C64();
LABEL_18:
        v2 = 1097859072;
        v3 = 15.0;
        goto LABEL_19;
      }
LABEL_10:
      sub_100004C64();
LABEL_11:
      v2 = 1097859072;
      v3 = 5.0;
LABEL_19:
      v4 = 15.0;
      goto LABEL_20;
    }
    if (v0 == 2270970153 || v0 == 2311900306)
      goto LABEL_17;
  }
LABEL_21:
  v6 = sub_100004C64();
  if (v1 == 228444038)
    goto LABEL_18;
  if (v1 == 2159747553)
    goto LABEL_11;
  if (v6)
  {
    v2 = 1103101952;
    v4 = 48.0;
    v3 = 5.0;
  }
  else
  {
    v2 = 1101004800;
    v3 = 5.0;
    v4 = 30.0;
  }
LABEL_20:
  LODWORD(result) = CAFrameRateRange.init(minimum:maximum:preferred:)(v3, v4, (Swift::Float_optional *)v2);
  return result;
}

float sub_10000CFB0()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Float v2;
  Swift::Float v3;
  float result;

  v0 = MGGetProductType();
  if (v0 <= 2159747552)
  {
    if (v0 <= 1060988940)
    {
      if (v0 != 228444038 && v0 != 502329937)
        return CAFrameRateRangeDefault.minimum;
    }
    else
    {
      if (v0 == 1060988941)
        goto LABEL_15;
      if (v0 != 1429914406 && v0 != 1721691077)
        return CAFrameRateRangeDefault.minimum;
    }
    goto LABEL_18;
  }
  if (v0 <= 3242623366)
  {
    if (v0 != 2159747553)
    {
      if (v0 != 2270970153 && v0 != 2311900306)
        return CAFrameRateRangeDefault.minimum;
      goto LABEL_18;
    }
LABEL_15:
    v1 = 1114636288;
    v2 = 60.0;
    v3 = 30.0;
LABEL_19:
    LODWORD(result) = CAFrameRateRange.init(minimum:maximum:preferred:)(v3, v2, (Swift::Float_optional *)v1);
    return result;
  }
  if (v0 == 3242623367 || v0 == 3645319985)
  {
LABEL_18:
    v1 = 1106247680;
    v3 = 15.0;
    v2 = 30.0;
    goto LABEL_19;
  }
  if (v0 == 3885279870)
    goto LABEL_15;
  return CAFrameRateRangeDefault.minimum;
}

uint64_t sub_10000D100(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  char *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  NSString v47;
  void *v48;
  objc_class *v49;
  id v50;
  uint64_t v51;
  void *v52;
  objc_super v53;

  v51 = a1;
  v52 = a3;
  v5 = sub_100006CE8(&qword_1000594D8);
  __chkstk_darwin(v5);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006CE8((uint64_t *)&unk_1000594E0);
  __chkstk_darwin(v8);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MetalContext(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v51 - v16;
  v18 = &v3[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange];
  v19 = v3;
  *(float *)v18 = sub_10000CE20();
  *((_DWORD *)v18 + 1) = v20;
  *((_DWORD *)v18 + 2) = v21;
  v22 = &v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange];
  *(float *)v22 = sub_10000CFB0();
  *((_DWORD *)v22 + 1) = v23;
  *((_DWORD *)v22 + 2) = v24;
  *(_QWORD *)&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer] = 0;
  v25 = swift_unknownObjectWeakInit(&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink], 0);
  v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 0;
  v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed] = 0;
  v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink] = 0;
  static MetalContext.shared.getter(v25);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    v27 = type metadata accessor for Backdrop.ViewConfiguration(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v7, 1, 1, v27);
    v28 = objc_allocWithZone((Class)type metadata accessor for Backdrop.CompositeRenderer(0));
    v29 = (void *)Backdrop.CompositeRenderer.init(context:configuration:)(v15, v7);
    v30 = (void *)objc_opt_self(UIColor);
    v31 = objc_msgSend(v30, "systemGrayColor", v51);
    dispatch thunk of Backdrop.CompositeRenderer.setPlaceholderColor(_:animated:)();

    dispatch thunk of Backdrop.CompositeRenderer.isBehindLyrics.setter(1);
    *(_QWORD *)&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_backdropRenderer] = v29;
    v32 = (void *)objc_opt_self(UIScreen);
    v33 = v29;
    v34 = objc_msgSend(v32, "mainScreen");
    objc_msgSend(v34, "bounds");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    v43 = MetalContext.device.getter();
    v44 = objc_msgSend(objc_allocWithZone((Class)MTKView), "initWithFrame:device:", v43, v36, v38, v40, v42);
    swift_unknownObjectRelease(v43);
    objc_msgSend(v44, "setAutoresizingMask:", 18);
    v45 = objc_msgSend(v44, "layer");
    objc_msgSend(v45, "setAllowsDisplayCompositing:", 0);

    objc_msgSend(v44, "setPaused:", 1);
    objc_msgSend(v44, "setDelegate:", v33);
    *(_QWORD *)&v19[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView] = v44;
    v46 = v44;

    if (a2)
    {
      v47 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(a2);
    }
    else
    {
      v47 = 0;
    }
    v48 = v52;
    v49 = (objc_class *)type metadata accessor for BackdropViewController();
    v53.receiver = v19;
    v53.super_class = v49;
    v50 = objc_msgSendSuper2(&v53, "initWithNibName:bundle:", v47, v48);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    return (uint64_t)v50;
  }
  return result;
}

void sub_10000D64C(char a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  void *Strong;
  uint64_t v6;
  uint64_t v7;
  int v8;
  objc_super v9;

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for BackdropViewController();
  objc_msgSendSuper2(&v9, "viewDidDisappear:", a1 & 1);
  v3 = &v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink];
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink], v4);
  objc_msgSend(Strong, "invalidate");

  v6 = swift_unknownObjectWeakAssign(v3, 0);
  v8 = v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen];
  v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 0;
  if (v8 == 1)
    sub_10000DE78(v6, v7);
}

void sub_10000D7D0(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  os_log_type_t v3;
  NSObject *v4;
  unsigned __int8 *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *Strong;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *log;
  unsigned __int8 *v20;
  int v21;
  char *v22;
  uint64_t v23;

  v2 = OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink;
  if (v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink] != (a1 & 1))
  {
    v3 = static os_log_type_t.default.getter(a1);
    if (qword_1000589C0 != -1)
      swift_once(&qword_1000589C0, sub_10001E320);
    v4 = qword_10005B240;
    v5 = v1;
    if (os_log_type_enabled(v4, v3))
    {
      v6 = v5;
      v7 = swift_slowAlloc(18, -1);
      v20 = v5;
      v8 = swift_slowAlloc(8, -1);
      *(_DWORD *)v7 = 138412546;
      v22 = v6;
      log = v4;
      v9 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
      v10 = (_QWORD *)v8;
      v5 = v20;
      *v10 = v6;

      *(_WORD *)(v7 + 12) = 1024;
      LODWORD(v6) = v1[v2];

      v21 = (int)v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);

      _os_log_impl((void *)&_mh_execute_header, log, v3, "%@ update shouldBlockDisplayLink:%{BOOL}d", (uint8_t *)v7, 0x12u);
      v11 = sub_100006CE8(&qword_10005A4F0);
      swift_arrayDestroy(v10, 1, v11);
      swift_slowDealloc(v10, -1, -1);
      v12 = swift_slowDealloc(v7, -1, -1);
    }
    else
    {

    }
    if (v1[v2] == 1)
    {
      v14 = (char *)&v5[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink];
      Strong = (void *)swift_unknownObjectWeakLoadStrong(&v5[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink], v13);
      objc_msgSend(Strong, "invalidate");

      swift_unknownObjectWeakAssign(v14, 0);
      v16 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView], "layer");
      v17 = objc_opt_self(CAMetalLayer);
      v18 = (void *)swift_dynamicCastObjCClass(v16, v17);
      if (!v18)

      objc_msgSend(v18, "removeBackBuffers", log);
    }
    else if (v5[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] == 1)
    {
      sub_10000E37C(v12, v13);
    }
  }
}

uint64_t sub_10000DA60()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink);
}

uint64_t sub_10000DA70(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *Strong;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;

  if (result)
  {
    v3 = v2;
    v5 = result;
    if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) == 1
      && (*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) & 1) == 0)
    {
      v6 = OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer;
      objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer), "invalidate");
      Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink, v7);
      if (Strong)
      {
        v12 = Strong;
        LODWORD(v9) = *(_DWORD *)(v3
                                + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange);
        LODWORD(v10) = *(_DWORD *)(v3
                                 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange
                                 + 4);
        LODWORD(v11) = *(_DWORD *)(v3
                                 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange
                                 + 8);
        objc_msgSend(Strong, "setPreferredFrameRateRange:", v9, v10, v11);

      }
      sub_10000E5A0();
      v13 = (void *)static OS_dispatch_queue.main.getter();
      v14 = swift_allocObject(&unk_1000459A8, 24, 7);
      swift_unknownObjectWeakInit(v14 + 16, v3);
      v15 = objc_allocWithZone((Class)MSVTimer);
      v20[4] = sub_10000E6D8;
      v21 = v14;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 1107296256;
      v20[2] = sub_100011C50;
      v20[3] = &unk_1000459C0;
      v16 = _Block_copy(v20);
      v17 = v21;
      swift_retain(v14);
      swift_release(v17);
      v18 = objc_msgSend(v15, "initWithInterval:repeats:queue:block:", 0, v13, v16, 1.0);

      _Block_release(v16);
      swift_release(v14);
      v19 = *(void **)(v3 + v6);
      *(_QWORD *)(v3 + v6) = v18;

    }
    result = dispatch thunk of Backdrop.CompositeRenderer.setImage(_:animated:)(v5, a2 & 1);
    if (*(_BYTE *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) == 1)
      return sub_10000DFF8();
  }
  return result;
}

void sub_10000DC4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *Strong;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  _BYTE v16[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v16, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v1, v2);
  if (Strong)
  {
    v4 = *(_DWORD *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange];
    v5 = *(_DWORD *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 4];
    v6 = *(_DWORD *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 8];

    swift_beginAccess(v1, &v15, 0, 0);
    v8 = swift_unknownObjectWeakLoadStrong(v1, v7);
    if (v8)
    {
      v10 = (void *)v8;
      v11 = (void *)swift_unknownObjectWeakLoadStrong(v8 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink, v9);

      LODWORD(v12) = v4;
      LODWORD(v13) = v5;
      LODWORD(v14) = v6;
      objc_msgSend(v11, "setPreferredFrameRateRange:", v12, v13, v14);

    }
  }
}

void sub_10000DD74(uint64_t a1)
{
  unsigned __int8 *v1;
  void *v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for BackdropViewController();
  objc_msgSendSuper2(&v8, "traitCollectionDidChange:", a1);
  v3 = (void *)objc_opt_self(MRUIBacklight);
  v4 = objc_msgSend(v1, "traitCollection");
  v5 = objc_msgSend(v3, "shouldUseTimelinesForTraitCollection:", v4);

  if (v5 != v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed])
  {
    v1[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed] = v5;
    sub_10000DE78(v6, v7);
  }
}

void sub_10000DE78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink, a2);
  if (Strong)
  {
    v4 = Strong;
    if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) == 1)
      v5 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed);
    else
      v5 = 1;
    objc_msgSend(Strong, "setPaused:", v5);

  }
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) & 1) != 0)
  {
    if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) == 1)
      sub_10000DFF8();
  }
  else
  {
    v6 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView);
    v7 = objc_msgSend(v6, "layer");
    v8 = objc_opt_self(CAMetalLayer);
    v9 = (void *)swift_dynamicCastObjCClass(v7, v8);
    if (!v9)

    objc_msgSend(v9, "discardContents");
    v10 = objc_msgSend(v6, "layer");
    v11 = objc_opt_self(CAMetalLayer);
    v12 = (void *)swift_dynamicCastObjCClass(v10, v11);
    v13 = v12;
    if (!v12)
    {

      v12 = 0;
    }
    objc_msgSend(v12, "removeBackBuffers");

  }
}

uint64_t sub_10000DFF8()
{
  char *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint64_t v37;

  v1 = v0;
  v32 = type metadata accessor for DispatchWorkItemFlags(0);
  v35 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchTimeInterval(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30 = type metadata accessor for DispatchTime(0);
  v11 = *(_QWORD *)(v30 - 8);
  v12 = __chkstk_darwin(v30);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v30 - v15;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView], "draw");
  sub_10000E5A0();
  v31 = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  *v10 = 1100;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for DispatchTimeInterval.milliseconds(_:), v7);
  + infix(_:_:)(v14, v10);
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
  v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18 = v30;
  v17(v14, v30);
  v19 = swift_allocObject(&unk_100045958, 24, 7);
  *(_QWORD *)(v19 + 16) = v0;
  aBlock[4] = sub_10000E600;
  v37 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011C50;
  aBlock[3] = &unk_100045970;
  v20 = _Block_copy(aBlock);
  v21 = v37;
  v22 = v1;
  v23 = swift_release(v21);
  static DispatchQoS.unspecified.getter(v23);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v24 = sub_10000E620();
  v25 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v26 = sub_10000E668();
  v27 = v32;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v32, v24);
  v28 = (void *)v31;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v16, v6, v3, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v3, v27);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v34);
  return ((uint64_t (*)(char *, uint64_t))v17)(v16, v18);
}

void sub_10000E2DC(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed) == 1)
  {
    v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                               + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_metalView), "layer"));
    v2 = objc_opt_self(CAMetalLayer);
    v3 = (void *)swift_dynamicCastObjCClass(v1, v2);
    v4 = v3;
    if (!v3)
    {

      v3 = 0;
    }
    objc_msgSend(v3, "removeBackBuffers");

  }
}

void sub_10000E37C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *Strong;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;

  v3 = v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink, a2);
  objc_msgSend(Strong, "invalidate");

  swift_unknownObjectWeakAssign(v3, 0);
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink) & 1) == 0)
  {
    v5 = objc_msgSend((id)objc_opt_self(CADisplayLink), "displayLinkWithTarget:selector:", v2, "displayLinkFiredWithSender:");
    if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen) == 1)
      v6 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed);
    else
      v6 = 1;
    v11 = v5;
    objc_msgSend(v5, "setPaused:", v6);
    LODWORD(v7) = *(_DWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange);
    LODWORD(v8) = *(_DWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 4);
    LODWORD(v9) = *(_DWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange + 8);
    objc_msgSend(v11, "setPreferredFrameRateRange:", v7, v8, v9);
    v10 = objc_msgSend((id)objc_opt_self(NSRunLoop), "currentRunLoop");
    objc_msgSend(v11, "addToRunLoop:forMode:", v10, NSDefaultRunLoopMode);

    swift_unknownObjectWeakAssign(v3, v11);
  }
}

id sub_10000E4F8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackdropViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BackdropViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI22BackdropViewController);
}

unint64_t sub_10000E5A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059EC0;
  if (!qword_100059EC0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059EC0);
  }
  return result;
}

uint64_t sub_10000E5DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E600()
{
  uint64_t v0;

  sub_10000E2DC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000E608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E618(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000E620()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A670;
  if (!qword_10005A670)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10005A670);
  }
  return result;
}

unint64_t sub_10000E668()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A680;
  if (!qword_10005A680)
  {
    v1 = sub_10000A3EC((uint64_t *)&unk_100059E50);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005A680);
  }
  return result;
}

uint64_t sub_10000E6B4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E6D8()
{
  uint64_t v0;

  sub_10000DC4C(v0);
}

void sub_10000E6E0()
{
  _BYTE *v0;
  char *v1;
  int v2;
  int v3;
  char *v4;
  int v5;
  int v6;

  v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredFrameRateRange];
  *(float *)v1 = sub_10000CE20();
  *((_DWORD *)v1 + 1) = v2;
  *((_DWORD *)v1 + 2) = v3;
  v4 = &v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_preferredTransitionFrameRateRange];
  *(float *)v4 = sub_10000CFB0();
  *((_DWORD *)v4 + 1) = v5;
  *((_DWORD *)v4 + 2) = v6;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_artworkTransitionTimer] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_displayLink], 0);
  v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isOnScreen] = 0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_isDimmed] = 0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/BackdropViewController.swift", 42, 2, 50, 0);
  __break(1u);
}

id sub_10000E8F4()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id result;
  objc_super v11;

  v1 = v0;
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  objc_msgSendSuper2(&v11, "viewDidLoad");
  v2 = objc_msgSend(v0, "view");
  if (!v2)
    goto LABEL_9;
  v3 = v2;
  v4 = type metadata accessor for CoverSheetBackgroundView();
  v5 = swift_dynamicCastClass(v3, v4);
  if (!v5)
    goto LABEL_8;
  v6 = *(id *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);

  objc_msgSend(v6, "addObserver:", v1);
  v7 = objc_opt_self(MRUIBacklight);
  v8 = objc_msgSend(v1, "traitCollection");
  LOBYTE(v7) = objc_msgSend((id)v7, "shouldUseTimelinesForTraitCollection:", v8);

  if ((v7 & 1) == 0)
    return sub_10000F33C();
  v9 = objc_msgSend(v1, "view");
  if (v9)
  {
    v3 = v9;
    if (swift_dynamicCastClass(v9, v4))
    {
      sub_100008780(1);

      return sub_10000F33C();
    }
LABEL_8:

  }
LABEL_9:
  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000EAB0(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[24];
  _QWORD v39[5];
  objc_super v40;

  v2 = v1;
  v4 = sub_100006CE8(&qword_100059660);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v34 - v8;
  v10 = sub_100006CE8(&qword_100059550);
  v35 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006CE8(&qword_100059558);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (objc_class *)type metadata accessor for CoverSheetBackgroundViewController();
  v40.receiver = v2;
  v40.super_class = v17;
  objc_msgSendSuper2(&v40, "viewWillAppear:", a1 & 1);
  v18 = objc_msgSend(v2, "view");
  if (!v18)
    goto LABEL_7;
  v19 = v18;
  v20 = type metadata accessor for CoverSheetBackgroundView();
  v21 = swift_dynamicCastClass(v19, v20);
  if (!v21)
  {

LABEL_7:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
    __break(1u);
    return result;
  }
  v36 = v14;
  v37 = v13;
  *(_BYTE *)(v21 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isOnScreen) = 1;

  if (qword_1000589B0 != -1)
    swift_once(&qword_1000589B0, sub_100014740);
  v22 = qword_10005B1A0;
  swift_beginAccess(qword_10005B1A0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientSceneActive, v39, 33, 0);
  v23 = sub_100006CE8((uint64_t *)&unk_100059560);
  ((void (*)(void))Published.projectedValue.getter)();
  swift_endAccess(v39);
  swift_beginAccess(v22 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientCompactSceneActive, v39, 33, 0);
  Published.projectedValue.getter(v23);
  swift_endAccess(v39);
  v24 = sub_10000FA94(&qword_100059690, &qword_100059660, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  Publishers.CombineLatest.init(_:_:)(v9, v7, v4, v4, v24, v24);
  v25 = sub_10000FA94(&qword_100059570, &qword_100059550, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest<A, B>);
  Publisher.map<A>(_:)(sub_10000FA28, 0, v10, &type metadata for Bool, v25);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v10);
  KeyPath = swift_getKeyPath(&unk_100033D38);
  v39[0] = *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController];
  v27 = (void *)v39[0];
  v28 = sub_10000FA94(&qword_100059578, &qword_100059558, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v29 = v27;
  v30 = v37;
  v31 = Publisher<>.assign<A>(to:on:)(KeyPath, v39, v37, v28);

  swift_release(KeyPath);
  v39[3] = type metadata accessor for AnyCancellable(0);
  v39[4] = &protocol witness table for AnyCancellable;
  v39[0] = v31;
  v32 = (uint64_t)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable];
  swift_beginAccess(v32, v38, 33, 0);
  sub_10000F9E0((uint64_t)v39, v32);
  swift_endAccess(v38);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v16, v30);
}

uint64_t sub_10000EED0(char a1)
{
  char *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _BYTE v9[24];
  _OWORD v10[2];
  uint64_t v11;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  objc_msgSendSuper2(&v12, "viewDidDisappear:", a1 & 1);
  v3 = objc_msgSend(v1, "view");
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for CoverSheetBackgroundView();
    v6 = swift_dynamicCastClass(v4, v5);
    if (v6)
    {
      *(_BYTE *)(v6 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isOnScreen) = 0;

      v11 = 0;
      memset(v10, 0, sizeof(v10));
      v7 = (uint64_t)&v1[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable];
      swift_beginAccess(&v1[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable], v9, 33, 0);
      sub_10000F9E0((uint64_t)v10, v7);
      return swift_endAccess(v9);
    }

  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000F01C(uint64_t a1, uint64_t a2)
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

void sub_10000F17C(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  objc_msgSendSuper2(&v12, "traitCollectionDidChange:", a1);
  v3 = (void *)objc_opt_self(MRUIBacklight);
  v4 = objc_msgSend(v1, "traitCollection");
  v5 = objc_msgSend(v3, "shouldUseTimelinesForTraitCollection:", v4);

  v6 = objc_msgSend(v1, "view");
  if (!v6)
    goto LABEL_9;
  v7 = v6;
  v8 = type metadata accessor for CoverSheetBackgroundView();
  v9 = swift_dynamicCastClass(v7, v8);
  if (!v9)
    goto LABEL_8;
  v10 = *(unsigned __int8 *)(v9 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_isDimmed);

  if (v5 == v10)
    return;
  v11 = objc_msgSend(v1, "view");
  if (!v11)
  {
LABEL_9:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
    __break(1u);
    return;
  }
  v7 = v11;
  if (!swift_dynamicCastClass(v11, v8))
  {
LABEL_8:

    goto LABEL_9;
  }
  sub_100008780(v5);

}

id sub_10000F33C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *Strong;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id result;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController];
  objc_msgSend(v1, "addChildViewController:", v2);
  v3 = objc_msgSend(v1, "view");
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for CoverSheetBackgroundView();
    v6 = swift_dynamicCastClass(v4, v5);
    if (v6)
    {
      v7 = (char *)v6;
      v8 = objc_msgSend(v2, "view");
      v9 = &v7[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView];
      Strong = (void *)swift_unknownObjectWeakLoadStrong(&v7[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView], v10);
      swift_unknownObjectWeakAssign(v9, v8);
      objc_msgSend(Strong, "removeFromSuperview");
      v13 = swift_unknownObjectWeakLoadStrong(v9, v12);
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v7, "insertSubview:atIndex:", v13, 0);

        Strong = v8;
        v8 = v14;
      }

      v15 = objc_msgSend(v1, "view");
      if (!v15)
        goto LABEL_9;
      v4 = v15;
      v16 = swift_dynamicCastClass(v15, v5);
      if (v16)
      {
        v17 = *(id *)(v16 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView);

        v18 = objc_msgSend(v17, "artworkImage");
        sub_10000DA70((uint64_t)v18, 0);

        return objc_msgSend(v2, "didMoveToParentViewController:", v1);
      }
    }

  }
LABEL_9:
  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
  __break(1u);
  return result;
}

void sub_10000F534(double a1, double a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if ((v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap + 8] & 1) == 0
    && (v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap + 8] & 1) == 0
    && (v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap + 8] & 1) == 0)
  {
    v5 = *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap];
    v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap];
    v7 = *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap];
    v8 = objc_msgSend(v2, "view");
    v14 = v8;
    if (a1 >= a2)
    {
      if (v8)
      {
        v12 = type metadata accessor for CoverSheetBackgroundView();
        v10 = swift_dynamicCastClass(v14, v12);
        if (v10)
        {
          v11 = v10 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap;
          *(_QWORD *)(v10 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap) = v5;
          goto LABEL_12;
        }
        goto LABEL_13;
      }
    }
    else if (v8)
    {
      v9 = type metadata accessor for CoverSheetBackgroundView();
      v10 = swift_dynamicCastClass(v14, v9);
      if (v10)
      {
        v11 = v10 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap;
        *(_QWORD *)(v10 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_topGap) = v6;
LABEL_12:
        *(_BYTE *)(v11 + 8) = 0;
        v13 = v10 + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_bottomGap;
        *(_QWORD *)v13 = v7;
        *(_BYTE *)(v13 + 8) = 0;
        sub_100008C30();

        return;
      }
LABEL_13:

    }
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "MediaRemoteUI/CoverSheetBackgroundViewController.swift", 54, 2, 21, 0);
    __break(1u);
  }
}

id sub_10000F6E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CoverSheetBackgroundViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CoverSheetBackgroundViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI34CoverSheetBackgroundViewController);
}

uint64_t sub_10000F97C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_10000F9A0()
{
  uint64_t v0;

  sub_10000F534(*(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_10000F9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F9D8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CE8((uint64_t *)&unk_100059540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_BYTE *sub_10000FA28@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = (*result | result[1]) & 1;
  return result;
}

_QWORD *sub_10000FA40@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink);
  return result;
}

void sub_10000FA5C(char *a1, _QWORD *a2)
{
  char v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *(unsigned __int8 *)(*a2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink);
  *(_BYTE *)(*a2 + OBJC_IVAR____TtC13MediaRemoteUI22BackdropViewController_shouldBlockDisplayLink) = v2;
  sub_10000D7D0(v3);
}

uint64_t sub_10000FA94(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000A3EC(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000FAD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CE8((uint64_t *)&unk_100059540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000FB14()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  unsigned int v8;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  _BYTE v20[16];

  v1 = v0;
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = &v20[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin();
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = objc_msgSend(v1, "routeType");
  if (v8 == 11 || v8 == 8)
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1);
    v11 = 0xD00000000000001BLL;
    v10 = 0x800000010003A050;
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1);
    v10 = 0x800000010003A030;
    v11 = 0xD000000000000018;
  }
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v11);
  v12 = objc_msgSend(v1, "hostDisplayName");
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v16);
  swift_bridgeObjectRelease(v15);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v17);
  v18 = String.LocalizationValue.init(stringInterpolation:)(v7);
  static Locale.current.getter(v18);
  return String.init(localized:table:bundle:locale:comment:)(v5, 0, 0, 0, v3, 0, 0, 256);
}

uint64_t sub_10000FD4C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  unsigned int v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE v12[16];

  v1 = v0;
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = objc_msgSend(v1, "routeType");
  if (v6 == 11 || v6 == 8)
  {
    v9 = 0xD00000000000001BLL;
    v8 = 0x800000010003A010;
  }
  else
  {
    v8 = 0x8000000100039FF0;
    v9 = 0xD000000000000018;
  }
  v10 = String.LocalizationValue.init(stringLiteral:)(v9, v8);
  static Locale.current.getter(v10);
  return String.init(localized:table:bundle:locale:comment:)(v5, 0, 0, 0, v3, 0, 0, 256);
}

int64x2_t sub_10000FE70()
{
  int64x2_t result;

  result = vdupq_n_s64(0x4062C00000000000uLL);
  xmmword_10005B170 = (__int128)result;
  return result;
}

id sub_10000FE88()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (**v4)(char *, char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  objc_class *v19;
  id result;
  void *v21;
  void *v22;
  void (**v23)(char *, char *, char *);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void (**v28)(char *, char *, char *);
  id v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  char *v33;
  uint64_t v34;
  uint64_t (**v35)(char *, char *);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSString v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  NSString v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  Class isa;
  void (*v83)(char *, char *, char *);
  id v84;
  uint64_t (**v85)(char *, char *);
  char *v86;
  char *v87;
  char *v88;
  _QWORD aBlock[5];
  uint64_t v90;
  char v91[24];
  objc_super v92;

  v1 = v0;
  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v4 = (uint64_t (**)(char *, char *))((char *)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v5);
  v88 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006CE8(&qword_1000595F8);
  __chkstk_darwin(v10);
  v12 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for URL(0);
  v14 = *(char **)(v13 - 8);
  v15 = *((_QWORD *)v14 + 8);
  v16 = __chkstk_darwin(v13);
  v87 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v18 = (char *)&v83 - v17;
  v19 = (objc_class *)type metadata accessor for ProximityCardViewController(0);
  v92.receiver = v1;
  v92.super_class = v19;
  result = objc_msgSendSuper2(&v92, "viewDidLoad");
  v21 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName + 8];
  if (v21)
  {
    v22 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image];
    if (v22)
    {
      v84 = *(id *)&v1[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName];
      v85 = v4;
      v23 = (void (**)(char *, char *, char *))v14;
      v24 = v13;
      v25 = &v1[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];
      swift_beginAccess(&v1[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url], v91, 0, 0);
      v26 = (uint64_t)v25;
      v27 = (char *)v24;
      v28 = v23;
      sub_100010D50(v26, (uint64_t)v12);
      if (((unsigned int (*)(char *, uint64_t, char *))v23[6])(v12, 1, v27) == 1)
      {
        return (id)sub_100010D98((uint64_t)v12);
      }
      else
      {
        v83 = v23[4];
        v86 = v18;
        v83(v18, v12, v27);
        swift_bridgeObjectRetain(v21);
        v29 = v22;
        objc_msgSend(v1, "setDismissalType:", 3);
        String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(34, 1);
        v30._object = (void *)0x800000010003A110;
        v30._countAndFlagsBits = 0xD000000000000022;
        String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v30);
        v31._countAndFlagsBits = (uint64_t)v84;
        v31._object = v21;
        String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v31);
        swift_bridgeObjectRelease(v21);
        v32._countAndFlagsBits = 0;
        v32._object = (void *)0xE000000000000000;
        String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v32);
        v33 = v88;
        v34 = String.LocalizationValue.init(stringInterpolation:)(v9);
        v35 = v85;
        static Locale.current.getter(v34);
        String.init(localized:table:bundle:locale:comment:)(v33, 0, 0, 0, v35, 0, 0, 256);
        v36 = v27;
        v38 = v37;
        v39 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v38);
        objc_msgSend(v1, "setTitle:", v39);

        v40 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000024, 0x800000010003A140);
        static Locale.current.getter(v40);
        String.init(localized:table:bundle:locale:comment:)(v33, 0, 0, 0, v35, 0, 0, 256);
        v42 = v41;
        v43 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v42);
        objc_msgSend(v1, "setSubtitle:", v43);

        v44 = objc_msgSend(objc_allocWithZone((Class)PRXImageView), "initWithStyle:", 0);
        objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v44, "setContentMode:", 1);
        v84 = v29;
        objc_msgSend(v44, "setImage:", v29);
        v45 = objc_msgSend(v1, "contentView");
        objc_msgSend(v45, "addSubview:", v44);

        v46 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, 0x800000010003A170);
        static Locale.current.getter(v46);
        String.init(localized:table:bundle:locale:comment:)(v33, 0, 0, 0, v35, 0, 0, 256);
        v48 = v47;
        v49 = v87;
        v28[2](v87, v86, v36);
        v50 = *((unsigned __int8 *)v28 + 80);
        v51 = (v50 + 24) & ~v50;
        v52 = swift_allocObject(&unk_100045A48, v51 + v15, v50 | 7);
        *(_QWORD *)(v52 + 16) = v1;
        v88 = v36;
        v83((char *)(v52 + v51), v49, v36);
        v53 = v1;
        v54 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v48);
        aBlock[4] = sub_100010E4C;
        v90 = v52;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100010784;
        aBlock[3] = &unk_100045A60;
        v55 = _Block_copy(aBlock);
        v56 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v54, 0, v55);

        _Block_release(v55);
        swift_release(v90);

        v87 = (char *)objc_opt_self(NSLayoutConstraint);
        v57 = sub_100006CE8((uint64_t *)&unk_100058CB0);
        v58 = swift_allocObject(v57, 72, 7);
        *(_OWORD *)(v58 + 16) = xmmword_100033D60;
        v59 = objc_msgSend(v44, "centerXAnchor");
        v60 = objc_msgSend(v53, "contentView");
        v85 = (uint64_t (**)(char *, char *))v28;
        v61 = objc_msgSend(v60, "mainContentGuide");

        v62 = objc_msgSend(v61, "centerXAnchor");
        v63 = objc_msgSend(v59, "constraintEqualToAnchor:", v62);

        *(_QWORD *)(v58 + 32) = v63;
        v64 = objc_msgSend(v44, "centerYAnchor");
        v65 = objc_msgSend(v53, "contentView");
        v66 = objc_msgSend(v65, "mainContentGuide");

        v67 = objc_msgSend(v66, "centerYAnchor");
        v68 = objc_msgSend(v64, "constraintEqualToAnchor:", v67);

        *(_QWORD *)(v58 + 40) = v68;
        v69 = objc_msgSend(v44, "topAnchor");
        v70 = objc_msgSend(v53, "contentView");
        v71 = objc_msgSend(v70, "mainContentGuide");

        v72 = objc_msgSend(v71, "topAnchor");
        v73 = objc_msgSend(v69, "constraintGreaterThanOrEqualToAnchor:", v72);

        *(_QWORD *)(v58 + 48) = v73;
        v74 = objc_msgSend(v44, "bottomAnchor");
        v75 = objc_msgSend(v53, "contentView");
        v76 = objc_msgSend(v75, "mainContentGuide");

        v77 = objc_msgSend(v76, "bottomAnchor");
        v78 = objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:", v77);

        *(_QWORD *)(v58 + 56) = v78;
        v79 = objc_msgSend(v44, "heightAnchor");
        if (qword_1000589A0 != -1)
          swift_once(&qword_1000589A0, sub_10000FE70);
        v80 = objc_retainAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToConstant:", *((double *)&xmmword_10005B170
                                                                                                 + 1)));

        *(_QWORD *)(v58 + 64) = v80;
        aBlock[0] = v58;
        specialized Array._endMutation()();
        v81 = aBlock[0];
        sub_100006F84();
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v81);
        objc_msgSend(v87, "activateConstraints:", isa);

        return (id)v85[1](v86, v88);
      }
    }
  }
  return result;
}

void sub_100010784(uint64_t a1, void *a2)
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

void sub_100010810(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    v3 = static os_log_type_t.error.getter();
    if (qword_1000589C0 != -1)
      swift_once(&qword_1000589C0, sub_10001E320);
    v4 = qword_10005B240;
    v5 = v3;
    if (os_log_type_enabled((os_log_t)qword_10005B240, v3))
    {
      swift_errorRetain(a2);
      swift_errorRetain(a2);
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v6 = 138412290;
      swift_errorRetain(a2);
      v8 = _swift_stdlib_bridgeErrorToNSError(a2);
      v10 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
      *v7 = v8;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to open application with error: %@", v6, 0xCu);
      v9 = sub_100006CE8(&qword_10005A4F0);
      swift_arrayDestroy(v7, 1, v9);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }
  }
}

void sub_100010988(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

id sub_100010A98()
{
  return sub_100010D00(0, (uint64_t (*)(void))type metadata accessor for ProximityCardViewController);
}

uint64_t sub_100010AF4()
{
  return type metadata accessor for ProximityCardViewController(0);
}

uint64_t type metadata accessor for ProximityCardViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000595B8;
  if (!qword_1000595B8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ProximityCardViewController);
  return result;
}

void sub_100010B38(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_100033DB0;
  v4[1] = &unk_100033DC8;
  sub_100010BB8(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

void sub_100010BB8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000595C8)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000595C8);
  }
}

id sub_100010CF4(uint64_t a1)
{
  return sub_100010D00(a1, type metadata accessor for ProximityCardRootViewController);
}

id sub_100010D00(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for ProximityCardRootViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI31ProximityCardRootViewController);
}

uint64_t sub_100010D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CE8(&qword_1000595F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010D98(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CE8(&qword_1000595F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010DD8()
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
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100010E4C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  sub_100010E90(v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_100010E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010E88(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100010E90(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Class isa;
  id v14;
  void *v15;
  void **aBlock;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  _BYTE v22[248];

  v2 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (id)SBSCreateOpenApplicationService();
    v5 = sub_100006CE8((uint64_t *)&unk_100059600);
    inited = swift_initStackObject(v5, v22);
    *(_OWORD *)(inited + 16) = xmmword_100033D70;
    aBlock = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPayloadURL);
    v17 = v7;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), &aBlock, &type metadata for String, &protocol witness table for String);
    v8 = type metadata accessor for URL(0);
    *(_QWORD *)(inited + 96) = v8;
    v9 = sub_1000110D8((_QWORD *)(inited + 72));
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v9, a1, v8);
    aBlock = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice);
    v17 = v10;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 104), &aBlock, &type metadata for String, &protocol witness table for String);
    *(_QWORD *)(inited + 168) = &type metadata for Bool;
    *(_BYTE *)(inited + 144) = 1;
    aBlock = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice);
    v17 = v11;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 176), &aBlock, &type metadata for String, &protocol witness table for String);
    *(_QWORD *)(inited + 240) = &type metadata for Bool;
    *(_BYTE *)(inited + 216) = 1;
    v12 = sub_10002B620(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    v14 = objc_msgSend((id)objc_opt_self(FBSOpenApplicationOptions), "optionsWithDictionary:", isa);

    if (v4)
    {
      v20 = sub_100010810;
      v21 = 0;
      aBlock = _NSConcreteStackBlock;
      v17 = 1107296256;
      v18 = sub_100010988;
      v19 = &unk_100045A88;
      v15 = _Block_copy(&aBlock);
      objc_msgSend(v4, "openApplication:withOptions:completion:", v3, v14, v15);

      _Block_release(v15);
      v14 = v4;
    }

  }
  else
  {
    __break(1u);
  }
}

_QWORD *sub_1000110D8(_QWORD *a1)
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

BOOL sub_100011160(_BYTE *a1)
{
  return (*a1 & 1) == 0;
}

id sub_100011170@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  id result;

  v2 = type metadata accessor for BackdropViewController();
  result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)), "init");
  *a1 = result;
  return result;
}

uint64_t sub_1000111AC(uint64_t a1)
{
  uint64_t v1;

  v1 = static os_log_type_t.default.getter(a1);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return os_log(_:dso:log:_:_:)(v1, &_mh_execute_header, qword_10005B240, "AmbientScene will assign BackdropViewController", 47, 2, &_swiftEmptyArrayStorage);
}

id sub_100011308()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  objc_super v11;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window] = 0;
  v1 = OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_dependency;
  v2 = qword_1000589A8;
  v3 = v0;
  if (v2 != -1)
    swift_once(&qword_1000589A8, sub_1000146BC);
  v4 = qword_10005B198;
  *(_QWORD *)&v0[v1] = qword_10005B198;
  v5 = OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_lockscreenCoordinator;
  v6 = qword_1000589E0;
  swift_retain(v4);
  if (v6 != -1)
    swift_once(&qword_1000589E0, sub_100026454);
  v7 = (void *)qword_10005B288;
  *(_QWORD *)&v3[v5] = qword_10005B288;
  v8 = &v3[OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable];
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v9 = v7;

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for AmbientSceneDelegate();
  return objc_msgSendSuper2(&v11, "init");
}

id sub_100011418()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AmbientSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AmbientSceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI20AmbientSceneDelegate);
}

void sub_1000114C0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id Strong;
  id v29;
  id v30;
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
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[24];
  _QWORD v60[6];

  v3 = sub_100006CE8(&qword_100059660);
  v52 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006CE8(&qword_100059668);
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006CE8(&qword_100059670);
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006CE8(&qword_100059678);
  v57 = *(_QWORD *)(v12 - 8);
  v58 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006CE8((uint64_t *)&unk_100059680);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_opt_self(UIWindowScene);
  v20 = swift_dynamicCastObjCClass(a1, v19);
  if (v20)
  {
    v48 = v16;
    v50 = v20;
    v51 = a1;
    v21 = static os_log_type_t.default.getter(v51);
    if (qword_1000589C0 != -1)
      swift_once(&qword_1000589C0, sub_10001E320);
    v49 = v15;
    v22 = v1;
    os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, qword_10005B240, "AmbientScene will connect", 25, 2, &_swiftEmptyArrayStorage);
    if (qword_1000589B0 != -1)
      swift_once(&qword_1000589B0, sub_100014740);
    v23 = qword_10005B1A0;
    KeyPath = swift_getKeyPath(&unk_100033E28);
    v25 = swift_getKeyPath(&unk_100033E50);
    LOBYTE(v60[0]) = 1;
    swift_retain(v23);
    static Published.subscript.setter(v60, v23, KeyPath, v25);
    v26 = *(_QWORD *)(v22 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_dependency) + 16;
    Strong = (id)swift_unknownObjectWeakLoadStrong(v26, v27);
    if (!Strong)
    {
      v29 = objc_msgSend((id)objc_opt_self(MRUEndpointController), "proactiveEndpointController");
      Strong = objc_msgSend(objc_allocWithZone((Class)MRUNowPlayingController), "initWithEndpointController:", v29);

      swift_unknownObjectWeakAssign(v26, Strong);
    }
    v30 = objc_msgSend(objc_allocWithZone((Class)MRUAmbientNowPlayingViewController), "initWithNowPlayingController:", Strong);

    swift_beginAccess(qword_10005B1A0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isBackdropSceneActive, v60, 33, 0);
    v31 = sub_100006CE8((uint64_t *)&unk_100059560);
    Published.projectedValue.getter(v31);
    swift_endAccess(v60);
    v32 = sub_10000FA94(&qword_100059690, &qword_100059660, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
    Publisher.filter(_:)(sub_100011160, 0, v3, v32);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v5, v3);
    v33 = sub_100006CE8(&qword_100059698);
    v34 = sub_10000FA94(&qword_1000596A0, &qword_100059668, (uint64_t)&protocol conformance descriptor for Publishers.Filter<A>);
    v35 = v54;
    Publisher.map<A>(_:)(sub_100011170, 0, v54, v33, v34);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v8, v35);
    v36 = sub_10000FA94(&qword_1000596A8, &qword_100059670, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
    v37 = v56;
    Publisher.first()(v56, v36);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v11, v37);
    v38 = sub_10000FA94(&qword_1000596B0, &qword_100059678, (uint64_t)&protocol conformance descriptor for Publishers.First<A>);
    v39 = v58;
    Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)(0, 0, sub_1000111AC, 0, 0, 0, 0, 0, 0, 0, v58, v38);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v14, v39);
    v40 = swift_getKeyPath(&unk_100033E98);
    v60[0] = v30;
    v41 = sub_10000FA94(&qword_1000596B8, (uint64_t *)&unk_100059680, (uint64_t)&protocol conformance descriptor for Publishers.HandleEvents<A>);
    v42 = v49;
    v43 = Publisher<>.assign<A>(to:on:)(v40, v60, v49, v41);
    swift_release(v40);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v42);
    v60[3] = type metadata accessor for AnyCancellable(0);
    v60[4] = &protocol witness table for AnyCancellable;
    v60[0] = v43;
    v44 = v22 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable;
    swift_beginAccess(v22 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable, v59, 33, 0);
    sub_10000F9E0((uint64_t)v60, v44);
    swift_endAccess(v59);
    v45 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
    v46 = objc_msgSend(v45, "initWithWindowScene:", v50);
    objc_msgSend(v46, "setRootViewController:", v30);
    objc_msgSend(v46, "makeKeyAndVisible");
    v47 = *(void **)(v22 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window);
    *(_QWORD *)(v22 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window) = v46;

  }
}

uint64_t sub_100011AA4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];
  _OWORD v10[2];
  uint64_t v11;

  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable;
  swift_beginAccess(v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_isBackdropActiveCancellable, v9, 33, 0);
  sub_10000F9E0((uint64_t)v10, v1);
  swift_endAccess(v9);
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI20AmbientSceneDelegate_window) = 0;

  if (qword_1000589B0 != -1)
    swift_once(&qword_1000589B0, sub_100014740);
  v3 = qword_10005B1A0;
  KeyPath = swift_getKeyPath(&unk_100033E28);
  v5 = swift_getKeyPath(&unk_100033E50);
  LOBYTE(v10[0]) = 0;
  swift_retain(v3);
  v6 = static Published.subscript.setter(v10, v3, KeyPath, v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, qword_10005B240, "AmbientScene did disconnect", 27, 2, &_swiftEmptyArrayStorage);
}

const char *sub_100011BF8()
{
  return "backdropViewController";
}

id sub_100011C04@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "backdropViewController");
  *a2 = result;
  return result;
}

id sub_100011C3C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, "setBackdropViewController:", *a1);
}

uint64_t sub_100011C50(uint64_t a1)
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

char *sub_100011C7C(_QWORD *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  char *v25;
  id v26;
  id v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v42;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];

  v46 = a5;
  v55 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride(0);
  v53 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006CE8((uint64_t *)&unk_10005A040);
  v47 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006CE8((uint64_t *)&unk_100059720);
  v16 = *(_QWORD *)(v15 - 8);
  v48 = v15;
  v49 = v16;
  __chkstk_darwin(v15);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_100006CE8(&qword_10005A050);
  v54 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables) = &_swiftEmptySetSingleton;
  *(_QWORD *)(v5
            + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration) = 0;
  *(_BYTE *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen) = 0;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView) = 0;
  swift_unknownObjectWeakInit(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext, 0);
  *(_BYTE *)(v5 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_providesHostedContent) = 1;
  v51 = a1;
  sub_100006D28(a1);
  v50 = a4;
  swift_unknownObjectRetain(a4);
  v21 = a2;
  v22 = a3;
  v23 = (uint64_t)a1;
  v24 = v21;
  v25 = sub_10001E490(v23, v21, v22, a4, v46);
  v26 = objc_msgSend(v22, "configuration");
  v27 = objc_msgSend((id)objc_opt_self(UIFont), "mru_suggestedRouteBannerTitleFont");
  objc_msgSend(v26, "setFont:", v27);

  objc_msgSend(v25, "setPreferredContentSize:", 430.0, 50.0);
  swift_beginAccess(&v25[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute], v56, 33, 0);
  v28 = v25;
  v29 = sub_100006CE8(&qword_100059730);
  Published.projectedValue.getter(v29);
  swift_endAccess(v56);

  v30 = sub_10000FA94(&qword_100059738, (uint64_t *)&unk_10005A040, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v31 = sub_100013234();
  Publisher<>.removeDuplicates()(v12, v30, v31);
  v32 = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v14, v12);
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)(v32, 0.1);
  v33 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  v56[0] = v33;
  v34 = sub_100013278();
  v35 = sub_10000FA94(&qword_100059750, (uint64_t *)&unk_100059720, (uint64_t)&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
  v36 = sub_1000132B4();
  v37 = v48;
  Publisher.throttle<A>(for:scheduler:latest:)(v11, v56, 1, v48, v34, v35, v36);

  (*(void (**)(char *, uint64_t))(v53 + 8))(v11, v55);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v18, v37);
  v38 = swift_allocObject(&unk_100045AC8, 24, 7);
  swift_unknownObjectWeakInit(v38 + 16, v28);
  v39 = sub_10000FA94((unint64_t *)&unk_100059760, &qword_10005A050, (uint64_t)&protocol conformance descriptor for Publishers.Throttle<A, B>);
  v40 = v52;
  v41 = Publisher<>.sink(receiveValue:)(sub_100013320, v38, v52, v39);
  v42 = swift_release(v38);
  (*(void (**)(char *, uint64_t, __n128))(v54 + 8))(v20, v40, v42);
  v43 = &v28[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables];
  swift_beginAccess(&v28[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables], v56, 33, 0);
  AnyCancellable.store(in:)(v43);
  swift_endAccess(v56);

  swift_unknownObjectRelease(v50);
  sub_100006E80(v51);
  swift_release(v41);

  return v28;
}

void sub_100012124(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Strong;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char *v75;
  _OWORD v76[13];
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  _OWORD v92[13];
  uint64_t v93;
  _BYTE v94[24];
  _BYTE v95[216];
  _OWORD v96[13];
  uint64_t v97;
  __int128 aBlock;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
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
  uint64_t v125;

  v2 = a1[11];
  v122 = a1[10];
  v123 = v2;
  v124 = a1[12];
  v125 = *((_QWORD *)a1 + 26);
  v3 = a1[7];
  v118 = a1[6];
  v119 = v3;
  v4 = a1[9];
  v120 = a1[8];
  v121 = v4;
  v5 = a1[3];
  v114 = a1[2];
  v115 = v5;
  v6 = a1[5];
  v116 = a1[4];
  v117 = v6;
  v7 = a1[1];
  v8 = a2 + 16;
  v112 = *a1;
  v113 = v7;
  swift_beginAccess(a2 + 16, v94, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v8, v9);
  if (Strong)
  {
    v11 = (void *)Strong;
    sub_10001E934();
    v12 = swift_allocObject(&unk_100045AF0, 240, 7);
    v13 = v116;
    *(_OWORD *)(v12 + 104) = v117;
    *(_OWORD *)(v12 + 88) = v13;
    v14 = v114;
    *(_OWORD *)(v12 + 72) = v115;
    *(_OWORD *)(v12 + 56) = v14;
    v15 = v120;
    *(_OWORD *)(v12 + 168) = v121;
    *(_OWORD *)(v12 + 152) = v15;
    v16 = v118;
    *(_OWORD *)(v12 + 136) = v119;
    *(_OWORD *)(v12 + 120) = v16;
    *(_OWORD *)(v12 + 216) = v124;
    v17 = v122;
    *(_OWORD *)(v12 + 200) = v123;
    *(_OWORD *)(v12 + 184) = v17;
    v18 = v113;
    *(_OWORD *)(v12 + 24) = v112;
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 232) = v125;
    *(_OWORD *)(v12 + 40) = v18;
    if (*((_BYTE *)v11 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen) == 1)
    {
      v19 = (void *)objc_opt_self(UIView);
      *(_QWORD *)&v100 = sub_1000133C4;
      *((_QWORD *)&v100 + 1) = v12;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v99 = sub_100011C50;
      *((_QWORD *)&v99 + 1) = &unk_100045B08;
      v20 = _Block_copy(&aBlock);
      v21 = *((_QWORD *)&v100 + 1);
      v22 = v11;
      sub_100006D28(&v112);
      swift_retain(v12);
      swift_release(v21);
      objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 4, v20, 0, 0.25, 0.0);

      swift_release(v12);
      _Block_release(v20);
    }
    else
    {
      v23 = v11;
      sub_100006D28(&v112);
      v24 = sub_100012870();
      v25 = &v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
      v26 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
      aBlock = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
      v99 = v26;
      v27 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
      v29 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
      v28 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
      v103 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
      v102 = v27;
      v100 = v29;
      v101 = v28;
      v30 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
      v32 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
      v31 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
      v107 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
      v106 = v30;
      v104 = v32;
      v105 = v31;
      v34 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
      v33 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
      v35 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
      v111 = *(_QWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
      v110 = v33;
      v108 = v35;
      v109 = v34;
      v36 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
      v37 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
      v38 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
      v88 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
      v89 = v36;
      v90 = v37;
      v91 = *(_QWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
      v39 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
      v40 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
      v41 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
      v84 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
      v85 = v39;
      v86 = v40;
      v87 = v38;
      v42 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
      v43 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
      v44 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
      v80 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
      v81 = v42;
      v82 = v43;
      v83 = v41;
      v45 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
      v78 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
      v79 = v45;
      v92[0] = v78;
      v92[1] = v44;
      v46 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
      v47 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
      v48 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
      v92[4] = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
      v92[5] = v48;
      v92[2] = v46;
      v92[3] = v47;
      v49 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
      v50 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
      v51 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
      v92[8] = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
      v92[9] = v51;
      v92[6] = v49;
      v92[7] = v50;
      v52 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
      v53 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
      v54 = *(_OWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
      v93 = *(_QWORD *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
      v92[11] = v53;
      v92[12] = v54;
      v92[10] = v52;
      v55 = v113;
      *(_OWORD *)v25 = v112;
      *((_OWORD *)v25 + 1) = v55;
      v56 = v114;
      v57 = v115;
      v58 = v117;
      *((_OWORD *)v25 + 4) = v116;
      *((_OWORD *)v25 + 5) = v58;
      *((_OWORD *)v25 + 2) = v56;
      *((_OWORD *)v25 + 3) = v57;
      v59 = v118;
      v60 = v119;
      v61 = v121;
      *((_OWORD *)v25 + 8) = v120;
      *((_OWORD *)v25 + 9) = v61;
      *((_OWORD *)v25 + 6) = v59;
      *((_OWORD *)v25 + 7) = v60;
      v62 = v122;
      v63 = v123;
      v64 = v124;
      *((_QWORD *)v25 + 26) = v125;
      *((_OWORD *)v25 + 11) = v63;
      *((_OWORD *)v25 + 12) = v64;
      *((_OWORD *)v25 + 10) = v62;
      sub_100006D28(&v112);
      sub_100006D28(&v112);
      sub_100006D28(&aBlock);
      sub_100006E80(v92);
      v65 = *((_OWORD *)v25 + 1);
      v96[0] = *(_OWORD *)v25;
      v96[1] = v65;
      v66 = *((_OWORD *)v25 + 5);
      v68 = *((_OWORD *)v25 + 2);
      v67 = *((_OWORD *)v25 + 3);
      v96[4] = *((_OWORD *)v25 + 4);
      v96[5] = v66;
      v96[2] = v68;
      v96[3] = v67;
      v69 = *((_OWORD *)v25 + 8);
      v71 = *((_OWORD *)v25 + 6);
      v70 = *((_OWORD *)v25 + 7);
      v96[9] = *((_OWORD *)v25 + 9);
      v96[8] = v69;
      v96[6] = v71;
      v96[7] = v70;
      v73 = *((_OWORD *)v25 + 11);
      v72 = *((_OWORD *)v25 + 12);
      v74 = *((_OWORD *)v25 + 10);
      v97 = *((_QWORD *)v25 + 26);
      v96[12] = v72;
      v96[10] = v74;
      v96[11] = v73;
      sub_100006D28(v96);
      LOBYTE(v25) = sub_1000197E8((uint64_t *)v96, (uint64_t)&aBlock);
      sub_100006E80(v96);
      if ((v25 & 1) == 0)
      {
        v76[10] = v88;
        v76[11] = v89;
        v76[12] = v90;
        v77 = v91;
        v76[6] = v84;
        v76[7] = v85;
        v76[8] = v86;
        v76[9] = v87;
        v76[2] = v80;
        v76[3] = v81;
        v76[4] = v82;
        v76[5] = v83;
        v76[0] = v78;
        v76[1] = v79;
        nullsub_2(v76);
        sub_100006E38((uint64_t)v76, (uint64_t)v95);
        sub_10002DB0C((uint64_t)v95);
        objc_msgSend(*(id *)&v24[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView], "invalidateIntrinsicContentSize");
      }
      sub_100006E80(&v112);
      sub_100006E80(&aBlock);

      v75 = sub_100012870();
      objc_msgSend(v75, "layoutIfNeeded");

      swift_release(v12);
    }
  }
}

void sub_1000125D0(uint64_t a1, uint64_t a2)
{
  char *v3;
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char *v54;
  _OWORD v55[13];
  uint64_t v56;
  _BYTE v57[216];
  _OWORD v58[13];
  uint64_t v59;
  _OWORD v60[13];
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _OWORD v76[13];
  uint64_t v77;

  v3 = sub_100012870();
  v4 = &v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v5 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  v60[0] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v60[1] = v5;
  v6 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
  v8 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  v7 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  v60[4] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v60[5] = v6;
  v60[2] = v8;
  v60[3] = v7;
  v9 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
  v11 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  v10 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
  v60[8] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  v60[9] = v9;
  v60[6] = v11;
  v60[7] = v10;
  v13 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
  v12 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
  v14 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
  v61 = *(_QWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
  v60[11] = v13;
  v60[12] = v12;
  v60[10] = v14;
  v15 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
  v16 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
  v17 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
  v72 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
  v73 = v15;
  v74 = v16;
  v75 = *(_QWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
  v18 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
  v19 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  v20 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
  v68 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  v69 = v18;
  v70 = v19;
  v71 = v17;
  v21 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  v22 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v23 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  v64 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  v65 = v21;
  v66 = v22;
  v67 = v20;
  v24 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  v62 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v63 = v24;
  v76[1] = v23;
  v76[0] = v62;
  v25 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  v26 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  v27 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v76[5] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80];
  v76[4] = v27;
  v76[3] = v26;
  v76[2] = v25;
  v28 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  v29 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112];
  v30 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  v76[9] = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144];
  v76[8] = v30;
  v76[7] = v29;
  v76[6] = v28;
  v31 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160];
  v32 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176];
  v33 = *(_OWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192];
  v77 = *(_QWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208];
  v76[12] = v33;
  v76[11] = v32;
  v76[10] = v31;
  v34 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *((_OWORD *)v4 + 1) = v34;
  v35 = *(_OWORD *)(a2 + 32);
  v36 = *(_OWORD *)(a2 + 48);
  v37 = *(_OWORD *)(a2 + 80);
  *((_OWORD *)v4 + 4) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v4 + 5) = v37;
  *((_OWORD *)v4 + 2) = v35;
  *((_OWORD *)v4 + 3) = v36;
  v38 = *(_OWORD *)(a2 + 96);
  v39 = *(_OWORD *)(a2 + 112);
  v40 = *(_OWORD *)(a2 + 144);
  *((_OWORD *)v4 + 8) = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v4 + 9) = v40;
  *((_OWORD *)v4 + 6) = v38;
  *((_OWORD *)v4 + 7) = v39;
  v41 = *(_OWORD *)(a2 + 160);
  v42 = *(_OWORD *)(a2 + 176);
  v43 = *(_OWORD *)(a2 + 192);
  *((_QWORD *)v4 + 26) = *(_QWORD *)(a2 + 208);
  *((_OWORD *)v4 + 11) = v42;
  *((_OWORD *)v4 + 12) = v43;
  *((_OWORD *)v4 + 10) = v41;
  sub_100006D28((_QWORD *)a2);
  sub_100006D28((_QWORD *)a2);
  sub_100006D28(v60);
  sub_100006E80(v76);
  v44 = *((_OWORD *)v4 + 1);
  v58[0] = *(_OWORD *)v4;
  v58[1] = v44;
  v45 = *((_OWORD *)v4 + 5);
  v47 = *((_OWORD *)v4 + 2);
  v46 = *((_OWORD *)v4 + 3);
  v58[4] = *((_OWORD *)v4 + 4);
  v58[5] = v45;
  v58[2] = v47;
  v58[3] = v46;
  v48 = *((_OWORD *)v4 + 9);
  v50 = *((_OWORD *)v4 + 6);
  v49 = *((_OWORD *)v4 + 7);
  v58[8] = *((_OWORD *)v4 + 8);
  v58[9] = v48;
  v58[6] = v50;
  v58[7] = v49;
  v52 = *((_OWORD *)v4 + 11);
  v51 = *((_OWORD *)v4 + 12);
  v53 = *((_OWORD *)v4 + 10);
  v59 = *((_QWORD *)v4 + 26);
  v58[11] = v52;
  v58[12] = v51;
  v58[10] = v53;
  sub_100006D28(v58);
  LOBYTE(v4) = sub_1000197E8((uint64_t *)v58, (uint64_t)v60);
  sub_100006E80(v58);
  if ((v4 & 1) == 0)
  {
    v55[10] = v72;
    v55[11] = v73;
    v55[12] = v74;
    v56 = v75;
    v55[6] = v68;
    v55[7] = v69;
    v55[8] = v70;
    v55[9] = v71;
    v55[2] = v64;
    v55[3] = v65;
    v55[4] = v66;
    v55[5] = v67;
    v55[0] = v62;
    v55[1] = v63;
    nullsub_2(v55);
    sub_100006E38((uint64_t)v55, (uint64_t)v57);
    sub_10002DB0C((uint64_t)v57);
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView], "invalidateIntrinsicContentSize");
  }
  sub_100006E80((_QWORD *)a2);
  sub_100006E80(v60);

  v54 = sub_100012870();
  objc_msgSend(v54, "layoutIfNeeded");

}

char *sub_100012870()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  char *v8;
  void *v9;
  id v10;
  _OWORD v12[13];
  uint64_t v13;
  _OWORD v14[13];
  uint64_t v15;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView);
  if (v2)
  {
    v3 = *(char **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView);
  }
  else
  {
    v4 = v0;
    KeyPath = swift_getKeyPath(&unk_100033F70);
    v6 = swift_getKeyPath(&unk_100033F98);
    static Published.subscript.getter(v12, v4, KeyPath, v6);
    swift_release(KeyPath);
    swift_release(v6);
    v14[10] = v12[10];
    v14[11] = v12[11];
    v14[12] = v12[12];
    v15 = v13;
    v14[6] = v12[6];
    v14[7] = v12[7];
    v14[8] = v12[8];
    v14[9] = v12[9];
    v14[2] = v12[2];
    v14[3] = v12[3];
    v14[4] = v12[4];
    v14[5] = v12[5];
    v14[0] = v12[0];
    v14[1] = v12[1];
    v7 = objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerView());
    v8 = sub_10002D2F4((uint64_t)v14);
    v9 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

void sub_1000129E0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  char *v7;
  double v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  objc_class *v20;
  char *v21;
  id v22;
  uint64_t v23;
  objc_super v24;
  _BYTE v25[24];

  v1 = v0;
  v2 = sub_100006CE8(&qword_100059778);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter], "configuration");
  v7 = sub_100012870();
  v8 = *(double *)&v7[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_titleLabelMaxWidth];

  objc_msgSend(v6, "setTextBoundingWidth:", v8);
  sub_10001F0F0();
  v9 = sub_100012870();
  v10 = sub_10002D128();

  swift_beginAccess(&v10[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth], v25, 33, 0);
  v11 = sub_100006CE8((uint64_t *)&unk_100058B80);
  Published.projectedValue.getter(v11);
  swift_endAccess(v25);

  v12 = swift_allocObject(&unk_100045AC8, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v1);
  v13 = sub_10000FA94(&qword_10005A090, &qword_100059778, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v14 = Publisher<>.sink(receiveValue:)(sub_1000134CC, v12, v2, v13);
  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15 = &v1[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables];
  swift_beginAccess(&v1[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables], v25, 33, 0);
  AnyCancellable.store(in:)(v15);
  swift_endAccess(v25);
  swift_release(v14);
  v16 = sub_100012870();
  v17 = *(id *)&v16[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView];

  v18 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView] = v17;
  v19 = v17;

  sub_10001E934();
  v20 = (objc_class *)type metadata accessor for SuggestedRouteBannerViewController(0);
  v24.receiver = v1;
  v24.super_class = v20;
  objc_msgSendSuper2(&v24, "viewDidLoad");
  v21 = sub_100012870();
  v22 = *(id *)&v21[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton];

  objc_msgSend(v22, "addTarget:action:forControlEvents:", v1, "actionButtonTappedWithSender:", 64);
}

void sub_100012C78(double *a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  id v7;
  double v8;
  double v9;
  _BYTE v10[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3, v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = objc_msgSend(*(id *)(Strong + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter), "configuration");
    objc_msgSend(v7, "textBoundingWidth");
    v9 = v8;

    if (v9 < v2)
      sub_10001F298(v2);

  }
}

id sub_100012D50(char a1)
{
  char *v1;
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_super v12;
  _QWORD v13[4];

  v2 = v1;
  v4 = sub_100012870();
  v5 = sub_100006CE8(&qword_100059770);
  v6 = swift_allocObject(v5, 48, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100033ED0;
  *(_QWORD *)(v6 + 32) = type metadata accessor for UITraitUserInterfaceStyle(0);
  *(_QWORD *)(v6 + 40) = &protocol witness table for UITraitUserInterfaceStyle;
  v7 = sub_100012870();
  v13[3] = type metadata accessor for SuggestedRouteBannerView();
  v13[0] = v7;
  v8 = UIView.registerForTraitChanges(_:target:action:)(v6, v13, "updateUserInterfaceStyle");

  swift_bridgeObjectRelease(v6);
  sub_1000134AC(v13);
  v9 = *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration];
  *(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration] = v8;
  swift_unknownObjectRelease(v9);
  v10 = sub_100012870();
  sub_10002DFE0();

  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController(0);
  return objc_msgSendSuper2(&v12, "viewWillAppear:", a1 & 1);
}

uint64_t sub_1000130B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables));
  swift_unknownObjectRelease(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView));
  return sub_1000082F0(v0 + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext);
}

id sub_100013100()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001318C()
{
  return type metadata accessor for SuggestedRouteBannerViewController(0);
}

uint64_t type metadata accessor for SuggestedRouteBannerViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100059708;
  if (!qword_100059708)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SuggestedRouteBannerViewController);
  return result;
}

uint64_t sub_1000131D0(uint64_t a1)
{
  _QWORD v2[6];

  v2[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[1] = "\b";
  v2[2] = &unk_100033F30;
  v2[3] = "\b";
  v2[4] = &unk_100033F48;
  v2[5] = &unk_100033F30;
  return swift_updateClassMetadata2(a1, 256, 6, v2, a1 + 512);
}

unint64_t sub_100013234()
{
  unint64_t result;

  result = qword_100059740;
  if (!qword_100059740)
  {
    result = swift_getWitnessTable(&unk_100034294, &type metadata for SuggestedRoute);
    atomic_store(result, (unint64_t *)&qword_100059740);
  }
  return result;
}

unint64_t sub_100013278()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059748;
  if (!qword_100059748)
  {
    v1 = objc_opt_self(NSRunLoop);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059748);
  }
  return result;
}

unint64_t sub_1000132B4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_100059758;
  if (!qword_100059758)
  {
    v1 = sub_100013278();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSRunLoop, v1);
    atomic_store(result, (unint64_t *)&qword_100059758);
  }
  return result;
}

uint64_t sub_1000132FC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100013320(__int128 *a1)
{
  uint64_t v1;

  sub_100012124(a1, v1);
}

uint64_t sub_100013328()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 152));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 168));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 184));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 200));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 224));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 232));
  return swift_deallocObject(v0, 240, 7);
}

void sub_1000133C4()
{
  uint64_t v0;

  sub_1000125D0(*(_QWORD *)(v0 + 16), v0 + 24);
}

uint64_t sub_1000133D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000133E4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_1000133F4()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables] = &_swiftEmptySetSingleton;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration] = 0;
  v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext], 0);
  v0[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_providesHostedContent] = 1;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteBannerViewController.swift", 54, 2, 111, 0);
  __break(1u);
}

uint64_t sub_1000134AC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_1000134CC(double *a1)
{
  uint64_t v1;

  sub_100012C78(a1, v1);
}

void sub_1000134D4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __objc2_meth_list **p_class_meths;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  objc_class *v25;
  id v26;
  __objc2_meth_list *v27;
  uint64_t v28;
  void *v29;
  id v30;

  v7 = objc_opt_self(SBSUIRemoteAlertScene);
  v8 = swift_dynamicCastObjCClass(a1, v7);
  if (!v8)
    return;
  v9 = (void *)v8;
  v30 = a1;
  v10 = objc_msgSend(v9, "configurationIdentifier");
  p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___BNPresentableContext + 32);
  if (v10)
  {
    v12 = v10;
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v15 = v14;

    if (v13 == 0x69702D6574756F72 && v15 == 0xEC00000072656B63)
    {
      swift_bridgeObjectRelease(0xEC00000072656B63);
      p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___BNPresentableContext + 32);
    }
    else
    {
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, 0x69702D6574756F72, 0xEC00000072656B63, 0);
      swift_bridgeObjectRelease(v15);
      p_class_meths = &OBJC_PROTOCOL___BNPresentableContext.class_meths;
      if ((v17 & 1) == 0)
        goto LABEL_8;
    }
    v25 = (objc_class *)type metadata accessor for OutputDevicePickerSceneDelegate();
LABEL_20:
    v26 = objc_msgSend(objc_allocWithZone(v25), "init");
    v27 = p_class_meths[240];
    v28 = *(uint64_t *)((char *)v27 + v3);
    *(__objc2_meth_list *)((char *)v27 + v3) = (__objc2_meth_list)v26;
    swift_unknownObjectRelease(v28);
    goto LABEL_21;
  }
LABEL_8:
  v18 = objc_msgSend(v9, "configurationIdentifier");
  if (v18)
  {
    v19 = v18;
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v22 = v21;

    if (v20 == 0x74696D69786F7270 && v22 == 0xEE00647261632D79)
    {
      swift_bridgeObjectRelease(0xEE00647261632D79);
    }
    else
    {
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, 0x74696D69786F7270, 0xEE00647261632D79, 0);
      swift_bridgeObjectRelease(v22);
      if ((v24 & 1) == 0)
        goto LABEL_21;
    }
    v25 = (objc_class *)type metadata accessor for ProximityCardSceneDelegate();
    goto LABEL_20;
  }
LABEL_21:
  v29 = *(void **)((char *)p_class_meths[240] + v3);
  if (v29)
  {
    if ((objc_msgSend(v29, "respondsToSelector:", "scene:willConnectToSession:options:") & 1) != 0)
      objc_msgSend(v29, "scene:willConnectToSession:options:", v30, a2, a3);
  }

}

char *sub_100013804(char *result, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;

  v4 = *(void **)&result[OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate];
  if (v4)
  {
    result = (char *)objc_msgSend(*(id *)&result[OBJC_IVAR____TtC13MediaRemoteUI24RemoteAlertSceneDelegate_underlyingSceneDelegate], "respondsToSelector:", *a4);
    if ((result & 1) != 0)
      return (char *)objc_msgSend(v4, *a4, a3);
  }
  return result;
}

id sub_1000138B8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI24RemoteAlertSceneDelegate);
}

void sub_10001395C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  _BYTE v35[24];

  v13 = sub_100006CE8(&qword_1000595F8);
  __chkstk_darwin(v13);
  v15 = &v35[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a1)
  {
    v16 = type metadata accessor for ProximityCardViewController(0);
    v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v16));
    v18 = a1;
    v19 = (char *)objc_msgSend(v17, "init");
    v20 = objc_msgSend(v18, "mru_imageFittingSize:", 150.0, 150.0);
    v21 = *(void **)&v19[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image];
    *(_QWORD *)&v19[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_image] = v20;

    v22 = &v19[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName];
    v23 = *(_QWORD *)&v19[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_deviceName + 8];
    *(_QWORD *)v22 = a3;
    *((_QWORD *)v22 + 1) = a4;
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRelease(v23);
    v24 = type metadata accessor for URL(0);
    v25 = *(_QWORD *)(v24 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v25 + 16))(v15, a5, v24);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v15, 0, 1, v24);
    v26 = (uint64_t)&v19[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url];
    swift_beginAccess(&v19[OBJC_IVAR____TtC13MediaRemoteUI27ProximityCardViewController_url], v35, 33, 0);
    sub_100014674((uint64_t)v15, v26);
    swift_endAccess(v35);
    v27 = type metadata accessor for ProximityCardRootViewController();
    v28 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v27)), "init");
    v29 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", a6);
    objc_msgSend(v29, "setRootViewController:", v28);
    objc_msgSend(v29, "makeKeyAndVisible");
    v30 = *(void **)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window);
    *(_QWORD *)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_window) = v29;
    v31 = v29;

    v32 = objc_msgSend(v28, "presentProxCardFlowWithDelegate:initialViewController:", a7, v19);
    v33 = *(void **)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController);
    *(_QWORD *)(a7 + OBJC_IVAR____TtC13MediaRemoteUI26ProximityCardSceneDelegate_navigationController) = v32;

  }
}

id sub_100013D98()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProximityCardSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProximityCardSceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI26ProximityCardSceneDelegate);
}

void sub_100013E20(void *a1)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  NSString v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void (*v47)(char *, char *, uint64_t);
  id v48;
  uint64_t v49;
  unint64_t v50;
  NSString v51;
  NSString v52;
  uint64_t v53;
  id v54;
  _QWORD aBlock[5];
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  __int128 v59;
  __int128 v60;

  v2 = v1;
  v4 = sub_100006CE8(&qword_1000595F8);
  __chkstk_darwin(v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v47 - v12;
  v14 = objc_opt_self(SBSUIRemoteAlertScene);
  v15 = swift_dynamicCastObjCClass(a1, v14);
  if (v15)
  {
    v16 = (void *)v15;
    v54 = a1;
    v17 = objc_msgSend(v16, "configurationContext");
    if (!v17
      || (v18 = v17, v19 = objc_msgSend(v17, "userInfo"), v18, !v19))
    {

      return;
    }
    v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v57 = 0x614E656369766564;
    v58 = 0xEA0000000000656DLL;
    AnyHashable.init<A>(_:)(aBlock, &v57, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v20 + 16) && (v21 = sub_10002CA08((uint64_t)aBlock), (v22 & 1) != 0))
    {
      sub_10000A4F0(*(_QWORD *)(v20 + 56) + 32 * v21, (uint64_t)&v59);
    }
    else
    {
      v59 = 0u;
      v60 = 0u;
    }
    sub_10000A478((uint64_t)aBlock);
    if (*((_QWORD *)&v60 + 1))
    {
      if ((swift_dynamicCast(&v57, &v59, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
      {

LABEL_36:
        v31 = v20;
        goto LABEL_37;
      }
      v23 = v58;
      v53 = v57;
      v57 = 0x6564496C65646F6DLL;
      v58 = 0xEF7265696669746ELL;
      AnyHashable.init<A>(_:)(aBlock, &v57, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v20 + 16) && (v24 = sub_10002CA08((uint64_t)aBlock), (v25 & 1) != 0))
      {
        sub_10000A4F0(*(_QWORD *)(v20 + 56) + 32 * v24, (uint64_t)&v59);
      }
      else
      {
        v59 = 0u;
        v60 = 0u;
      }
      sub_10000A478((uint64_t)aBlock);
      if (*((_QWORD *)&v60 + 1))
      {
        if ((swift_dynamicCast(&v57, &v59, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
        {

LABEL_35:
          swift_bridgeObjectRelease(v23);
          goto LABEL_36;
        }
        v51 = (NSString)v57;
        v52 = (NSString)v58;
        v57 = 0x726F6C6F63;
        v58 = 0xE500000000000000;
        AnyHashable.init<A>(_:)(aBlock, &v57, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v20 + 16) && (v26 = sub_10002CA08((uint64_t)aBlock), (v27 & 1) != 0))
        {
          sub_10000A4F0(*(_QWORD *)(v20 + 56) + 32 * v26, (uint64_t)&v59);
        }
        else
        {
          v59 = 0u;
          v60 = 0u;
        }
        sub_10000A478((uint64_t)aBlock);
        if (*((_QWORD *)&v60 + 1))
        {
          if ((swift_dynamicCast(&v57, &v59, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
          {
            v49 = v57;
            v50 = v58;
            v57 = 7107189;
            v58 = 0xE300000000000000;
            AnyHashable.init<A>(_:)(aBlock, &v57, &type metadata for String, &protocol witness table for String);
            if (*(_QWORD *)(v20 + 16) && (v28 = sub_10002CA08((uint64_t)aBlock), (v29 & 1) != 0))
            {
              sub_10000A4F0(*(_QWORD *)(v20 + 56) + 32 * v28, (uint64_t)&v59);
            }
            else
            {
              v59 = 0u;
              v60 = 0u;
            }
            swift_bridgeObjectRelease(v20);
            sub_10000A478((uint64_t)aBlock);
            if (*((_QWORD *)&v60 + 1))
            {
              if ((swift_dynamicCast(&v57, &v59, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
              {
                v32 = v58;
                URL.init(string:)(v57, v58);
                swift_bridgeObjectRelease(v32);
                v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
                v34 = v52;
                if (v33 == 1)
                {
                  swift_bridgeObjectRelease(v50);
                  swift_bridgeObjectRelease(v34);
                  swift_bridgeObjectRelease(v23);

                  sub_100014510((uint64_t)v6, &qword_1000595F8);
                }
                else
                {
                  v47 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
                  v47(v13, v6, v7);
                  v48 = objc_msgSend((id)objc_opt_self(MRUAssetManager), "sharedManager");
                  v51 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease(v34);
                  v35 = v50;
                  v52 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease(v35);
                  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
                  v36 = *(unsigned __int8 *)(v8 + 80);
                  v37 = (v36 + 32) & ~v36;
                  v50 = (v9 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
                  v38 = (v50 + 15) & 0xFFFFFFFFFFFFFFF8;
                  v39 = swift_allocObject(&unk_100045B58, v38 + 8, v36 | 7);
                  *(_QWORD *)(v39 + 16) = v53;
                  *(_QWORD *)(v39 + 24) = v23;
                  v47((char *)(v39 + v37), v11, v7);
                  *(_QWORD *)(v39 + v50) = v16;
                  *(_QWORD *)(v39 + v38) = v2;
                  aBlock[4] = sub_1000145EC;
                  v56 = v39;
                  aBlock[0] = _NSConcreteStackBlock;
                  aBlock[1] = 1107296256;
                  aBlock[2] = sub_100010988;
                  aBlock[3] = &unk_100045B70;
                  v40 = _Block_copy(aBlock);
                  v41 = v56;
                  v42 = v54;
                  v43 = v2;
                  swift_release(v41);
                  v44 = v48;
                  v45 = v51;
                  v46 = v52;
                  objc_msgSend(v48, "imageForModelIdentifier:color:allowFallback:completion:", v51, v52, 1, v40);
                  _Block_release(v40);

                  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
                }
                return;
              }

              swift_bridgeObjectRelease(v50);
              swift_bridgeObjectRelease(v52);
              v31 = v23;
LABEL_37:
              swift_bridgeObjectRelease(v31);
              return;
            }

            swift_bridgeObjectRelease(v50);
            swift_bridgeObjectRelease(v52);
            v30 = v23;
LABEL_33:
            swift_bridgeObjectRelease(v30);
            sub_100014510((uint64_t)&v59, &qword_100059230);
            return;
          }

          swift_bridgeObjectRelease(v52);
          goto LABEL_35;
        }

        swift_bridgeObjectRelease(v52);
      }
      else
      {

      }
      swift_bridgeObjectRelease(v23);
    }
    else
    {

    }
    v30 = v20;
    goto LABEL_33;
  }
}

uint64_t sub_100014510(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006CE8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001454C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v7 + 8, v5);
}

void sub_1000145EC(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_10001395C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v2 + v6, *(_QWORD *)(v2 + v7), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10001465C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001466C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100014674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CE8(&qword_1000595F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000146BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for AmbientSceneDependency();
  v1 = swift_allocObject(v0, 24, 7);
  result = swift_unknownObjectWeakInit(v1 + 16, 0);
  qword_10005B198 = v1;
  return result;
}

uint64_t sub_1000146FC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AmbientSceneDependency()
{
  return objc_opt_self(_TtC13MediaRemoteUI22AmbientSceneDependency);
}

uint64_t sub_100014740()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for SceneMonitor(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_100014820();
  qword_10005B1A0 = result;
  return result;
}

uint64_t sub_10001477C()
{
  return sub_1000147B8((uint64_t)&unk_100034118, (uint64_t)&unk_100034140);
}

uint64_t sub_100014790()
{
  return sub_1000147B8((uint64_t)&unk_1000340D0, (uint64_t)&unk_1000340F8);
}

uint64_t sub_1000147A4()
{
  return sub_1000147B8((uint64_t)&unk_100034088, (uint64_t)&unk_1000340B0);
}

uint64_t sub_1000147B8(uint64_t a1, uint64_t a2)
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

uint64_t sub_100014820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(uint64_t, char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v1 = sub_100006CE8((uint64_t *)&unk_100059560);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientSceneActive;
  v13 = 0;
  Published.init(initialValue:)(&v13, &type metadata for Bool);
  v6 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  v6(v5, v4, v1);
  v7 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientCompactSceneActive;
  v12 = 0;
  Published.init(initialValue:)(&v12, &type metadata for Bool);
  v6(v7, v4, v1);
  v8 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isBackdropSceneActive;
  v11 = 0;
  Published.init(initialValue:)(&v11, &type metadata for Bool);
  v6(v8, v4, v1);
  return v0;
}

uint64_t sub_10001492C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientSceneActive;
  v2 = sub_100006CE8((uint64_t *)&unk_100059560);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientCompactSceneActive, v2);
  v3(v0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isBackdropSceneActive, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000149B4()
{
  return type metadata accessor for SceneMonitor(0);
}

uint64_t type metadata accessor for SceneMonitor(uint64_t a1)
{
  uint64_t result;

  result = qword_100059928;
  if (!qword_100059928)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SceneMonitor);
  return result;
}

void sub_1000149F8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_100014A68();
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

void sub_100014A68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100059938)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100059938);
  }
}

uint64_t sub_100014ABC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014AF8(a1, (uint64_t)&unk_100034118, (uint64_t)&unk_100034140, a2);
}

uint64_t sub_100014AD0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100014B84(a1, a2, a3, a4, (uint64_t)&unk_100034118, (uint64_t)&unk_100034140);
}

uint64_t sub_100014AE4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014AF8(a1, (uint64_t)&unk_1000340D0, (uint64_t)&unk_1000340F8, a2);
}

uint64_t sub_100014AF8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
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
  swift_release(KeyPath);
  result = swift_release(v8);
  *a4 = v10;
  return result;
}

uint64_t sub_100014B70(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100014B84(a1, a2, a3, a4, (uint64_t)&unk_1000340D0, (uint64_t)&unk_1000340F8);
}

uint64_t sub_100014B84(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  char v12;

  v7 = *a1;
  v8 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v10 = swift_getKeyPath(a6);
  v12 = v7;
  swift_retain(v8);
  return static Published.subscript.setter(&v12, v8, KeyPath, v10);
}

uint64_t sub_100014BF8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014AF8(a1, (uint64_t)&unk_1000340D0, (uint64_t)&unk_1000340F8, a2);
}

uint64_t sub_100014C1C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100014B84(a1, a2, a3, a4, (uint64_t)&unk_1000340D0, (uint64_t)&unk_1000340F8);
}

uint64_t sub_100014C40@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_100014AF8(a1, (uint64_t)&unk_100034118, (uint64_t)&unk_100034140, a2);
}

uint64_t sub_100014C64(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100014B84(a1, a2, a3, a4, (uint64_t)&unk_100034118, (uint64_t)&unk_100034140);
}

void sub_100014D04(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
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
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;

  v3 = v2;
  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene, a2);
  if (Strong)
  {
    v7 = (void *)Strong;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v8 = a1;
    v9 = v7;
    LOBYTE(v7) = static NSObject.== infix(_:_:)(v9, v8);

    if ((v7 & 1) != 0)
    {
      if (qword_1000589E0 != -1)
        swift_once(&qword_1000589E0, sub_100026454);
      v10 = *(void **)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
      *(_QWORD *)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) = 0;

      sub_1000264E4();
      v11 = qword_10005B288;
      v12 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
      v13 = *(void **)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
      *(_QWORD *)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = 0;

      sub_10002826C();
      v14 = *(void **)(v11 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
      if (v14)
      {
        v15 = *(id *)(v11 + v12);
        v16 = v14;
        v17 = objc_msgSend(v16, "artworkView");
        objc_msgSend(v17, "setArtwork:", v15);

      }
      v18 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow;
      goto LABEL_14;
    }
  }
  v19 = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationScene, v6);
  if (v19)
  {
    v21 = (void *)v19;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v22 = a1;
    v23 = v21;
    LOBYTE(v21) = static NSObject.== infix(_:_:)(v23, v22);

    if ((v21 & 1) != 0)
    {
      v18 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow;
LABEL_14:
      v29 = *(void **)(v3 + v18);
      *(_QWORD *)(v3 + v18) = 0;

      return;
    }
  }
  v24 = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene, v20);
  if (v24)
  {
    v26 = (void *)v24;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v27 = a1;
    v28 = v26;
    LOBYTE(v26) = static NSObject.== infix(_:_:)(v28, v27);

    if ((v26 & 1) != 0)
    {
      v18 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow;
      goto LABEL_14;
    }
  }
  v30 = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingScene, v25);
  if (v30)
  {
    v32 = (void *)v30;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v33 = a1;
    v34 = v32;
    LOBYTE(v32) = static NSObject.== infix(_:_:)(v34, v33);

    if ((v32 & 1) != 0)
    {
      v35 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider;
LABEL_21:
      v40 = *(_QWORD *)(v3 + v35);
      *(_QWORD *)(v3 + v35) = 0;
      swift_unknownObjectRelease(v40);
      return;
    }
  }
  v36 = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_screenMirroringScene, v31);
  if (v36)
  {
    v37 = (void *)v36;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v38 = a1;
    v39 = v37;
    LOBYTE(v37) = static NSObject.== infix(_:_:)(v39, v38);

    if ((v37 & 1) != 0)
    {
      v35 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider;
      goto LABEL_21;
    }
  }
}

void sub_1000150B4(void *a1)
{
  sub_100015168(a1, "[%s] CoverSheetScene will enter foreground", 1, "[%s] RouteRecommendationScene will enter foreground", "[%s] NowPlayingScene will enter foreground", "[%s] NowPlayingBannerScene will enter foreground", "[%s] ScreenMirroringScene will enter foreground");
}

void sub_100015138(void *a1)
{
  sub_100015168(a1, "[%s] CoverSheetScene did enter background", 0, "[%s] RouteRecommendationScene did enter background", "[%s] NowPlayingScene did enter background", "[%s] NowPlayingBannerScene did enter background", "[%s] ScreenMirroringScene did enter background");
}

void sub_100015168(void *a1, const char *a2, char a3, const char *a4, const char *a5, const char *a6, const char *a7)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v14;
  uint64_t Strong;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  os_log_type_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  os_log_type_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  id v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  os_log_type_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  os_log_t osloga;
  uint64_t ObjectType;
  uint64_t v110;
  uint64_t v111;

  v12 = v7;
  ObjectType = swift_getObjectType(v7);
  Strong = swift_unknownObjectWeakLoadStrong(v7 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene, v14);
  if (Strong)
  {
    v17 = (void *)Strong;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v18 = a1;
    v19 = v17;
    v20 = static NSObject.== infix(_:_:)(v19, v18);

    if ((v20 & 1) != 0)
    {
      if (qword_1000589D0 != -1)
        swift_once(&qword_1000589D0, sub_10001E410);
      v21 = type metadata accessor for Logger(0);
      v22 = sub_1000163A0(v21, (uint64_t)qword_10005B250);
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.default.getter(v23);
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(12, -1);
        v26 = swift_slowAlloc(32, -1);
        v111 = v26;
        *(_DWORD *)v25 = 136315138;
        v27 = _typeName(_:qualified:)(ObjectType, 0);
        v29 = v28;
        v110 = sub_100030094(v27, v28, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111);
        swift_bridgeObjectRelease(v29);
        _os_log_impl((void *)&_mh_execute_header, v23, v24, a2, v25, 0xCu);
        swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v26, -1, -1);
        swift_slowDealloc(v25, -1, -1);
      }

      v30 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow;
      v31 = *(void **)(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow);
      if (v31)
      {
        v32 = objc_msgSend(v31, "rootViewController");
        if (v32)
        {
          v33 = v32;
          objc_msgSend(v32, "beginAppearanceTransition:animated:", a3 & 1, 0);

        }
      }
LABEL_20:
      v53 = objc_msgSend(*(id *)(v12 + v30), "rootViewController");
      objc_msgSend(v53, "endAppearanceTransition");

      return;
    }
  }
  v34 = v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationScene;
  v35 = swift_unknownObjectWeakLoadStrong(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationScene, v16);
  if (v35)
  {
    v37 = (void *)v35;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v38 = a1;
    v39 = v37;
    v40 = static NSObject.== infix(_:_:)(v39, v38);

    if ((v40 & 1) != 0)
    {
      if (qword_1000589D0 != -1)
        swift_once(&qword_1000589D0, sub_10001E410);
      v41 = type metadata accessor for Logger(0);
      v42 = sub_1000163A0(v41, (uint64_t)qword_10005B250);
      v43 = Logger.logObject.getter(v42);
      v44 = static os_log_type_t.default.getter(v43);
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc(12, -1);
        v46 = swift_slowAlloc(32, -1);
        v111 = v46;
        *(_DWORD *)v45 = 136315138;
        v47 = _typeName(_:qualified:)(ObjectType, 0);
        v49 = v48;
        v110 = sub_100030094(v47, v48, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111);
        swift_bridgeObjectRelease(v49);
        _os_log_impl((void *)&_mh_execute_header, v43, v44, a4, v45, 0xCu);
        swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v46, -1, -1);
        swift_slowDealloc(v45, -1, -1);
      }

      v30 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow;
      v50 = *(void **)(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow);
      if (v50)
      {
        v51 = objc_msgSend(v50, "rootViewController");
        if (v51)
        {
          v52 = v51;
          objc_msgSend(v51, "beginAppearanceTransition:animated:", a3 & 1, 0);

        }
      }
      goto LABEL_20;
    }
  }
  v54 = swift_unknownObjectWeakLoadStrong(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingScene, v36);
  if (v54)
  {
    v56 = (void *)v54;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v57 = a1;
    v58 = v56;
    v59 = static NSObject.== infix(_:_:)(v58, v57);

    if ((v59 & 1) != 0)
    {
      if (qword_1000589D0 != -1)
        swift_once(&qword_1000589D0, sub_10001E410);
      v60 = type metadata accessor for Logger(0);
      v61 = sub_1000163A0(v60, (uint64_t)qword_10005B250);
      osloga = (os_log_t)Logger.logObject.getter(v61);
      v62 = static os_log_type_t.default.getter(osloga);
      if (os_log_type_enabled(osloga, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc(12, -1);
        v64 = swift_slowAlloc(32, -1);
        v111 = v64;
        *(_DWORD *)v63 = 136315138;
        v65 = _typeName(_:qualified:)(ObjectType, 0);
        v67 = v66;
        v110 = sub_100030094(v65, v66, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111);
        swift_bridgeObjectRelease(v67);
        v68 = osloga;
        v69 = v62;
        v70 = a5;
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v68, v69, v70, v63, 0xCu);
        swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v64, -1, -1);
        swift_slowDealloc(v63, -1, -1);

        return;
      }
      goto LABEL_47;
    }
  }
  v71 = swift_unknownObjectWeakLoadStrong(v34, v55);
  if (v71)
  {
    v73 = (void *)v71;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v74 = a1;
    v75 = v73;
    v76 = static NSObject.== infix(_:_:)(v75, v74);

    if ((v76 & 1) != 0)
    {
      if (qword_1000589D0 != -1)
        swift_once(&qword_1000589D0, sub_10001E410);
      v77 = type metadata accessor for Logger(0);
      v78 = sub_1000163A0(v77, (uint64_t)qword_10005B250);
      osloga = (os_log_t)Logger.logObject.getter(v78);
      v79 = static os_log_type_t.default.getter(osloga);
      if (os_log_type_enabled(osloga, v79))
      {
        v63 = (uint8_t *)swift_slowAlloc(12, -1);
        v64 = swift_slowAlloc(32, -1);
        v111 = v64;
        *(_DWORD *)v63 = 136315138;
        v80 = _typeName(_:qualified:)(ObjectType, 0);
        v82 = v81;
        v110 = sub_100030094(v80, v81, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111);
        swift_bridgeObjectRelease(v82);
        v68 = osloga;
        v69 = v79;
        v70 = a4;
        goto LABEL_45;
      }
LABEL_47:

      return;
    }
  }
  v83 = swift_unknownObjectWeakLoadStrong(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene, v72);
  if (v83)
  {
    v85 = (void *)v83;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v86 = a1;
    v87 = v85;
    v88 = static NSObject.== infix(_:_:)(v87, v86);

    if ((v88 & 1) != 0)
    {
      if (qword_1000589D0 != -1)
        swift_once(&qword_1000589D0, sub_10001E410);
      v89 = type metadata accessor for Logger(0);
      v90 = sub_1000163A0(v89, (uint64_t)qword_10005B250);
      osloga = (os_log_t)Logger.logObject.getter(v90);
      v91 = static os_log_type_t.default.getter(osloga);
      if (os_log_type_enabled(osloga, v91))
      {
        v63 = (uint8_t *)swift_slowAlloc(12, -1);
        v64 = swift_slowAlloc(32, -1);
        v111 = v64;
        *(_DWORD *)v63 = 136315138;
        v92 = _typeName(_:qualified:)(ObjectType, 0);
        v94 = v93;
        v110 = sub_100030094(v92, v93, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111);
        swift_bridgeObjectRelease(v94);
        v68 = osloga;
        v69 = v91;
        v70 = a6;
        goto LABEL_45;
      }
      goto LABEL_47;
    }
  }
  v95 = swift_unknownObjectWeakLoadStrong(v12 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_screenMirroringScene, v84);
  if (v95)
  {
    v96 = (void *)v95;
    sub_100008314(0, &qword_100059B48, UIScene_ptr);
    v97 = a1;
    v98 = v96;
    v99 = static NSObject.== infix(_:_:)(v98, v97);

    if ((v99 & 1) != 0)
    {
      if (qword_1000589D0 != -1)
        swift_once(&qword_1000589D0, sub_10001E410);
      v100 = type metadata accessor for Logger(0);
      v101 = sub_1000163A0(v100, (uint64_t)qword_10005B250);
      osloga = (os_log_t)Logger.logObject.getter(v101);
      v102 = static os_log_type_t.default.getter(osloga);
      if (os_log_type_enabled(osloga, v102))
      {
        v63 = (uint8_t *)swift_slowAlloc(12, -1);
        v64 = swift_slowAlloc(32, -1);
        v111 = v64;
        *(_DWORD *)v63 = 136315138;
        v103 = _typeName(_:qualified:)(ObjectType, 0);
        v105 = v104;
        v110 = sub_100030094(v103, v104, &v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v110, &v111);
        swift_bridgeObjectRelease(v105);
        v70 = a7;
        v68 = osloga;
        v69 = v102;
        goto LABEL_45;
      }
      goto LABEL_47;
    }
  }
}

id sub_100015BE0()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingScene], 0);
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_screenMirroringScene], 0);
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene], 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerViewController], 0);
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene], 0);
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationScene], 0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100015CE4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivitySceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI21ActivitySceneDelegate);
}

void sub_100015E8C(void *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  void *Strong;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerViewController, a2);
  if (Strong && (v10 = Strong, Strong, v10 == a1))
  {
    v14 = swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene, v9);
    if (!v14)
      return;
    v17 = (id)v14;
    v15 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
    v16 = ActivitySceneMetrics.init(size:cornerRadius:)(a3, a4, 0.0);
    dispatch thunk of ActivityScene.resolvedMetrics.setter(v16);
  }
  else
  {
    v11 = swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene, v9);
    if (!v11)
      return;
    v17 = (id)v11;
    v12 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
    v13 = ActivitySceneMetrics.init(size:cornerRadius:)(a3, a4, 0.0);
    dispatch thunk of ActivityScene.resolvedMetrics.setter(v13);
    if (qword_1000589E0 != -1)
      swift_once(&qword_1000589E0, sub_100026454);
    sub_100027358(a3, a4);
  }

}

void sub_100016034(void *a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerViewController, a2);
  if (!Strong || (v7 = Strong, Strong, v7 != a1))
  {
    v8 = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene, v6);
    if (!v8)
      return;
    v42 = (id)v8;
    if ((unint64_t)a2 >> 62)
    {
      if (a2 < 0)
        v40 = a2;
      else
        v40 = a2 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a2);
      v9 = _CocoaArrayWrapper.endIndex.getter(v40);
      swift_bridgeObjectRelease(a2);
    }
    else
    {
      v9 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (!v9)
      goto LABEL_28;
    sub_100022450(0, v9 & ~(v9 >> 63), 0);
    if ((v9 & 0x8000000000000000) == 0)
    {
      v10 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0)
          v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a2);
        else
          v11 = *(id *)(a2 + 8 * v10 + 32);
        v12 = v11;
        objc_msgSend(v11, "CGRectValue", v42);
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;

        v22 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
        v21 = *((_QWORD *)&_swiftEmptyArrayStorage + 3);
        if (v22 >= v21 >> 1)
          sub_100022450(v21 > 1, v22 + 1, 1);
        ++v10;
        *((_QWORD *)&_swiftEmptyArrayStorage + 2) = v22 + 1;
        v23 = (_QWORD *)((char *)&_swiftEmptyArrayStorage + 32 * v22);
        v23[4] = v14;
        v23[5] = v16;
        v23[6] = v18;
        v23[7] = v20;
      }
      while (v9 != v10);
      goto LABEL_28;
    }
    __break(1u);
LABEL_35:
    if (a2 < 0)
      v41 = a2;
    else
      v41 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v25 = _CocoaArrayWrapper.endIndex.getter(v41);
    swift_bridgeObjectRelease(a2);
    goto LABEL_19;
  }
  v24 = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene, v6);
  if (!v24)
    return;
  v42 = (id)v24;
  if ((unint64_t)a2 >> 62)
    goto LABEL_35;
  v25 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_19:
  if (!v25)
  {
LABEL_28:
    dispatch thunk of ActivityScene.activityHostTouchRestrictedRects.setter(&_swiftEmptyArrayStorage);

    return;
  }
  sub_100022450(0, v25 & ~(v25 >> 63), 0);
  if ((v25 & 0x8000000000000000) == 0)
  {
    v26 = 0;
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
        v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, a2);
      else
        v27 = *(id *)(a2 + 8 * v26 + 32);
      v28 = v27;
      objc_msgSend(v27, "CGRectValue", v42);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;

      v38 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
      v37 = *((_QWORD *)&_swiftEmptyArrayStorage + 3);
      if (v38 >= v37 >> 1)
        sub_100022450(v37 > 1, v38 + 1, 1);
      ++v26;
      *((_QWORD *)&_swiftEmptyArrayStorage + 2) = v38 + 1;
      v39 = (_QWORD *)((char *)&_swiftEmptyArrayStorage + 32 * v38);
      v39[4] = v30;
      v39[5] = v32;
      v39[6] = v34;
      v39[7] = v36;
    }
    while (v25 != v26);
    goto LABEL_28;
  }
  __break(1u);
}

uint64_t sub_1000163A0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1000163B8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t KeyPath;
  id v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  void *v32;
  uint64_t v33;
  void (*v34)(_BYTE *, uint64_t, uint64_t, uint64_t, __n128);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(_BYTE *, uint64_t, uint64_t);
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  __n128 v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  int v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSString v88;
  unint64_t v89;
  id v90;
  NSObject *v91;
  os_log_type_t v92;
  _BOOL4 v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  id v132;
  unint64_t v133;
  id v134;
  NSObject *v135;
  os_log_type_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char v168;
  id v169;
  id v170;
  char v171;
  id v172;
  unint64_t v173;
  id v174;
  NSObject *v175;
  os_log_type_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  uint64_t v183;
  unint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  id v194;
  id v195;
  id v196;
  void *v197;
  id v198;
  id v199;
  uint64_t v200;
  id v201;
  id v202;
  uint64_t v203;
  void *v204;
  id v205;
  void *v206;
  id v207;
  id v208;
  id v209;
  void *v210;
  id v211;
  char v212;
  void *v213;
  id v214;
  double v215;
  CGFloat v216;
  double v217;
  CGFloat v218;
  double v219;
  CGFloat v220;
  double v221;
  CGFloat v222;
  double Width;
  id v224;
  uint64_t v225;
  _BYTE *v226;
  uint64_t v227;
  char *v228;
  NSObject *v229;
  os_log_type_t v230;
  int v231;
  uint64_t v232;
  uint64_t v233;
  unint64_t v234;
  unint64_t v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  unint64_t v239;
  uint64_t v240;
  unint64_t v241;
  unint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  NSString v249;
  id v250;
  id v251;
  id v252;
  void *v253;
  _BYTE v254[12];
  int v255;
  char *v256;
  void (*v257)(_BYTE *, _BYTE *, uint64_t);
  id v258;
  void (*v259)(_BYTE *, uint64_t);
  uint64_t v260;
  id v261;
  _BYTE *v262;
  id v263;
  _BYTE *v264;
  uint64_t v265;
  _BYTE *v266;
  _BYTE *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t ObjectType;
  uint64_t v271;
  __objc2_prot *v272;
  __objc2_prot *v273;
  _QWORD v274[2];
  __int128 v275;
  uint64_t v276;
  __int128 v277;
  uint64_t v278;
  CGRect v279;

  ObjectType = swift_getObjectType(v1);
  v3 = sub_100006CE8(&qword_100059B50);
  __chkstk_darwin(v3);
  v5 = &v254[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for MediaLiveActivityAttributes(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v266 = &v254[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __chkstk_darwin(v8);
  v267 = &v254[-v11];
  __chkstk_darwin(v10);
  v13 = &v254[-v12];
  v14 = sub_100006CE8(&qword_100059B58);
  v15 = __chkstk_darwin(v14);
  v17 = &v254[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  v19 = &v254[-v18];
  v20 = type metadata accessor for ActivityDescriptor(0);
  v271 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v22 = &v254[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = type metadata accessor for ActivityScene(0);
  v24 = swift_dynamicCastClass(a1, v23);
  if (!v24)
    goto LABEL_9;
  v25 = (void *)v24;
  v264 = v13;
  v265 = v6;
  v269 = v20;
  KeyPath = swift_getKeyPath(&unk_1000341B0);
  v27 = a1;
  dispatch thunk of ActivityScene.subscript.getter(&v277, KeyPath, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey);
  swift_release(KeyPath);
  v28 = (_BYTE *)*((_QWORD *)&v277 + 1);
  if (!*((_QWORD *)&v277 + 1))
  {

LABEL_9:
    if (qword_1000589D0 != -1)
      swift_once(&qword_1000589D0, sub_10001E410);
    v48 = type metadata accessor for Logger(0);
    sub_1000163A0(v48, (uint64_t)qword_10005B250);
    v49 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(12, -1);
      v52 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v277 = v52;
      *(_DWORD *)v51 = 136315138;
      v53 = _typeName(_:qualified:)(ObjectType, 0);
      v55 = v54;
      *(_QWORD *)&v275 = sub_100030094(v53, v54, (uint64_t *)&v277);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
      swift_bridgeObjectRelease(v55);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "[%s] Did not receive activity scene with identifier.", v51, 0xCu);
      swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1, -1);
      swift_slowDealloc(v51, -1, -1);
    }
    goto LABEL_18;
  }
  v29 = v277;
  v30 = swift_getKeyPath(&unk_1000341E0);
  dispatch thunk of ActivityScene.subscript.getter(&v277, v30, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey);
  v31 = swift_release(v30);
  v32 = (void *)v277;
  if (!(_QWORD)v277)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t, __n128))(v271 + 56))(v19, 1, 1, v269, v31);
LABEL_14:
    swift_bridgeObjectRelease(v28);
    sub_100014510((uint64_t)v19, &qword_100059B58);
    if (qword_1000589D0 != -1)
      swift_once(&qword_1000589D0, sub_10001E410);
    v56 = type metadata accessor for Logger(0);
    sub_1000163A0(v56, (uint64_t)qword_10005B250);
    v49 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v57 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v49, v57))
    {

      return;
    }
    v58 = (uint8_t *)swift_slowAlloc(12, -1);
    v59 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v277 = v59;
    *(_DWORD *)v58 = 136315138;
    v60 = _typeName(_:qualified:)(ObjectType, 0);
    v62 = v61;
    *(_QWORD *)&v275 = sub_100030094(v60, v61, (uint64_t *)&v277);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
    swift_bridgeObjectRelease(v62);
    _os_log_impl((void *)&_mh_execute_header, v49, v57, "[%s] Did not receive activity scene attributes.", v58, 0xCu);
    swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v59, -1, -1);
    swift_slowDealloc(v58, -1, -1);

LABEL_18:
    return;
  }
  v260 = v29;
  v261 = v25;
  v262 = v22;
  v263 = v27;
  v33 = v271;
  v34 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t, __n128))(v271 + 56);
  v35 = 1;
  v36 = v269;
  v34(v17, 1, 1, v269, v31);
  v37 = sub_100006870(&qword_100059B60, (uint64_t (*)(uint64_t))&type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
  dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)(v32, v17, v36, v37);

  v38 = v36;
  v39 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v33 + 48);
  if (v39(v17, 1, v38) != 1)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v271 + 32))(v19, v17, v38);
    v35 = 0;
  }
  ((void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v34)(v19, v35, 1, v38);
  v40 = v39(v19, 1, v38);
  v27 = v263;
  if (v40 == 1)
    goto LABEL_14;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v271 + 32))(v262, v19, v38);
  v41 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v41, *(unsigned int *)(v41 + 48), *(unsigned __int16 *)(v41 + 52));
  v42 = JSONDecoder.init()();
  v43 = ActivityDescriptor.attributesData.getter();
  v45 = v44;
  v46 = sub_100006870((unint64_t *)&unk_100059B68, (uint64_t (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes, (uint64_t)&protocol conformance descriptor for MediaLiveActivityAttributes);
  v47 = v265;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v265, v43, v45, v265, v46);
  sub_10000A4AC(v43, v45);
  v63 = swift_release(v42);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t, __n128))(v7 + 56))(v5, 0, 1, v47, v63);
  v64 = v264;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(v264, v5, v47);
  if (qword_1000589D0 != -1)
    swift_once(&qword_1000589D0, sub_10001E410);
  v65 = type metadata accessor for Logger(0);
  v66 = sub_1000163A0(v65, (uint64_t)qword_10005B250);
  v67 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16);
  v68 = v267;
  v69 = ((uint64_t (*)(_BYTE *, _BYTE *, uint64_t))v67)(v267, v64, v47);
  v70 = Logger.logObject.getter(v69);
  v71 = static os_log_type_t.default.getter(v70);
  v72 = v71;
  v73 = os_log_type_enabled(v70, v71);
  v257 = v67;
  if (v73)
  {
    v74 = swift_slowAlloc(22, -1);
    v256 = (char *)swift_slowAlloc(64, -1);
    *(_QWORD *)&v277 = v256;
    *(_DWORD *)v74 = 136315394;
    v255 = v72;
    v75 = _typeName(_:qualified:)(ObjectType, 0);
    v76 = v66;
    v78 = v77;
    *(_QWORD *)&v275 = sub_100030094(v75, v77, (uint64_t *)&v277);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
    swift_bridgeObjectRelease(v78);
    *(_WORD *)(v74 + 12) = 2080;
    v79 = sub_100006870(&qword_100059B78, (uint64_t (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes, (uint64_t)&protocol conformance descriptor for MediaLiveActivityAttributes);
    v80 = dispatch thunk of CustomStringConvertible.description.getter(v265, v79);
    v82 = v81;
    *(_QWORD *)&v275 = sub_100030094(v80, v81, (uint64_t *)&v277);
    v66 = v76;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
    swift_bridgeObjectRelease(v82);
    v259 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v259(v68, v265);
    _os_log_impl((void *)&_mh_execute_header, v70, (os_log_type_t)v255, "[%s] Media live activity attributes: %s", (uint8_t *)v74, 0x16u);
    v83 = v256;
    swift_arrayDestroy(v256, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v83, -1, -1);
    swift_slowDealloc(v74, -1, -1);
  }
  else
  {
    v259 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v259(v68, v47);
  }

  v267 = v28;
  v84 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRActivityAttributesKeyUIContext);
  v86 = v85;
  MediaLiveActivityAttributes.subscript.getter(&v275, v84);
  swift_bridgeObjectRelease(v86);
  if (v276)
  {
    sub_1000098E4(&v275, &v277);
    swift_dynamicCast(v274, &v277, (char *)&type metadata for Any + 8, &type metadata for String, 7);
    v87 = v274[1];
    v88 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v87);
    v89 = (unint64_t)v267;
    swift_bridgeObjectRetain_n(v267, 2);
    v90 = v88;
    v91 = Logger.logObject.getter(v90);
    v92 = static os_log_type_t.default.getter(v91);
    v93 = os_log_type_enabled(v91, v92);
    v258 = (id)v66;
    if (v93)
    {
      v94 = v90;
      v95 = swift_slowAlloc(32, -1);
      v96 = swift_slowAlloc(96, -1);
      *(_QWORD *)&v277 = v96;
      *(_DWORD *)v95 = 136315650;
      v97 = _typeName(_:qualified:)(ObjectType, 0);
      v99 = v98;
      *(_QWORD *)&v275 = sub_100030094(v97, v98, (uint64_t *)&v277);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
      swift_bridgeObjectRelease(v99);
      v256 = (char *)&type metadata for Any + 8;
      *(_WORD *)(v95 + 12) = 2080;
      swift_bridgeObjectRetain(v89);
      *(_QWORD *)&v275 = sub_100030094(v260, v89, (uint64_t *)&v277);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
      swift_bridgeObjectRelease_n(v89, 3);
      *(_WORD *)(v95 + 22) = 2080;
      v100 = static String._unconditionallyBridgeFromObjectiveC(_:)(v94);
      v102 = v101;
      *(_QWORD *)&v275 = sub_100030094(v100, v101, (uint64_t *)&v277);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);

      swift_bridgeObjectRelease(v102);
      _os_log_impl((void *)&_mh_execute_header, v91, v92, "[%s] Configuring scene for identifier: %s, context: %s.", (uint8_t *)v95, 0x20u);
      swift_arrayDestroy(v96, 3, v256);
      swift_slowDealloc(v96, -1, -1);
      v103 = v95;
      v90 = v94;
      swift_slowDealloc(v103, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v89, 2);
    }
    v104 = v263;
    v105 = v261;
    v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRUIContextNowPlaying);
    v108 = v107;
    v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
    v111 = v109;
    if (v106 == v110 && v108 == v109)
    {
      v112 = swift_bridgeObjectRelease_n(v108, 2);
LABEL_33:
      if (SBUIIsSystemApertureEnabled(v112)
        && objc_msgSend(v105, "SBUI_isHostedBySystemAperture"))
      {
        swift_bridgeObjectRelease(v89);
        swift_unknownObjectWeakAssign(v268 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingScene, v105);
        v114 = objc_msgSend(objc_allocWithZone((Class)MRUActivityNowPlayingViewController), "init");
        v272 = &OBJC_PROTOCOL___SBUISystemApertureElementProviding;
        v115 = swift_dynamicCastObjCProtocolConditional(v114, 1, &v272);
        if (!v115)
        {

          v115 = 0;
        }
        v116 = v269;
        v117 = v262;
        v118 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider;
LABEL_38:
        v119 = v268;
        v120 = *(_QWORD *)(v268 + v118);
        *(_QWORD *)(v268 + v118) = v115;
        swift_unknownObjectRelease(v120);
        objc_msgSend(v261, "setSystemApertureElementViewControllerProvider:", *(_QWORD *)(v119 + v118));

LABEL_84:
        v259(v264, v265);
        (*(void (**)(_BYTE *, uint64_t))(v271 + 8))(v117, v116);
        return;
      }
      v121 = v90;
      v122 = objc_msgSend(v105, "session");
      v123 = objc_msgSend(v122, "role");

      v124 = (void *)static UISceneSessionRole.activityBanner.getter();
      v125 = static String._unconditionallyBridgeFromObjectiveC(_:)(v123);
      v127 = v126;
      v129 = static String._unconditionallyBridgeFromObjectiveC(_:)(v124);
      v130 = v128;
      if (v125 == v129 && v127 == v128)
      {

        swift_bridgeObjectRelease_n(v127, 2);
LABEL_43:
        v132 = v121;
        v133 = (unint64_t)v267;
        swift_bridgeObjectRetain(v267);
        v134 = v132;
        v135 = Logger.logObject.getter(v134);
        v136 = static os_log_type_t.default.getter(v135);
        if (os_log_type_enabled(v135, v136))
        {
          v137 = swift_slowAlloc(32, -1);
          v258 = v121;
          v138 = v137;
          v139 = swift_slowAlloc(96, -1);
          *(_QWORD *)&v277 = v139;
          *(_DWORD *)v138 = 136315650;
          v140 = _typeName(_:qualified:)(ObjectType, 0);
          v142 = v141;
          *(_QWORD *)&v275 = sub_100030094(v140, v141, (uint64_t *)&v277);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
          v143 = v142;
          v104 = v263;
          swift_bridgeObjectRelease(v143);
          *(_WORD *)(v138 + 12) = 2080;
          swift_bridgeObjectRetain(v133);
          *(_QWORD *)&v275 = sub_100030094(v260, v133, (uint64_t *)&v277);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
          swift_bridgeObjectRelease_n(v133, 3);
          *(_WORD *)(v138 + 22) = 2080;
          v144 = static String._unconditionallyBridgeFromObjectiveC(_:)(v258);
          v146 = v145;
          *(_QWORD *)&v275 = sub_100030094(v144, v145, (uint64_t *)&v277);
          v105 = v261;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);

          swift_bridgeObjectRelease(v146);
          _os_log_impl((void *)&_mh_execute_header, v135, v136, "[%s] Populating banner scene for %s, context: %s.", (uint8_t *)v138, 0x20u);
          swift_arrayDestroy(v139, 3, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v139, -1, -1);
          swift_slowDealloc(v138, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(v133, 2);
        }
        v154 = v268;
        v116 = v269;
        v117 = v262;
        swift_unknownObjectWeakAssign(v268 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene, v105);
        v155 = v105;
        v156 = objc_msgSend(objc_allocWithZone((Class)MRULockscreenViewController), "init");
        objc_msgSend(v156, "setDelegate:", v154);
        swift_unknownObjectWeakAssign(v154 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerViewController, v156);
        v157 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v155);
        objc_msgSend(v157, "setRootViewController:", v156);
        objc_msgSend(v157, "makeKeyAndVisible");
        v158 = *(void **)(v154 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow);
        *(_QWORD *)(v154 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow) = v157;

        v104 = v158;
        goto LABEL_84;
      }
      v131 = _stringCompareWithSmolCheck(_:_:expecting:)(v125, v127, v129, v128, 0);

      swift_bridgeObjectRelease(v127);
      swift_bridgeObjectRelease(v130);
      if ((v131 & 1) != 0)
        goto LABEL_43;
      v159 = objc_msgSend(v105, "session");
      v160 = objc_msgSend(v159, "role");

      v161 = (void *)static UISceneSessionRole.activityListItem.getter();
      v162 = static String._unconditionallyBridgeFromObjectiveC(_:)(v160);
      v164 = v163;
      v166 = static String._unconditionallyBridgeFromObjectiveC(_:)(v161);
      v167 = v165;
      if (v162 == v166 && v164 == v165)
      {

        swift_bridgeObjectRelease_n(v164, 2);
      }
      else
      {
        v171 = _stringCompareWithSmolCheck(_:_:expecting:)(v162, v164, v166, v165, 0);

        swift_bridgeObjectRelease(v164);
        swift_bridgeObjectRelease(v167);
        v116 = v269;
        if ((v171 & 1) == 0)
        {
          swift_bridgeObjectRelease(v267);

LABEL_72:
          v117 = v262;
          goto LABEL_84;
        }
      }
      v172 = v121;
      v173 = (unint64_t)v267;
      swift_bridgeObjectRetain(v267);
      v174 = v172;
      v175 = Logger.logObject.getter(v174);
      v176 = static os_log_type_t.default.getter(v175);
      if (os_log_type_enabled(v175, v176))
      {
        v177 = swift_slowAlloc(32, -1);
        v258 = v121;
        v178 = v177;
        v179 = swift_slowAlloc(96, -1);
        *(_QWORD *)&v277 = v179;
        *(_DWORD *)v178 = 136315650;
        v180 = _typeName(_:qualified:)(ObjectType, 0);
        v182 = v181;
        *(_QWORD *)&v275 = sub_100030094(v180, v181, (uint64_t *)&v277);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
        swift_bridgeObjectRelease(v182);
        *(_WORD *)(v178 + 12) = 2080;
        swift_bridgeObjectRetain(v173);
        *(_QWORD *)&v275 = sub_100030094(v260, v173, (uint64_t *)&v277);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
        swift_bridgeObjectRelease_n(v173, 3);
        *(_WORD *)(v178 + 22) = 2080;
        v183 = static String._unconditionallyBridgeFromObjectiveC(_:)(v258);
        v185 = v184;
        *(_QWORD *)&v275 = sub_100030094(v183, v184, (uint64_t *)&v277);
        v105 = v261;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);

        swift_bridgeObjectRelease(v185);
        _os_log_impl((void *)&_mh_execute_header, v175, v176, "[%s] Populating cover sheet scene for %s, context: %s.", (uint8_t *)v178, 0x20u);
        swift_arrayDestroy(v179, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v179, -1, -1);
        swift_slowDealloc(v178, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v173, 2);
      }
      v192 = v174;
      v193 = v268;
      swift_unknownObjectWeakAssign(v268 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene, v105);
      v194 = v105;
      v195 = objc_msgSend(objc_allocWithZone((Class)MRULockscreenViewController), "init");
      objc_msgSend(v195, "setDelegate:", v193);
      v196 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v194);
      objc_msgSend(v196, "setRootViewController:", v195);
      objc_msgSend(v196, "makeKeyAndVisible");
      v197 = *(void **)(v193 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow);
      *(_QWORD *)(v193 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetWindow) = v196;
      v198 = v196;

      v199 = objc_msgSend(v195, "nowPlayingController");
      if (qword_1000589E0 != -1)
        swift_once(&qword_1000589E0, sub_100026454);
      v200 = qword_10005B288;
      objc_msgSend(v199, "addSwiftObserver:", qword_10005B288);
      v201 = objc_msgSend(v199, "metadataController");
      v202 = objc_msgSend(v201, "artwork");

      v203 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
      v204 = *(void **)(v200 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
      *(_QWORD *)(v200 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = v202;
      v205 = v202;

      sub_10002826C();
      v206 = *(void **)(v200 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
      if (v206)
      {
        v207 = *(id *)(v200 + v203);
        v208 = v206;
        v209 = objc_msgSend(v208, "artworkView");
        objc_msgSend(v209, "setArtwork:", v207);

        v205 = v207;
      }

      v210 = *(void **)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
      *(_QWORD *)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) = v195;
      v211 = v195;

      sub_1000264E4();
      v104 = v211;
      v116 = v269;
      goto LABEL_72;
    }
    v113 = _stringCompareWithSmolCheck(_:_:expecting:)(v106, v108, v110, v109, 0);
    swift_bridgeObjectRelease(v108);
    v112 = swift_bridgeObjectRelease(v111);
    if ((v113 & 1) != 0)
      goto LABEL_33;
    swift_bridgeObjectRelease(v89);
    v147 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRUIContextScreenMirroring);
    v149 = v148;
    v151 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
    v152 = v150;
    if (v147 == v151 && v149 == v150)
    {
      v153 = swift_bridgeObjectRelease_n(v149, 2);
      v116 = v269;
      v117 = v262;
LABEL_54:
      if (SBUIIsSystemApertureEnabled(v153))
      {
        v169 = v261;
        if ((objc_msgSend(v261, "SBUI_isHostedBySystemAperture") & 1) != 0)
        {
          swift_unknownObjectWeakAssign(v268 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_screenMirroringScene, v169);
          v170 = objc_msgSend(objc_allocWithZone((Class)MRUActivityMirroringViewController), "init");
          v273 = &OBJC_PROTOCOL___SBUISystemApertureElementProviding;
          v115 = swift_dynamicCastObjCProtocolConditional(v170, 1, &v273);
          if (!v115)
          {

            v115 = 0;
          }
          v118 = OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider;
          goto LABEL_38;
        }
      }
LABEL_76:

      goto LABEL_84;
    }
    v168 = _stringCompareWithSmolCheck(_:_:expecting:)(v147, v149, v151, v150, 0);
    swift_bridgeObjectRelease(v149);
    v153 = swift_bridgeObjectRelease(v152);
    v116 = v269;
    v117 = v262;
    if ((v168 & 1) != 0)
      goto LABEL_54;
    v186 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRUIContextRouteRecommendation);
    v188 = v187;
    v190 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
    v191 = v189;
    if (v186 == v190 && v188 == v189)
    {
      swift_bridgeObjectRelease_n(v188, 2);
    }
    else
    {
      v212 = _stringCompareWithSmolCheck(_:_:expecting:)(v186, v188, v190, v189, 0);
      swift_bridgeObjectRelease(v188);
      swift_bridgeObjectRelease(v191);
      if ((v212 & 1) == 0)
        goto LABEL_76;
    }
    v213 = (void *)v268;
    swift_unknownObjectWeakAssign(v268 + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationScene, v261);
    v214 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v214, "bounds");
    v216 = v215;
    v218 = v217;
    v220 = v219;
    v222 = v221;

    v279.origin.x = v216;
    v279.origin.y = v218;
    v279.size.width = v220;
    v279.size.height = v222;
    Width = CGRectGetWidth(v279);
    v224 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
    v225 = ActivitySceneMetrics.init(size:cornerRadius:)(Width, 80.0, 0.0);
    dispatch thunk of ActivityScene.resolvedMetrics.setter(v225);
    v226 = v266;
    v227 = v265;
    v257(v266, v264, v265);
    v228 = v213;
    v229 = Logger.logObject.getter(v228);
    v230 = static os_log_type_t.default.getter(v229);
    v231 = v230;
    if (os_log_type_enabled(v229, v230))
    {
      v232 = swift_slowAlloc(32, -1);
      v268 = swift_slowAlloc(96, -1);
      *(_QWORD *)&v277 = v268;
      *(_DWORD *)v232 = 136315650;
      LODWORD(v267) = v231;
      v233 = _typeName(_:qualified:)(ObjectType, 0);
      v235 = v234;
      *(_QWORD *)&v275 = sub_100030094(v233, v234, (uint64_t *)&v277);
      v258 = v90;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
      swift_bridgeObjectRelease(v235);
      *(_WORD *)(v232 + 12) = 2080;
      v236 = sub_100006870(&qword_100059B78, (uint64_t (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes, (uint64_t)&protocol conformance descriptor for MediaLiveActivityAttributes);
      v237 = dispatch thunk of CustomStringConvertible.description.getter(v227, v236);
      v239 = v238;
      *(_QWORD *)&v275 = sub_100030094(v237, v238, (uint64_t *)&v277);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);
      swift_bridgeObjectRelease(v239);
      v90 = v258;
      v259(v226, v227);
      *(_WORD *)(v232 + 22) = 2080;
      *(_QWORD *)&v275 = v228;
      v240 = _Pointer.debugDescription.getter(&type metadata for UnsafeMutableRawPointer, &protocol witness table for UnsafeMutableRawPointer);
      v242 = v241;
      *(_QWORD *)&v275 = sub_100030094(v240, v241, (uint64_t *)&v277);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v275, (char *)&v275 + 8);

      swift_bridgeObjectRelease(v242);
      _os_log_impl((void *)&_mh_execute_header, v229, (os_log_type_t)v267, "[%s] >>+ attrs are %s (%s", (uint8_t *)v232, 0x20u);
      v243 = v268;
      swift_arrayDestroy(v268, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v243, -1, -1);
      v244 = v232;
      v104 = v263;
      swift_slowDealloc(v244, -1, -1);

    }
    else
    {
      v259(v226, v227);

    }
    v245 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRActivityAttributesKeyRouteIdentifier);
    v247 = v246;
    MediaLiveActivityAttributes.subscript.getter(&v277, v245);
    swift_bridgeObjectRelease(v247);
    if (v278)
    {
      if ((swift_dynamicCast(&v275, &v277, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v248 = *((_QWORD *)&v275 + 1);
        v249 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v248);
LABEL_83:
        v250 = objc_msgSend(objc_allocWithZone((Class)MRURouteRecommendationPlatterViewController), "initWithRouteIdentifier:", v249);

        v251 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
        v252 = objc_msgSend(v251, "initWithWindowScene:", v261);
        objc_msgSend(v252, "setRootViewController:", v250);
        objc_msgSend(v252, "makeKeyAndVisible");
        v253 = *(void **)&v228[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow];
        *(_QWORD *)&v228[OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow] = v252;

        v104 = v253;
        v116 = v269;
        goto LABEL_84;
      }
    }
    else
    {
      sub_100014510((uint64_t)&v277, &qword_100059230);
    }
    v249 = 0;
    goto LABEL_83;
  }
  __break(1u);
}

uint64_t sub_10001803C()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t sub_10001805C()
{
  return SceneSettingScopes.ActivitySettings.activityDescriptor.getter();
}

_BYTE *sub_10001807C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon);
  if (v2)
  {
    v3 = *(_BYTE **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon);
  }
  else
  {
    v4 = v0;
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
    v6 = objc_opt_self(MRGroupSessionBannerRequest);
    LOBYTE(v5) = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v5, v6, 0, 0, 0), "routeType");
    v7 = objc_allocWithZone((Class)type metadata accessor for RouteIconView());
    v8 = sub_10002A824(v5);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_100018150()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSString v10;
  id v11;
  void *v12;
  id v13;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem);
  }
  else
  {
    v4 = v0;
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
    v6 = objc_opt_self(MRGroupSessionBannerRequest);
    swift_dynamicCastObjCClassUnconditional(v5, v6, 0, 0, 0);
    swift_unknownObjectRetain(v5);
    sub_10000FB14();
    v8 = v7;
    swift_unknownObjectRelease(v5);
    v9 = objc_allocWithZone((Class)PLPillContentItem);
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    v11 = objc_msgSend(v9, "initWithText:", v10);

    v12 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v11;
    v3 = v11;

    v2 = 0;
  }
  v13 = v2;
  return v3;
}

id sub_10001824C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView);
  }
  else
  {
    v4 = sub_1000182AC(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1000182AC(uint64_t a1)
{
  _BYTE *v2;
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSString v13;
  id v14;
  id v15;
  Class isa;

  v2 = sub_10001807C();
  v3 = objc_msgSend(objc_allocWithZone((Class)PLPillView), "initWithLeadingAccessoryView:trailingAccessoryView:", v2, *(_QWORD *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon));

  LODWORD(v4) = 1144750080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v4);
  LODWORD(v5) = 1144750080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v5);
  v6 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v7 = swift_allocObject(v6, 48, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100033A80;
  *(_QWORD *)(v7 + 32) = sub_100018150();
  v8 = *(_QWORD *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
  v9 = objc_opt_self(MRGroupSessionBannerRequest);
  swift_dynamicCastObjCClassUnconditional(v8, v9, 0, 0, 0);
  swift_unknownObjectRetain(v8);
  sub_10000FD4C();
  v11 = v10;
  swift_unknownObjectRelease(v8);
  v12 = objc_allocWithZone((Class)PLPillContentItem);
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v14 = objc_msgSend(v12, "initWithText:style:", v13, 2);

  *(_QWORD *)(v7 + 40) = v14;
  specialized Array._endMutation()();
  v15 = sub_100018150();
  objc_msgSend(v3, "setReferenceContentItemForIntrinsicContentSize:", v15);

  sub_1000188BC();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v3, "setCenterContentItems:animated:", isa, 0);

  return v3;
}

id sub_1000184A8(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  *(_QWORD *)&v3[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon] = 0;
  v7 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon;
  v8 = v3;
  *(_QWORD *)&v3[v7] = sub_100007314();
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView] = 0;
  swift_unknownObjectWeakInit(&v8[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext], 0);

  v9 = &v8[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  *((_QWORD *)v9 + 1) = 0;
  v10 = swift_unknownObjectWeakInit(v9, 0);
  v11 = &v8[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(_QWORD *)v11 = 0xD000000000000017;
  *((_QWORD *)v11 + 1) = 0x8000000100039710;
  v8[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  v12 = &v8[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a1;
  *(_QWORD *)(v10 + 8) = a3;
  swift_unknownObjectWeakAssign(v10, a2);
  v22.receiver = v8;
  v22.super_class = (Class)type metadata accessor for BannerBaseViewController();
  v13 = a1;
  v14 = objc_msgSendSuper2(&v22, "initWithNibName:bundle:", 0, 0);
  v15 = sub_10001824C();
  v16 = sub_100018150();
  objc_msgSend(v15, "sizeThatFitsContentItem:", v16, v22.receiver, v22.super_class);
  v18 = v17;
  v20 = v19;

  objc_msgSend(v14, "setPreferredContentSize:", v18, v20);
  swift_unknownObjectRelease(a2);
  return v14;
}

uint64_t sub_1000187A8()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem));

  return sub_1000082F0(v0 + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext);
}

id sub_100018804()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionBannerViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GroupSessionBannerViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI32GroupSessionBannerViewController);
}

unint64_t sub_1000188BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059C38;
  if (!qword_100059C38)
  {
    v1 = objc_opt_self(PLPillContentItem);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059C38);
  }
  return result;
}

void sub_1000188F8()
{
  char *v0;
  uint64_t v1;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon] = 0;
  v1 = OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon;
  *(_QWORD *)&v0[v1] = sub_100007314();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext], 0);

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/GroupSessionBannerViewController.swift", 52, 2, 53, 0);
  __break(1u);
}

id sub_100018A9C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryImageView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccessoryImageView()
{
  return objc_opt_self(_TtC13MediaRemoteUI18AccessoryImageView);
}

uint64_t destroy for SuggestedRoute(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 64));

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 128));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 144));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 160));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 176));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 200));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 208));
}

uint64_t initializeWithCopy for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v7 = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v6;
  v9 = *(_QWORD *)(a2 + 64);
  v8 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v8;
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  v18 = *(void **)(a2 + 96);
  v22 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v18;
  *(_QWORD *)(a1 + 104) = v22;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v21 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v21;
  v20 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v20;
  v19 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v19;
  v11 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v11;
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  v12 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v12;
  v13 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 208) = v13;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v9);
  v14 = v8;
  swift_bridgeObjectRetain(v10);
  v15 = v18;
  v16 = v22;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  return a1;
}

uint64_t assignWithCopy for SuggestedRoute(uint64_t a1, uint64_t a2)
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
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v10);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v12 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  v14 = *(void **)(a1 + 72);
  v15 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v15;
  v16 = v15;

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v17 = *(_QWORD *)(a2 + 88);
  v18 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  v19 = *(void **)(a2 + 96);
  v20 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v19;
  v21 = v19;

  v22 = *(void **)(a1 + 104);
  v23 = *(void **)(a2 + 104);
  *(_QWORD *)(a1 + 104) = v23;
  v24 = v23;

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v25 = *(_QWORD *)(a2 + 128);
  v26 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v26);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v27 = *(_QWORD *)(a2 + 144);
  v28 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 144) = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  v29 = *(_QWORD *)(a2 + 160);
  v30 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 160) = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  v31 = *(_QWORD *)(a2 + 176);
  v32 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v33 = *(_QWORD *)(a2 + 200);
  v34 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v33;
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRelease(v34);
  v35 = *(_QWORD *)(a1 + 208);
  v36 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 208) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v35);
  return a1;
}

__n128 initializeWithTake for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 192) = v11;
  *(__n128 *)(a1 + 160) = result;
  return result;
}

uint64_t assignWithTake for SuggestedRoute(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v8);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 64));
  v9 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 88));
  v10 = *(void **)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);

  v11 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);

  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v12 = *(_QWORD *)(a2 + 128);
  v13 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 144);
  v15 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 160);
  v17 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v16;
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a2 + 176);
  v19 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v18;
  swift_bridgeObjectRelease(v19);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 200));
  v20 = *(_QWORD *)(a1 + 208);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  swift_bridgeObjectRelease(v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestedRoute(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 216))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SuggestedRoute(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 216) = 1;
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
    *(_BYTE *)(result + 216) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SuggestedRoute()
{
  return &type metadata for SuggestedRoute;
}

uint64_t sub_1000190DC(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[13];
  uint64_t v16;
  _OWORD v17[13];
  uint64_t v18;

  v2 = *(_OWORD *)(a1 + 176);
  v15[10] = *(_OWORD *)(a1 + 160);
  v15[11] = v2;
  v15[12] = *(_OWORD *)(a1 + 192);
  v16 = *(_QWORD *)(a1 + 208);
  v3 = *(_OWORD *)(a1 + 112);
  v15[6] = *(_OWORD *)(a1 + 96);
  v15[7] = v3;
  v4 = *(_OWORD *)(a1 + 144);
  v15[8] = *(_OWORD *)(a1 + 128);
  v15[9] = v4;
  v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v15[4] = *(_OWORD *)(a1 + 64);
  v15[5] = v6;
  v7 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v7;
  v8 = *(_OWORD *)(a2 + 176);
  v17[10] = *(_OWORD *)(a2 + 160);
  v17[11] = v8;
  v17[12] = *(_OWORD *)(a2 + 192);
  v18 = *(_QWORD *)(a2 + 208);
  v9 = *(_OWORD *)(a2 + 112);
  v17[6] = *(_OWORD *)(a2 + 96);
  v17[7] = v9;
  v10 = *(_OWORD *)(a2 + 144);
  v17[8] = *(_OWORD *)(a2 + 128);
  v17[9] = v10;
  v11 = *(_OWORD *)(a2 + 48);
  v17[2] = *(_OWORD *)(a2 + 32);
  v17[3] = v11;
  v12 = *(_OWORD *)(a2 + 80);
  v17[4] = *(_OWORD *)(a2 + 64);
  v17[5] = v12;
  v13 = *(_OWORD *)(a2 + 16);
  v17[0] = *(_OWORD *)a2;
  v17[1] = v13;
  return sub_1000197E8((uint64_t *)v15, (uint64_t)v17) & 1;
}

uint64_t sub_10001918C()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v3;
  void *v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  Swift::String v40;
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  Swift::String v45;
  Swift::String v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  Swift::String v50;
  Swift::String v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  Swift::String v55;
  uint64_t v56;
  void *v57;
  Swift::String v58;
  Swift::String v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  Swift::String v65;
  Swift::String v66;

  v1 = 0x3E656E6F6E3CLL;
  _StringGuts.grow(_:)(460);
  v2._countAndFlagsBits = 0xD00000000000002FLL;
  v2._object = (void *)0x800000010003A9E0;
  String.append(_:)(v2);
  v3 = *(_QWORD *)v0;
  v4 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain(v4);
  v5._countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v4);
  v6._object = (void *)0x800000010003AA10;
  v6._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v6);
  v7 = *(_QWORD *)(v0 + 16);
  v8 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain(v8);
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  v10._object = (void *)0x800000010003AA40;
  v10._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v10);
  v11 = *(_QWORD *)(v0 + 32);
  v12 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain(v12);
  v13._countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  v14._object = (void *)0x800000010003AA70;
  v14._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v14);
  v15 = *(_QWORD *)(v0 + 48);
  if (v15)
  {
    swift_bridgeObjectRetain(v15);
    v16 = sub_100006CE8(&qword_100059C68);
    v17 = sub_1000196D8();
    v18 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v16, v17);
    v20 = v19;
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    v20 = (void *)0xE600000000000000;
    v18 = 0x3E656E6F6E3CLL;
  }
  v21._countAndFlagsBits = v18;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(v20);
  v22._object = (void *)0x800000010003AAA0;
  v22._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v22);
  v23 = *(_QWORD *)(v0 + 64);
  if (v23)
  {
    v24 = *(_QWORD *)(v0 + 56);
    v25 = *(void **)(v0 + 64);
  }
  else
  {
    v25 = (void *)0xE600000000000000;
    v24 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain(v23);
  v26._countAndFlagsBits = v24;
  v26._object = v25;
  String.append(_:)(v26);
  swift_bridgeObjectRelease(v25);
  v27._object = (void *)0x800000010003AAD0;
  v27._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v27);
  if ((*(_BYTE *)(v0 + 112) & 1) != 0)
    v28 = 1702195828;
  else
    v28 = 0x65736C6166;
  if ((*(_BYTE *)(v0 + 112) & 1) != 0)
    v29 = 0xE400000000000000;
  else
    v29 = 0xE500000000000000;
  v30 = v29;
  String.append(_:)(*(Swift::String *)&v28);
  swift_bridgeObjectRelease(v29);
  v31._object = (void *)0x800000010003AB00;
  v31._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v31);
  v32 = *(_QWORD *)(v0 + 128);
  if (v32)
  {
    v33 = *(_QWORD *)(v0 + 120);
    v34 = *(void **)(v0 + 128);
  }
  else
  {
    v34 = (void *)0xE600000000000000;
    v33 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain(v32);
  v35._countAndFlagsBits = v33;
  v35._object = v34;
  String.append(_:)(v35);
  swift_bridgeObjectRelease(v34);
  v36._object = (void *)0x800000010003AB30;
  v36._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v36);
  v37 = *(_QWORD *)(v0 + 144);
  if (v37)
  {
    v38 = *(_QWORD *)(v0 + 136);
    v39 = *(void **)(v0 + 144);
  }
  else
  {
    v39 = (void *)0xE600000000000000;
    v38 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain(v37);
  v40._countAndFlagsBits = v38;
  v40._object = v39;
  String.append(_:)(v40);
  swift_bridgeObjectRelease(v39);
  v41._object = (void *)0x800000010003AB60;
  v41._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v41);
  v42 = *(_QWORD *)(v0 + 160);
  if (v42)
  {
    v43 = *(_QWORD *)(v0 + 152);
    v44 = *(void **)(v0 + 160);
  }
  else
  {
    v44 = (void *)0xE600000000000000;
    v43 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain(v42);
  v45._countAndFlagsBits = v43;
  v45._object = v44;
  String.append(_:)(v45);
  swift_bridgeObjectRelease(v44);
  v46._object = (void *)0x800000010003AB90;
  v46._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v46);
  v47 = *(_QWORD *)(v0 + 176);
  if (v47)
  {
    v48 = *(_QWORD *)(v0 + 168);
    v49 = *(void **)(v0 + 176);
  }
  else
  {
    v49 = (void *)0xE600000000000000;
    v48 = 0x3E656E6F6E3CLL;
  }
  swift_bridgeObjectRetain(v47);
  v50._countAndFlagsBits = v48;
  v50._object = v49;
  String.append(_:)(v50);
  swift_bridgeObjectRelease(v49);
  v51._object = (void *)0x800000010003ABC0;
  v51._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v51);
  if ((*(_BYTE *)(v0 + 184) & 1) != 0)
    v52 = 1702195828;
  else
    v52 = 0x65736C6166;
  if ((*(_BYTE *)(v0 + 184) & 1) != 0)
    v53 = 0xE400000000000000;
  else
    v53 = 0xE500000000000000;
  v54 = v53;
  String.append(_:)(*(Swift::String *)&v52);
  swift_bridgeObjectRelease(v53);
  v55._object = (void *)0x800000010003ABF0;
  v55._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v55);
  v56 = *(_QWORD *)(v0 + 192);
  v57 = *(void **)(v0 + 200);
  swift_bridgeObjectRetain(v57);
  v58._countAndFlagsBits = v56;
  v58._object = v57;
  String.append(_:)(v58);
  swift_bridgeObjectRelease(v57);
  v59._object = (void *)0x800000010003AC20;
  v59._countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v59);
  v60 = *(_QWORD *)(v0 + 208);
  if (v60)
  {
    swift_bridgeObjectRetain(v60);
    v61 = sub_100006CE8(&qword_100059C68);
    v62 = sub_1000196D8();
    v1 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v61, v62);
    v64 = v63;
    swift_bridgeObjectRelease(v60);
  }
  else
  {
    v64 = (void *)0xE600000000000000;
  }
  v65._countAndFlagsBits = v1;
  v65._object = v64;
  String.append(_:)(v65);
  swift_bridgeObjectRelease(v64);
  v66._countAndFlagsBits = 8194619;
  v66._object = (void *)0xE300000000000000;
  String.append(_:)(v66);
  return 0;
}

unint64_t sub_1000196D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059C70;
  if (!qword_100059C70)
  {
    v1 = sub_10000A3EC(&qword_100059C68);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100059C70);
  }
  return result;
}

uint64_t sub_100019724(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a2[4];
  v8 = a2[5];
  v9 = v5 == v7 && v6 == v8;
  if (v9 || (v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v7, v8, 0), result = 0, (v10 & 1) != 0))
  {
    v12 = v2 - 1;
    if (!v12)
      return 1;
    v13 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v15 = *(v13 - 1);
      v16 = *v13;
      v17 = *(i - 1);
      v18 = *i;
      v19 = v15 == v17 && v16 == v18;
      if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0) & 1) == 0)
        break;
      v13 += 2;
      if (!--v12)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000197E8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  _QWORD *v68;
  _QWORD *v69;

  v4 = *a1;
  v5 = a1[1];
  v6 = *(_QWORD *)(a2 + 8);
  v7 = v4 == *(_QWORD *)a2 && v5 == v6;
  if (v7
    || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *(_QWORD *)a2, v6, 0), result = 0, (v8 & 1) != 0))
  {
    v10 = a1[2];
    v11 = a1[3];
    v12 = *(_QWORD *)(a2 + 16);
    v13 = *(_QWORD *)(a2 + 24);
    v14 = v10 == v12 && v11 == v13;
    if (v14
      || (v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v12, v13, 0), result = 0, (v15 & 1) != 0))
    {
      if ((v16 = a1[4], v17 = a1[5], v18 = *(_QWORD *)(a2 + 32), v19 = *(_QWORD *)(a2 + 40), v16 == v18) && v17 == v19
        || (v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v18, v19, 0), result = 0, (v20 & 1) != 0))
      {
        v21 = (_QWORD *)a1[6];
        v22 = *(_QWORD **)(a2 + 48);
        if (v21)
        {
          if (!v22 || (sub_100019724(v21, v22) & 1) == 0)
            return 0;
        }
        else if (v22)
        {
          return 0;
        }
        v23 = a1[8];
        v24 = *(_QWORD *)(a2 + 64);
        if (v23)
        {
          if (!v24)
            return 0;
          v25 = a1[7];
          v26 = *(_QWORD *)(a2 + 56);
          if (v25 != v26 || v23 != v24)
          {
            v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v23, v26, v24, 0);
            result = 0;
            if ((v27 & 1) == 0)
              return result;
          }
        }
        else if (v24)
        {
          return 0;
        }
        v28 = (void *)a1[9];
        v29 = *(void **)(a2 + 72);
        if (v28)
        {
          if (!v29)
            return 0;
          sub_100008314(0, &qword_100059C88, UIImage_ptr);
          v30 = v29;
          v31 = v28;
          v32 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

          if ((v32 & 1) == 0)
            return 0;
        }
        else if (v29)
        {
          return 0;
        }
        v33 = a1[10];
        v34 = a1[11];
        v35 = *(_QWORD *)(a2 + 80);
        v36 = *(_QWORD *)(a2 + 88);
        if (v33 != v35 || v34 != v36)
        {
          v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v33, v34, v35, v36, 0);
          result = 0;
          if ((v37 & 1) == 0)
            return result;
        }
        sub_100008314(0, &qword_100059C78, NSObject_ptr);
        if ((static NSObject.== infix(_:_:)(a1[12], *(_QWORD *)(a2 + 96)) & 1) != 0)
        {
          v38 = (void *)a1[13];
          v39 = *(void **)(a2 + 104);
          if (v38)
          {
            if (!v39)
              return 0;
            sub_100008314(0, &qword_100059C80, MRUArtwork_ptr);
            v40 = v39;
            v41 = v38;
            v42 = static NSObject.== infix(_:_:)(v41, v40);

            if ((v42 & 1) == 0)
              return 0;
          }
          else if (v39)
          {
            return 0;
          }
          if (((*((unsigned __int8 *)a1 + 112) ^ *(unsigned __int8 *)(a2 + 112)) & 1) == 0)
          {
            v43 = a1[16];
            v44 = *(_QWORD *)(a2 + 128);
            if (v43)
            {
              if (!v44)
                return 0;
              v45 = a1[15];
              v46 = *(_QWORD *)(a2 + 120);
              if (v45 != v46 || v43 != v44)
              {
                v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v43, v46, v44, 0);
                result = 0;
                if ((v47 & 1) == 0)
                  return result;
              }
            }
            else if (v44)
            {
              return 0;
            }
            v48 = a1[18];
            v49 = *(_QWORD *)(a2 + 144);
            if (v48)
            {
              if (!v49)
                return 0;
              v50 = a1[17];
              v51 = *(_QWORD *)(a2 + 136);
              if (v50 != v51 || v48 != v49)
              {
                v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v48, v51, v49, 0);
                result = 0;
                if ((v52 & 1) == 0)
                  return result;
              }
            }
            else if (v49)
            {
              return 0;
            }
            v53 = a1[20];
            v54 = *(_QWORD *)(a2 + 160);
            if (v53)
            {
              if (!v54)
                return 0;
              v55 = a1[19];
              v56 = *(_QWORD *)(a2 + 152);
              if (v55 != v56 || v53 != v54)
              {
                v57 = _stringCompareWithSmolCheck(_:_:expecting:)(v55, v53, v56, v54, 0);
                result = 0;
                if ((v57 & 1) == 0)
                  return result;
              }
            }
            else if (v54)
            {
              return 0;
            }
            v58 = a1[22];
            v59 = *(_QWORD *)(a2 + 176);
            if (v58)
            {
              if (!v59)
                return 0;
              v60 = a1[21];
              v61 = *(_QWORD *)(a2 + 168);
              if (v60 != v61 || v58 != v59)
              {
                v62 = _stringCompareWithSmolCheck(_:_:expecting:)(v60, v58, v61, v59, 0);
                result = 0;
                if ((v62 & 1) == 0)
                  return result;
              }
            }
            else if (v59)
            {
              return 0;
            }
            if (((*((unsigned __int8 *)a1 + 184) ^ *(unsigned __int8 *)(a2 + 184)) & 1) == 0)
            {
              v63 = a1[24];
              v64 = a1[25];
              v65 = *(_QWORD *)(a2 + 192);
              v66 = *(_QWORD *)(a2 + 200);
              if (v63 != v65 || v64 != v66)
              {
                v67 = _stringCompareWithSmolCheck(_:_:expecting:)(v63, v64, v65, v66, 0);
                result = 0;
                if ((v67 & 1) == 0)
                  return result;
              }
              v68 = (_QWORD *)a1[26];
              v69 = *(_QWORD **)(a2 + 208);
              if (v68)
              {
                if (!v69 || (sub_100019724(v68, v69) & 1) == 0)
                  return 0;
              }
              else if (v69)
              {
                return 0;
              }
              return 1;
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

void sub_100019C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_100019D4C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8;
  NSObject *v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v8 = static os_log_type_t.default.getter(a1);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v9 = qword_10005B240;
  if (os_log_type_enabled((os_log_t)qword_10005B240, v8))
  {
    swift_bridgeObjectRetain_n(a2, 2);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v14 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_bridgeObjectRetain(a2);
    v13 = sub_100030094(a1, a2, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "[MainServer] revokeBanner %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  return sub_10002BA38(a1, a2, 0x757165722044524DLL, 0xEB00000000747365, a3, a4);
}

id sub_100019FB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id result;
  id v8;
  uint64_t v9;
  void *v10;
  NSString v11;
  Class isa;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _OWORD v18[2];
  _OWORD v19[2];

  result = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI6Client_connection), "remoteTarget");
  if (result)
  {
    v8 = result;
    _bridgeAnyObjectToAny(_:)(v18, result);
    swift_unknownObjectRelease(v8);
    sub_1000098E4(v18, v19);
    v9 = sub_100006CE8(&qword_100059EE8);
    swift_dynamicCast(&v17, v19, (char *)&type metadata for Any + 8, v9, 7);
    v10 = v17;
    v11 = String._bridgeToObjectiveC()();
    isa = UInt._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v10, "bannerWithIdentifier:postedEvent:", v11, isa);

    if (a3 == 2)
    {
      v13 = a1;
      v14 = a2;
      v15 = 0x65727020676E6F6CLL;
      v16 = 0xEC00000064657373;
    }
    else
    {
      if (a3 != 1)
        return (id)swift_unknownObjectRelease(v10);
      v13 = a1;
      v14 = a2;
      v15 = 0x646570706174;
      v16 = 0xE600000000000000;
    }
    sub_10002BA38(v13, v14, v15, v16, 0, 0);
    return (id)swift_unknownObjectRelease(v10);
  }
  __break(1u);
  return result;
}

id sub_10001A194()
{
  return sub_100010D00(0, (uint64_t (*)(void))type metadata accessor for Client);
}

uint64_t sub_10001A204()
{
  return type metadata accessor for Client(0);
}

uint64_t type metadata accessor for Client(uint64_t a1)
{
  uint64_t result;

  result = qword_100059D20;
  if (!qword_100059D20)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Client);
  return result;
}

uint64_t sub_10001A248(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10001A2C8()
{
  NSString v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[4];

  v0 = String._bridgeToObjectiveC()();
  v1 = objc_msgSend((id)objc_opt_self(BSMutableServiceInterface), "interfaceWithIdentifier:", v0);

  v2 = (void *)objc_opt_self(BSObjCProtocol);
  v3 = objc_msgSend(v2, "protocolForProtocol:", &OBJC_PROTOCOL___MRUIServerProtocol);
  objc_msgSend(v1, "setServer:", v3);

  v4 = objc_msgSend(v2, "protocolForProtocol:", &OBJC_PROTOCOL___MRUIClientProtocol);
  objc_msgSend(v1, "setClient:", v4);

  objc_msgSend(v1, "setClientMessagingExpectation:", 0);
  v5 = objc_msgSend(v1, "copy");
  _bridgeAnyObjectToAny(_:)(v9, v5);

  swift_unknownObjectRelease(v5);
  v6 = sub_100008314(0, &qword_100059EE0, BSServiceInterface_ptr);
  swift_dynamicCast(&v8, v9, (char *)&type metadata for Any + 8, v6, 7);
  return v8;
}

id sub_10001A438()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  _QWORD *v25;

  v1 = v0;
  v23 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v2 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs] = &off_100045100;
  v22 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue;
  v21 = sub_100008314(0, (unint64_t *)&qword_100059EC0, OS_dispatch_queue_ptr);
  v11 = v1;
  static DispatchQoS.userInitiated.getter();
  v25 = _swiftEmptyArrayStorage;
  v12 = sub_100006870((unint64_t *)&unk_10005A480, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v13 = sub_100006CE8((uint64_t *)&unk_100059ED0);
  v14 = sub_10001C7A0((unint64_t *)&unk_10005A490, (uint64_t *)&unk_100059ED0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v13, v14, v5, v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v23);
  v15 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000027, 0x800000010003AF40, v10, v7, v4, 0);
  *(_QWORD *)&v1[v22] = v15;
  *(_QWORD *)&v11[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients] = &_swiftEmptySetSingleton;
  v16 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface;
  *(_QWORD *)&v11[v16] = sub_10001A2C8();

  v18 = static os_log_type_t.default.getter(v17);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v18, &_mh_execute_header, qword_10005B240, "[ClientConnectionManager] init", 30, 2, _swiftEmptyArrayStorage);
  v19 = (objc_class *)type metadata accessor for ClientConnectionManager();
  v24.receiver = v11;
  v24.super_class = v19;
  return objc_msgSendSuper2(&v24, "init");
}

void sub_10001A6FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD aBlock[5];
  uint64_t v10;

  v1 = swift_allocObject(&unk_100045CB8, 32, 7);
  *(_QWORD *)(v1 + 16) = sub_10001BCC8;
  *(_QWORD *)(v1 + 24) = &v8;
  aBlock[4] = sub_10001C83C;
  v10 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001A8E8;
  aBlock[3] = &unk_100045CD0;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_opt_self(BSServiceConnectionListener);
  v4 = objc_msgSend(v3, "listenerWithConfigurator:", v2, swift_retain(v1).n128_f64[0]);
  _Block_release(v2);
  swift_release(v10);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v1, "", 0, 0, 0, 1);
  swift_release(v1);
  if ((v2 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v5 = OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener;
    v6 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener);
    *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_listener) = v4;

    v7 = *(void **)(v0 + v5);
    if (v7)
    {
      objc_msgSend(v7, "activate");
      return;
    }
  }
  __break(1u);
}

id sub_10001A83C(void *a1, uint64_t a2)
{
  NSString v4;
  NSString v5;

  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setDomain:", v4);

  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setService:", v5);

  return objc_msgSend(a1, "setDelegate:", a2);
}

uint64_t sub_10001A8EC(uint64_t a1, uint64_t a2, _QWORD *a3)
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

void sub_10001A9B0(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;

  objc_msgSend(a1, "setTargetQueue:", *(_QWORD *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue));
  v6 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  objc_msgSend(a1, "setServiceQuality:", v6);

  objc_msgSend(a1, "setInterface:", *(_QWORD *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_interface));
  objc_msgSend(a1, "setInterfaceTarget:", a3);
  v7 = swift_allocObject(&unk_100045DD0, 24, 7);
  swift_unknownObjectUnownedInit(v7 + 16, a2);
  v8 = swift_allocObject(&unk_100045DF8, 24, 7);
  swift_unknownObjectUnownedInit(v8 + 16, a3);
  v9 = swift_allocObject(&unk_100045E20, 32, 7);
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v8;
  v11[4] = sub_10001C760;
  v12 = v9;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100010784;
  v11[3] = &unk_100045E38;
  v10 = _Block_copy(v11);
  objc_msgSend(a1, "setInvalidationHandler:", v10, swift_release(v12).n128_f64[0]);
  _Block_release(v10);
}

double sub_10001AB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *Strong;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double result;
  uint64_t v21;
  _QWORD *v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v21 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (char *)swift_unknownObjectUnownedLoadStrong(a2 + 16);
  v13 = *(id *)&Strong[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue];

  v14 = swift_allocObject(&unk_100045E70, 32, 7);
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a2;
  aBlock[4] = sub_10001C798;
  v24 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011C50;
  aBlock[3] = &unk_100045E88;
  v15 = _Block_copy(aBlock);
  swift_retain(a3);
  swift_retain(a2);
  static DispatchQoS.unspecified.getter(v16);
  v22 = _swiftEmptyArrayStorage;
  v17 = sub_100006870((unint64_t *)&qword_10005A670, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v18 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v19 = sub_10001C7A0((unint64_t *)&qword_10005A680, (uint64_t *)&unk_100059E50);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v18, v19, v5, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(_QWORD *)&result = swift_release(v24).n128_u64[0];
  return result;
}

void sub_10001AD48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  os_log_type_t v5;
  NSObject *v6;
  uint8_t *v7;
  uint64_t v8;
  void *Strong;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __n128 v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a1 + 16;
  v5 = static os_log_type_t.default.getter(a1);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v6 = qword_10005B240;
  if (os_log_type_enabled((os_log_t)qword_10005B240, v5))
  {
    swift_retain_n(a1, 2);
    v19 = a2;
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v22 = v8;
    *(_DWORD *)v7 = 136446210;
    Strong = (void *)swift_unknownObjectUnownedLoadStrong(v4);
    v10 = objc_msgSend(Strong, "description");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v20 = v4;
    v13 = v12;

    v14 = v11;
    a2 = v19;
    v21 = sub_100030094(v14, v13, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    swift_release_n(a1, 2, v15);
    v16 = v13;
    v4 = v20;
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "[ClientConnectionManager] client %{public}s invalidated", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  v17 = (void *)swift_unknownObjectUnownedLoadStrong(a2 + 16);
  v18 = (void *)swift_unknownObjectUnownedLoadStrong(v4);
  sub_10001B26C(v18);

}

uint64_t sub_10001AF34(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

void sub_10001AFF0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25[3];
  Swift::Int v26;
  uint64_t v27;

  v3 = type metadata accessor for DispatchPredicate(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (uint64_t *)((char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue);
  *v6 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  v8 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)(v6);
  v9 = (*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) != 0)
  {
    LOBYTE(v6) = static os_log_type_t.default.getter(v9);
    if (qword_1000589C0 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_1000589C0, sub_10001E320);
LABEL_3:
  v10 = qword_10005B240;
  if (os_log_type_enabled((os_log_t)qword_10005B240, (os_log_type_t)v6))
  {
    v11 = a1;
    v23 = v1;
    v12 = v11;
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v24 = a1;
    v25[0] = v14;
    v15 = v14;
    *(_DWORD *)v13 = 136446210;
    v16 = v12;
    v17 = objc_msgSend(v16, "description");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v20 = v19;

    v26 = sub_100030094(v18, v20, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);

    v1 = v23;
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v6, "[ClientConnectionManager] adding client %{public}s", v13, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    v21 = v15;
    a1 = v24;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  swift_beginAccess(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients, v25, 33, 0);
  sub_10002274C(&v26, a1);
  v22 = (void *)v26;
  swift_endAccess(v25);

}

void sub_10001B26C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26[3];

  v3 = type metadata accessor for DispatchPredicate(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (uint64_t *)((char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_connectionQueue);
  *v6 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  v8 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)(v6);
  v9 = (*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) != 0)
  {
    LOBYTE(v6) = static os_log_type_t.default.getter(v9);
    if (qword_1000589C0 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once(&qword_1000589C0, sub_10001E320);
LABEL_3:
  v10 = qword_10005B240;
  if (os_log_type_enabled((os_log_t)qword_10005B240, (os_log_type_t)v6))
  {
    v11 = a1;
    v23 = v1;
    v12 = v11;
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v24 = a1;
    v15 = v14;
    v26[0] = v14;
    *(_DWORD *)v13 = 136446210;
    v16 = v12;
    v17 = objc_msgSend(v16, "description");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v20 = v19;

    v25 = sub_100030094(v18, v20, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26);

    v1 = v23;
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v6, "[ClientConnectionManager] removing client %{public}s", v13, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    v21 = v15;
    a1 = v24;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  swift_beginAccess(v1 + OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_clients, v26, 33, 0);
  v22 = (void *)sub_10001B7DC(a1);
  swift_endAccess(v26);

}

id sub_10001B4E4(uint64_t a1)
{
  return sub_100010D00(a1, type metadata accessor for ClientConnectionManager);
}

uint64_t type metadata accessor for ClientConnectionManager()
{
  return objc_opt_self(_TtC13MediaRemoteUI23ClientConnectionManager);
}

Swift::Int sub_10001B578(uint64_t a1, uint64_t a2)
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
    sub_100006CE8(&qword_100059DE0);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      v7 = v6;
      v8 = type metadata accessor for Client(0);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_100022B74(v16 + 1);
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
        v7 = __CocoaSet.Iterator.next()(result);
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

unint64_t sub_10001B75C(uint64_t a1, uint64_t a2)
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

uint64_t sub_10001B7DC(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v2 = v1;
  v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v5 = *v1;
    else
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v6 = a1;
    v7 = __CocoaSet.contains(_:)();

    if ((v7 & 1) != 0)
    {
      sub_10001B9A0(v5, (uint64_t)v6);
      v9 = v8;
      swift_bridgeObjectRelease(v4);
      return v9;
    }
LABEL_15:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  v10 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  v11 = NSObject._rawHashValue(seed:)(v10);
  v12 = -1 << *(_BYTE *)(v4 + 32);
  v13 = v11 & ~v12;
  if (((*(_QWORD *)(v4 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
    goto LABEL_15;
  type metadata accessor for Client(0);
  v14 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v13);
  v15 = static NSObject.== infix(_:_:)(v14, a1);

  if ((v15 & 1) == 0)
  {
    v16 = ~v12;
    do
    {
      v13 = (v13 + 1) & v16;
      if (((*(_QWORD *)(v4 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
        goto LABEL_15;
      v17 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v13);
      v18 = static NSObject.== infix(_:_:)(v17, a1);

    }
    while ((v18 & 1) == 0);
  }
  swift_bridgeObjectRelease(v4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v20 = *v2;
  v23 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000233F8();
    v20 = v23;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * v13);
  sub_10001BB28(v13);
  v21 = *v2;
  *v2 = v23;
  swift_bridgeObjectRelease(v21);
  return v9;
}

void sub_10001B9A0(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  Swift::Int v18;

  v3 = v2;
  swift_bridgeObjectRelease(*v3);
  v6 = __CocoaSet.count.getter(a1);
  v7 = swift_unknownObjectRetain(a1);
  v8 = sub_10001B578(v7, v6);
  v18 = v8;
  v9 = *(_QWORD *)(v8 + 40);
  swift_retain(v8);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v8 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    type metadata accessor for Client(0);
    v13 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
    v14 = static NSObject.== infix(_:_:)(v13, a2);

    if ((v14 & 1) != 0)
    {
LABEL_6:
      swift_release(v8);
      v8 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v12);
      sub_10001BB28(v12);
      if ((static NSObject.== infix(_:_:)(a2, v8) & 1) != 0)
      {
        *v3 = v18;
        return;
      }
      __break(1u);
    }
    else
    {
      v15 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v15;
        if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        v16 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
        v17 = static NSObject.== infix(_:_:)(v16, a2);

        if ((v17 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release(v8);
    __break(1u);
  }
  swift_release(v8);
  __break(1u);
}

unint64_t sub_10001BB28(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(v3 + 48);
            v17 = (_QWORD *)(v16 + 8 * v2);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v17 >= v18 + 1))
            {
              *v17 = *v18;
              v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

id sub_10001BCC8(void *a1)
{
  uint64_t v1;

  return sub_10001A83C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10001BCD0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001BCF0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10001BCF8(void *a1, uint64_t a2, void *aBlock)
{
  void *v6;
  os_log_type_t v7;
  NSObject *v8;
  id v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = _Block_copy(aBlock);
  v7 = static os_log_type_t.default.getter(v6);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v8 = qword_10005B240;
  if (os_log_type_enabled((os_log_t)qword_10005B240, v7))
  {
    v9 = a1;
    v18 = a2;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = swift_slowAlloc(32, -1);
    v20 = v17;
    *(_DWORD *)v10 = 136315138;
    v11 = objc_msgSend(v9, "requestIdentifier");
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v14 = v13;

    v15 = v12;
    a2 = v18;
    v19 = sub_100030094(v15, v14, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v8, v7, "[Client] postBanner %s", v10, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  v16 = *(_QWORD *)(a2 + OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController);
  _Block_copy(aBlock);
  sub_10002CE30(a1, v16, aBlock);
  _Block_release(aBlock);
  _Block_release(aBlock);
}

void sub_10001BEE8(uint64_t isEscapingClosureAtFileLocation)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  id v23;
  NSString v24;
  unsigned __int8 v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  id v29;
  id v30;
  char *v31;
  id v32;
  id v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void *v52;
  double v53;
  os_log_type_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 aBlock;
  __int128 v67;
  void *v68;
  uint64_t v69;
  objc_super v70;
  _QWORD *v71;
  uint64_t v72;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v63 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)isEscapingClosureAtFileLocation, "remoteProcess");
  v11 = objc_msgSend(v10, "auditToken");

  if (v11)
  {
    v60 = v7;
    v61 = v4;
    v62 = v3;
    objc_msgSend(v11, "realToken");
    v64 = v67;
    v65 = aBlock;

    aBlock = v65;
    v67 = v64;
    v13 = (id)MSVBundleIDForAuditToken(&aBlock);
    v14 = v13;
    if (v13)
    {
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v17 = v16;

      v18 = *(_QWORD **)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs];
      swift_bridgeObjectRetain(v18);
      v19 = (uint64_t)v17;
      v14 = v17;
    }
    else
    {
      v15 = 0;
      v17 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI23ClientConnectionManager_allowedBundleIDs];
      v19 = 0xE000000000000000;
      v18 = v17;
    }
    swift_bridgeObjectRetain(v17);
    v21 = sub_10001A8EC(v15, v19, v18);
    swift_bridgeObjectRelease(v18);
    v22 = swift_bridgeObjectRelease(v19);
    if ((v21 & 1) == 0)
    {
      v54 = static os_log_type_t.default.getter(v22);
      if (qword_1000589C0 != -1)
        swift_once(&qword_1000589C0, sub_10001E320);
      v55 = qword_10005B240;
      v56 = v54;
      if (os_log_type_enabled((os_log_t)qword_10005B240, v54))
      {
        swift_bridgeObjectRetain(v14);
        v57 = (uint8_t *)swift_slowAlloc(12, -1);
        v58 = swift_slowAlloc(32, -1);
        *(_QWORD *)&aBlock = v58;
        *(_DWORD *)v57 = 136315138;
        if (v14)
        {
          v59 = (unint64_t)v14;
        }
        else
        {
          v15 = 7104878;
          v59 = 0xE300000000000000;
        }
        swift_bridgeObjectRetain(v14);
        v71 = (_QWORD *)sub_100030094(v15, v59, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72);
        swift_bridgeObjectRelease_n(v14, 2);
        swift_bridgeObjectRelease(v59);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "[ClientConnectionManager] rejecting connection from unauthorized process %s", v57, 0xCu);
        swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v58, -1, -1);
        swift_slowDealloc(v57, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease(v14);
      }
      goto LABEL_24;
    }
    swift_bridgeObjectRelease(v14);
    v23 = objc_msgSend((id)isEscapingClosureAtFileLocation, "remoteProcess");
    v24 = String._bridgeToObjectiveC()();
    v25 = objc_msgSend(v23, "hasEntitlement:", v24);

    v27 = (void *)static os_log_type_t.default.getter(v26);
    if ((v25 & 1) != 0)
    {
      if (qword_1000589C0 != -1)
        swift_once(&qword_1000589C0, sub_10001E320);
      os_log(_:dso:log:_:_:)(v27, &_mh_execute_header, qword_10005B240, "[ClientConnectionManager] accepting connection", 46, 2, _swiftEmptyArrayStorage);
      v28 = (objc_class *)type metadata accessor for Client(0);
      v29 = objc_allocWithZone(v28);
      v30 = (id)isEscapingClosureAtFileLocation;
      v31 = (char *)v29;
      UUID.init()();
      *(_QWORD *)&v31[OBJC_IVAR____TtC13MediaRemoteUI6Client_connection] = v30;
      v32 = objc_allocWithZone((Class)type metadata accessor for BannerController());
      v33 = v30;
      *(_QWORD *)&v65 = v33;
      v34 = objc_msgSend(v32, "init");
      *(_QWORD *)&v31[OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController] = v34;

      v70.receiver = v31;
      v70.super_class = v28;
      v35 = (char *)objc_msgSendSuper2(&v70, "init");
      v36 = *(_QWORD *)&v35[OBJC_IVAR____TtC13MediaRemoteUI6Client_bannerController]
          + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate;
      *(_QWORD *)(v36 + 8) = &off_100045C98;
      swift_unknownObjectWeakAssign(v36, v35);

      v37 = swift_allocObject(&unk_100045D08, 32, 7);
      *(_QWORD *)(v37 + 16) = v1;
      *(_QWORD *)(v37 + 24) = v35;
      v68 = sub_10001C6D0;
      v69 = v37;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v67 = sub_100011C50;
      *((_QWORD *)&v67 + 1) = &unk_100045D20;
      v27 = _Block_copy(&aBlock);
      v38 = v1;
      v39 = v35;
      static DispatchQoS.unspecified.getter(v39);
      v71 = _swiftEmptyArrayStorage;
      v40 = sub_100006870((unint64_t *)&qword_10005A670, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v41 = sub_100006CE8((uint64_t *)&unk_100059E50);
      v42 = sub_10001C7A0((unint64_t *)&qword_10005A680, (uint64_t *)&unk_100059E50);
      v43 = v41;
      v44 = v62;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v71, v43, v42, v62, v40);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v27);
      _Block_release(v27);
      (*(void (**)(char *, uint64_t))(v61 + 8))(v6, v44);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v9, v60);
      swift_release(v69);
      v45 = swift_allocObject(&unk_100045D58, 32, 7);
      *(_QWORD *)(v45 + 16) = v38;
      *(_QWORD *)(v45 + 24) = v39;
      v46 = swift_allocObject(&unk_100045D80, 32, 7);
      *(_QWORD *)(v46 + 16) = sub_10001C720;
      *(_QWORD *)(v46 + 24) = v45;
      v68 = sub_10000C480;
      v69 = v46;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v67 = sub_10001A8E8;
      *((_QWORD *)&v67 + 1) = &unk_100045D98;
      v47 = _Block_copy(&aBlock);
      v48 = v69;
      v49 = v38;
      v50 = v39;
      swift_retain(v46);
      v51 = v48;
      v52 = (void *)v65;
      objc_msgSend((id)v65, "configureConnection:", v47, swift_release(v51).n128_f64[0]);
      _Block_release(v47);
      isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v46, "", 122, 128, 40, 1);
      *(_QWORD *)&v53 = swift_release(v46).n128_u64[0];
      if ((isEscapingClosureAtFileLocation & 1) == 0)
      {
        objc_msgSend(v52, "activate", v53);
        swift_release(v45);

        return;
      }
      __break(1u);
    }
    else if (qword_1000589C0 == -1)
    {
LABEL_22:
      os_log(_:dso:log:_:_:)(v27, &_mh_execute_header, qword_10005B240, "[ClientConnectionManager] rejecting connection from unentitled process", 70, 2, _swiftEmptyArrayStorage);
LABEL_24:
      objc_msgSend((id)isEscapingClosureAtFileLocation, "invalidate");
      return;
    }
    swift_once(&qword_1000589C0, sub_10001E320);
    goto LABEL_22;
  }
  v20 = static os_log_type_t.default.getter(v12);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, qword_10005B240, "[ClientConnectionManager] rejecting connection due to missing audit token", 73, 2, _swiftEmptyArrayStorage);
  objc_msgSend((id)isEscapingClosureAtFileLocation, "invalidate");
}

void sub_10001C6D0()
{
  uint64_t v0;

  sub_10001AFF0(*(void **)(v0 + 24));
}

uint64_t sub_10001C6F4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10001C720(void *a1)
{
  uint64_t v1;

  sub_10001A9B0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10001C728()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C738()
{
  uint64_t v0;

  swift_unknownObjectUnownedDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

double sub_10001C760(uint64_t a1)
{
  uint64_t v1;

  return sub_10001AB30(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10001C76C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10001C798()
{
  uint64_t v0;

  sub_10001AD48(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10001C7A0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000A3EC(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001C7E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001C804(uint64_t a1)
{
  uint64_t v1;

  sub_100019C0C(a1, *(_QWORD *)(v1 + 16));
}

id sub_10001C9A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC13MediaRemoteUI12SecureWindow);
}

uint64_t sub_10001C9F8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001E0F0(v0, qword_100059F80);
  sub_1000163A0(v0, (uint64_t)qword_100059F80);
  if (qword_1000589C8 != -1)
    swift_once(&qword_1000589C8, sub_10001E370);
  return Logger.init(_:)((id)qword_10005B248);
}

char *sub_10001CA78(_QWORD *a1, void *a2, _QWORD *a3, uint64_t a4, void *a5)
{
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _BYTE *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  id v33;
  id v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  __n128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __n128 v63;
  char *v64;
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD v84[4];

  v6 = v5;
  v71 = a5;
  v83 = a3;
  v66 = a2;
  v82 = type metadata accessor for Logger(0);
  v80 = *(_QWORD *)(v82 - 8);
  __chkstk_darwin(v82);
  v76 = v9;
  v78 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride(0);
  v72 = *(_QWORD *)(v10 - 8);
  v73 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006CE8((uint64_t *)&unk_10005A040);
  v68 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100006CE8((uint64_t *)&unk_100059720);
  v17 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  v70 = v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100006CE8(&qword_10005A050);
  v74 = *(_QWORD *)(v20 - 8);
  v75 = v20;
  __chkstk_darwin(v20);
  v67 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_100006CE8((uint64_t *)&unk_10005A058);
  v79 = *(_QWORD *)(v81 - 8);
  __chkstk_darwin(v81);
  v77 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables] = &_swiftEmptySetSingleton;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView] = 0;
  swift_unknownObjectWeakInit(&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext], 0);
  v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_providesHostedContent] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableBehavior] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_activeLayoutMode] = 1;
  v23 = &v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier];
  *v23 = 0;
  v23[1] = 0;
  v24 = &v5[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier];
  *v24 = 0;
  v24[1] = 0;
  v25 = OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_elementIdentifier;
  v26 = v5;
  *(_QWORD *)&v6[v25] = String._bridgeToObjectiveC()();
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_contentRole] = 1;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_maximumLayoutMode] = 4;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredLayoutMode] = 4;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredCustomLayout] = 4;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentationBehaviors] = 1;
  v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preventsAutomaticDismissal] = 1;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_leadingView] = 0;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_trailingView] = 0;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView] = 0;
  *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredHeightForBottomSafeArea] = 0x4047AAAAAAAAAAABLL;

  sub_100006D28(a1);
  swift_unknownObjectRetain(a4);
  v27 = v66;
  v28 = v83;
  v83 = a1;
  v29 = (uint64_t)a1;
  v30 = a4;
  v31 = v27;
  v32 = sub_10001E490(v29, v27, v28, v30, (uint64_t)v71);
  v71 = v28;
  v33 = objc_msgSend(v28, "configuration");
  v34 = objc_msgSend((id)objc_opt_self(UIFont), "mru_suggestedRouteActivityTitleFont");
  objc_msgSend(v33, "setFont:", v34);

  objc_msgSend(v32, "setPreferredContentSize:", 250.0, 50.0);
  v35 = objc_msgSend(*(id *)&v32[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter], "configuration");
  objc_msgSend(v32, "preferredContentSize");
  objc_msgSend(v35, "setTextBoundingWidth:");

  swift_beginAccess(&v32[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute], v84, 33, 0);
  v36 = v32;
  v37 = sub_100006CE8(&qword_100059730);
  Published.projectedValue.getter(v37);
  swift_endAccess(v84);

  v38 = sub_10000FA94(&qword_100059738, (uint64_t *)&unk_10005A040, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v39 = sub_100013234();
  Publisher<>.removeDuplicates()(v13, v38, v39);
  v40 = v15;
  v41 = v67;
  v42 = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v40, v13);
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)(v42, 0.1);
  v43 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  v84[0] = v43;
  v44 = sub_100013278();
  v45 = sub_10000FA94(&qword_100059750, (uint64_t *)&unk_100059720, (uint64_t)&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
  v46 = sub_1000132B4();
  v47 = v69;
  Publisher.throttle<A>(for:scheduler:latest:)(v12, v84, 1, v69, v44, v45, v46);

  (*(void (**)(char *, uint64_t))(v72 + 8))(v12, v73);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v19, v47);
  if (qword_1000589B8 != -1)
    swift_once(&qword_1000589B8, sub_10001C9F8);
  v48 = v82;
  v49 = sub_1000163A0(v82, (uint64_t)qword_100059F80);
  v50 = v80;
  v51 = v78;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v78, v49, v48);
  v52 = *(unsigned __int8 *)(v50 + 80);
  v53 = (v52 + 16) & ~v52;
  v54 = swift_allocObject(&unk_100045F18, v53 + v76, v52 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(v54 + v53, v51, v48);
  v55 = sub_10000FA94((unint64_t *)&unk_100059760, &qword_10005A050, (uint64_t)&protocol conformance descriptor for Publishers.Throttle<A, B>);
  v56 = v75;
  v57 = v77;
  Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)(0, 0, sub_10001E088, v54, 0, 0, 0, 0, 0, 0, v75, v55);
  v58 = swift_release(v54);
  (*(void (**)(char *, uint64_t, __n128))(v74 + 8))(v41, v56, v58);
  v59 = swift_allocObject(&unk_100045F40, 24, 7);
  swift_unknownObjectWeakInit(v59 + 16, v36);
  v60 = sub_10000FA94(&qword_10005A068, (uint64_t *)&unk_10005A058, (uint64_t)&protocol conformance descriptor for Publishers.HandleEvents<A>);
  v61 = v81;
  v62 = Publisher<>.sink(receiveValue:)(sub_10001E0E8, v59, v81, v60);
  v63 = swift_release(v59);
  (*(void (**)(char *, uint64_t, __n128))(v79 + 8))(v57, v61, v63);
  v64 = &v36[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables];
  swift_beginAccess(&v36[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables], v84, 33, 0);
  AnyCancellable.store(in:)(v64);
  swift_endAccess(v84);

  swift_unknownObjectRelease(v30);
  sub_100006E80(v83);
  swift_release(v62);

  return v36;
}

void sub_10001D1EC(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _QWORD *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[13];
  uint64_t v18;

  v1 = *(_OWORD *)(a1 + 176);
  v17[10] = *(_OWORD *)(a1 + 160);
  v17[11] = v1;
  v17[12] = *(_OWORD *)(a1 + 192);
  v18 = *(_QWORD *)(a1 + 208);
  v2 = *(_OWORD *)(a1 + 112);
  v17[6] = *(_OWORD *)(a1 + 96);
  v17[7] = v2;
  v3 = *(_OWORD *)(a1 + 144);
  v17[8] = *(_OWORD *)(a1 + 128);
  v17[9] = v3;
  v4 = *(_OWORD *)(a1 + 48);
  v17[2] = *(_OWORD *)(a1 + 32);
  v17[3] = v4;
  v5 = *(_OWORD *)(a1 + 80);
  v17[4] = *(_OWORD *)(a1 + 64);
  v17[5] = v5;
  v6 = *(_OWORD *)(a1 + 16);
  v17[0] = *(_OWORD *)a1;
  v17[1] = v6;
  sub_100006D28(v17);
  v7 = sub_100006D28(v17);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    sub_100006D28(v17);
    v12 = sub_10001918C();
    v14 = v13;
    sub_100006E80(v17);
    v15 = sub_100030094(v12, v14, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
    swift_bridgeObjectRelease(v14);
    sub_100006E80(v17);
    sub_100006E80(v17);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[BannerDebug] will update view with %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    sub_100006E80(v17);
    sub_100006E80(v17);
  }
}

void sub_10001D3B8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Strong;
  void *v11;
  char *v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[13];
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  _OWORD v79[13];
  uint64_t v80;
  _BYTE v81[24];
  _BYTE v82[216];
  _OWORD v83[13];
  uint64_t v84;
  _OWORD v85[13];
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v2 = a1[11];
  v97 = a1[10];
  v98 = v2;
  v99 = a1[12];
  v100 = *((_QWORD *)a1 + 26);
  v3 = a1[7];
  v93 = a1[6];
  v94 = v3;
  v4 = a1[9];
  v95 = a1[8];
  v96 = v4;
  v5 = a1[3];
  v89 = a1[2];
  v90 = v5;
  v6 = a1[5];
  v91 = a1[4];
  v92 = v6;
  v7 = a1[1];
  v8 = a2 + 16;
  v87 = *a1;
  v88 = v7;
  swift_beginAccess(a2 + 16, v81, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v8, v9);
  if (Strong)
  {
    v11 = (void *)Strong;
    sub_10001E934();
    v12 = sub_10001D684();
    v13 = &v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
    v14 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 16];
    v85[0] = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
    v85[1] = v14;
    v15 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 64];
    v17 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 32];
    v16 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 48];
    v85[5] = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 80];
    v85[4] = v15;
    v85[2] = v17;
    v85[3] = v16;
    v18 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 128];
    v20 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96];
    v19 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112];
    v85[9] = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 144];
    v85[8] = v18;
    v85[6] = v20;
    v85[7] = v19;
    v22 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 176];
    v21 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 192];
    v23 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 160];
    v86 = *(_QWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 208];
    v85[12] = v21;
    v85[10] = v23;
    v85[11] = v22;
    v24 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 176];
    v25 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 192];
    v26 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 144];
    v75 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 160];
    v76 = v24;
    v77 = v25;
    v78 = *(_QWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 208];
    v27 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112];
    v28 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 128];
    v29 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 80];
    v71 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96];
    v72 = v27;
    v73 = v28;
    v74 = v26;
    v30 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 48];
    v31 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 64];
    v32 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 16];
    v67 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 32];
    v68 = v30;
    v69 = v31;
    v70 = v29;
    v33 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 16];
    v65 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
    v66 = v33;
    v79[0] = v65;
    v79[1] = v32;
    v34 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 32];
    v35 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 48];
    v36 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 80];
    v79[4] = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 64];
    v79[5] = v36;
    v79[2] = v34;
    v79[3] = v35;
    v37 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 96];
    v38 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 112];
    v39 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 144];
    v79[8] = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 128];
    v79[9] = v39;
    v79[6] = v37;
    v79[7] = v38;
    v40 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 160];
    v41 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 176];
    v42 = *(_OWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 192];
    v80 = *(_QWORD *)&v12[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute + 208];
    v79[11] = v41;
    v79[12] = v42;
    v79[10] = v40;
    v43 = v88;
    *(_OWORD *)v13 = v87;
    *((_OWORD *)v13 + 1) = v43;
    v44 = v89;
    v45 = v90;
    v46 = v92;
    *((_OWORD *)v13 + 4) = v91;
    *((_OWORD *)v13 + 5) = v46;
    *((_OWORD *)v13 + 2) = v44;
    *((_OWORD *)v13 + 3) = v45;
    v47 = v93;
    v48 = v94;
    v49 = v96;
    *((_OWORD *)v13 + 8) = v95;
    *((_OWORD *)v13 + 9) = v49;
    *((_OWORD *)v13 + 6) = v47;
    *((_OWORD *)v13 + 7) = v48;
    v50 = v97;
    v51 = v98;
    v52 = v99;
    *((_QWORD *)v13 + 26) = v100;
    *((_OWORD *)v13 + 11) = v51;
    *((_OWORD *)v13 + 12) = v52;
    *((_OWORD *)v13 + 10) = v50;
    sub_100006D28(&v87);
    sub_100006D28(&v87);
    sub_100006D28(v85);
    sub_100006E80(v79);
    v53 = *((_OWORD *)v13 + 1);
    v83[0] = *(_OWORD *)v13;
    v83[1] = v53;
    v54 = *((_OWORD *)v13 + 5);
    v56 = *((_OWORD *)v13 + 2);
    v55 = *((_OWORD *)v13 + 3);
    v83[4] = *((_OWORD *)v13 + 4);
    v83[5] = v54;
    v83[2] = v56;
    v83[3] = v55;
    v57 = *((_OWORD *)v13 + 8);
    v59 = *((_OWORD *)v13 + 6);
    v58 = *((_OWORD *)v13 + 7);
    v83[9] = *((_OWORD *)v13 + 9);
    v83[8] = v57;
    v83[6] = v59;
    v83[7] = v58;
    v61 = *((_OWORD *)v13 + 11);
    v60 = *((_OWORD *)v13 + 12);
    v62 = *((_OWORD *)v13 + 10);
    v84 = *((_QWORD *)v13 + 26);
    v83[12] = v60;
    v83[10] = v62;
    v83[11] = v61;
    sub_100006D28(v83);
    LOBYTE(v13) = sub_1000197E8((uint64_t *)v83, (uint64_t)v85);
    sub_100006E80(v83);
    if ((v13 & 1) == 0)
    {
      v63[10] = v75;
      v63[11] = v76;
      v63[12] = v77;
      v64 = v78;
      v63[6] = v71;
      v63[7] = v72;
      v63[8] = v73;
      v63[9] = v74;
      v63[2] = v67;
      v63[3] = v68;
      v63[4] = v69;
      v63[5] = v70;
      v63[0] = v65;
      v63[1] = v66;
      nullsub_2(v63);
      sub_100006E38((uint64_t)v63, (uint64_t)v82);
      sub_10000BA5C((uint64_t)v82, 1);
    }
    sub_100006E80(&v87);
    sub_100006E80(v85);

  }
}

char *sub_10001D684()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  _OWORD v12[13];
  uint64_t v13;
  _OWORD v14[13];
  uint64_t v15;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView);
  if (v2)
  {
    v3 = *(char **)(v0
                  + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView);
  }
  else
  {
    v4 = v0;
    KeyPath = swift_getKeyPath(&unk_100034420);
    v6 = swift_getKeyPath(&unk_100034448);
    static Published.subscript.getter(v12, v4, KeyPath, v6);
    swift_release(KeyPath);
    swift_release(v6);
    v14[10] = v12[10];
    v14[11] = v12[11];
    v14[12] = v12[12];
    v15 = v13;
    v14[6] = v12[6];
    v14[7] = v12[7];
    v14[8] = v12[8];
    v14[9] = v12[9];
    v14[2] = v12[2];
    v14[3] = v12[3];
    v14[4] = v12[4];
    v14[5] = v12[5];
    v14[0] = v12[0];
    v14[1] = v12[1];
    v7 = *(_QWORD *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
    objc_allocWithZone((Class)type metadata accessor for SuggestedRouteSystemApertureView(0));
    swift_unknownObjectRetain(v7);
    v8 = sub_10000A59C((uint64_t)v14, v7);
    v9 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

void sub_10001D814()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  char *v22;
  char *v23;
  id v24;
  void *v25;
  id v26;
  char *v27;
  id v28;
  _BYTE v30[24];
  objc_super v31;

  v1 = v0;
  v2 = sub_100006CE8(&qword_100059778);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v30[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_100006CE8((uint64_t *)&unk_10005A080);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = (objc_class *)type metadata accessor for SuggestedRouteSystemApertureViewController(0);
  v31.receiver = v0;
  v31.super_class = v10;
  objc_msgSendSuper2(&v31, "viewDidLoad");
  v11 = objc_msgSend(v0, "view");
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithWhite:alpha:", 0.01, 1.0);
    objc_msgSend(v12, "setBackgroundColor:", v13);

    v14 = sub_10001D684();
    swift_beginAccess(&v14[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth], v30, 33, 0);
    v15 = sub_100006CE8((uint64_t *)&unk_100058B80);
    Published.projectedValue.getter(v15);
    swift_endAccess(v30);

    v16 = sub_10000FA94(&qword_10005A090, &qword_100059778, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
    v17 = sub_10001E2CC();
    Publisher<>.removeDuplicates()(v2, v16, v17);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    v18 = swift_allocObject(&unk_100045F40, 24, 7);
    swift_unknownObjectWeakInit(v18 + 16, v1);
    v19 = sub_10000FA94((unint64_t *)&unk_10005A0A0, (uint64_t *)&unk_10005A080, (uint64_t)&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
    v20 = Publisher<>.sink(receiveValue:)(sub_10001E310, v18, v6, v19);
    v21 = swift_release(v18);
    (*(void (**)(_BYTE *, uint64_t, __n128))(v7 + 8))(v9, v6, v21);
    v22 = &v1[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables];
    swift_beginAccess(&v1[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables], v30, 33, 0);
    AnyCancellable.store(in:)(v22);
    swift_endAccess(v30);
    swift_release(v20);
    v23 = sub_10001D684();
    v24 = *(id *)&v23[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView];

    v25 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView];
    *(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView] = v24;
    v26 = v24;

    sub_10001E934();
    v27 = sub_10001D684();
    v28 = *(id *)&v27[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton];

    objc_msgSend(v28, "addTarget:action:forControlEvents:", v1, "actionButtonTappedWithSender:", 64);
  }
  else
  {
    __break(1u);
  }
}

void sub_10001DB38(double *a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  id v7;
  _BYTE v8[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3, v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = objc_msgSend(*(id *)(Strong + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter), "configuration");
    objc_msgSend(v7, "setTextBoundingWidth:", v2);

    sub_10001F0F0();
  }
}

id sub_10001DC98(uint64_t a1, uint64_t a2, _QWORD *a3)
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

void sub_10001DDC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView));
  sub_1000082F0(v0 + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext);
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier
                                      + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier
                                      + 8));

}

id sub_10001DE6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteSystemApertureViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001DF50()
{
  return type metadata accessor for SuggestedRouteSystemApertureViewController(0);
}

uint64_t type metadata accessor for SuggestedRouteSystemApertureViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100059FD0;
  if (!qword_100059FD0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SuggestedRouteSystemApertureViewController);
  return result;
}

uint64_t sub_10001DF94(uint64_t a1)
{
  _QWORD v2[19];

  v2[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[1] = "\b";
  v2[2] = &unk_1000343C8;
  v2[3] = &unk_1000343E0;
  v2[4] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[5] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[6] = &unk_1000343F8;
  v2[7] = &unk_1000343F8;
  v2[8] = "\b";
  v2[9] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[10] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[11] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[12] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[13] = (char *)&value witness table for Builtin.Int64 + 64;
  v2[14] = &unk_1000343E0;
  v2[15] = "\b";
  v2[16] = "\b";
  v2[17] = "\b";
  v2[18] = (char *)&value witness table for Builtin.Int64 + 64;
  return swift_updateClassMetadata2(a1, 256, 19, v2, a1 + 512);
}

uint64_t sub_10001E028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10001E088(uint64_t a1)
{
  type metadata accessor for Logger(0);
  sub_10001D1EC(a1);
}

uint64_t sub_10001E0C4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001E0E8(__int128 *a1)
{
  uint64_t v1;

  sub_10001D3B8(a1, v1);
}

uint64_t *sub_10001E0F0(uint64_t a1, uint64_t *a2)
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

void sub_10001E138()
{
  _BYTE *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_cancellables] = &_swiftEmptySetSingleton;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController____lazy_storage___customView] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableContext], 0);
  v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_providesHostedContent] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentableBehavior] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_activeLayoutMode] = 1;
  v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedAppBundleIdentifier];
  *v1 = 0;
  v1[1] = 0;
  v2 = &v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_associatedScenePersistenceIdentifier];
  *v2 = 0;
  v2[1] = 0;
  v3 = OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_elementIdentifier;
  *(_QWORD *)&v0[v3] = String._bridgeToObjectiveC()();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_contentRole] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_maximumLayoutMode] = 4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredLayoutMode] = 4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredCustomLayout] = 4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_presentationBehaviors] = 1;
  v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preventsAutomaticDismissal] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_leadingView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_trailingView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_minimalView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI42SuggestedRouteSystemApertureViewController_preferredHeightForBottomSafeArea] = 0x4047AAAAAAAAAAABLL;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteSystemApertureViewController.swift", 62, 2, 114, 0);
  __break(1u);
}

unint64_t sub_10001E2CC()
{
  unint64_t result;

  result = qword_10005A098;
  if (!qword_10005A098)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_10005A098);
  }
  return result;
}

void sub_10001E310(double *a1)
{
  uint64_t v1;

  sub_10001DB38(a1, v1);
}

uint64_t sub_10001E320()
{
  uint64_t result;

  sub_10001E3D4();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000019, 0x800000010003B390, 18773, 0xE200000000000000);
  qword_10005B240 = result;
  return result;
}

uint64_t sub_10001E370()
{
  uint64_t result;

  sub_10001E3D4();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000019, 0x800000010003B390, 0xD000000000000013, 0x800000010003B3B0);
  qword_10005B248 = result;
  return result;
}

unint64_t sub_10001E3D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A0B0;
  if (!qword_10005A0B0)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005A0B0);
  }
  return result;
}

uint64_t sub_10001E410()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001E0F0(v0, qword_10005B250);
  sub_1000163A0(v0, (uint64_t)qword_10005B250);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return Logger.init(_:)((id)qword_10005B240);
}

char *sub_10001E490(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char *v17;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  id v28;
  char *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  BOOL v33;
  char **v34;
  void *v35;
  char *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  id v41;
  id v42;
  uint64_t KeyPath;
  uint64_t v44;
  void (*v45)(_OWORD *, _QWORD);
  uint64_t v46;
  void *v47;
  id v49;
  objc_super v50;
  _OWORD v51[13];
  uint64_t v52;
  _BYTE v53[32];

  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView] = 0;
  swift_beginAccess(&v5[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute], v53, 33, 0);
  v11 = *(_OWORD *)(a1 + 176);
  v51[10] = *(_OWORD *)(a1 + 160);
  v51[11] = v11;
  v51[12] = *(_OWORD *)(a1 + 192);
  v52 = *(_QWORD *)(a1 + 208);
  v12 = *(_OWORD *)(a1 + 112);
  v51[6] = *(_OWORD *)(a1 + 96);
  v51[7] = v12;
  v13 = *(_OWORD *)(a1 + 144);
  v51[8] = *(_OWORD *)(a1 + 128);
  v51[9] = v13;
  v14 = *(_OWORD *)(a1 + 48);
  v51[2] = *(_OWORD *)(a1 + 32);
  v51[3] = v14;
  v15 = *(_OWORD *)(a1 + 80);
  v51[4] = *(_OWORD *)(a1 + 64);
  v51[5] = v15;
  v16 = *(_OWORD *)(a1 + 16);
  v51[0] = *(_OWORD *)a1;
  v51[1] = v16;
  v17 = v5;
  sub_100006D28((_QWORD *)a1);
  Published.init(initialValue:)(v51, &type metadata for SuggestedRoute);
  swift_endAccess(v53);
  v18 = *(_QWORD *)(a1 + 24);
  v19 = objc_allocWithZone((Class)MRUEndpointController);
  swift_bridgeObjectRetain(v18);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  v21 = objc_msgSend(v19, "initWithRouteUID:client:player:", v20, 0, 0);

  *(_QWORD *)&v17[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_endpointController] = v21;
  v22 = objc_msgSend(objc_allocWithZone((Class)MRUNowPlayingController), "initWithEndpointController:", v21);
  *(_QWORD *)&v17[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller] = v22;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter] = a3;
  v49 = a3;

  v23 = &v17[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  *((_QWORD *)v23 + 1) = 0;
  v24 = swift_unknownObjectWeakInit(v23, 0);
  v25 = &v17[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(_QWORD *)v25 = 0xD000000000000017;
  *((_QWORD *)v25 + 1) = 0x8000000100039710;
  v17[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  v26 = &v17[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(_QWORD *)v26 = 0;
  v26[8] = 1;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(_QWORD *)&v17[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a2;
  *(_QWORD *)(v24 + 8) = a5;
  v27 = a4;
  swift_unknownObjectWeakAssign(v24, a4);
  v50.receiver = v17;
  v50.super_class = (Class)type metadata accessor for BannerBaseViewController();
  v28 = a2;
  v29 = (char *)objc_msgSendSuper2(&v50, "initWithNibName:bundle:", 0, 0);
  v30 = OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller;
  v31 = *(void **)&v29[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller];
  v32 = v29;
  objc_msgSend(v31, "addObserver:", v32);
  objc_msgSend(v31, "updateAutomaticResponseLoading");
  v33 = objc_msgSend(v28, "bannerType") == 0;
  v32[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = v33;
  if (v33)
    v34 = &selRef_oneTapSuggestionInactiveTimeout;
  else
    v34 = &selRef_autoRouteInactiveTimeout;
  v35 = (void *)objc_opt_self(MRSharedSettings);
  v36 = v32;
  v37 = objc_msgSend(v35, "currentSettings");
  objc_msgSend(v37, *v34);
  v39 = v38;

  v40 = &v36[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(_QWORD *)v40 = v39;
  v40[8] = 0;

  sub_10001F0F0();
  v41 = objc_msgSend(*(id *)&v29[v30], "metadataController");
  v42 = objc_msgSend(v41, "artwork");

  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v44 = swift_getKeyPath(&unk_1000344E8);
  v45 = (void (*)(_OWORD *, _QWORD))static Published.subscript.modify(v51, v36, KeyPath, v44);
  v47 = *(void **)(v46 + 104);
  *(_QWORD *)(v46 + 104) = v42;

  v45(v51, 0);
  swift_release(KeyPath);
  swift_release(v44);
  sub_10001F450();

  swift_unknownObjectRelease(v27);
  sub_100006E80((_QWORD *)a1);

  return v36;
}

double sub_10001E884@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  _OWORD v12[13];
  uint64_t v13;

  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v4 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(v12, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v5 = v12[11];
  *(_OWORD *)(a1 + 160) = v12[10];
  *(_OWORD *)(a1 + 176) = v5;
  *(_OWORD *)(a1 + 192) = v12[12];
  *(_QWORD *)(a1 + 208) = v13;
  v6 = v12[7];
  *(_OWORD *)(a1 + 96) = v12[6];
  *(_OWORD *)(a1 + 112) = v6;
  v7 = v12[9];
  *(_OWORD *)(a1 + 128) = v12[8];
  *(_OWORD *)(a1 + 144) = v7;
  v8 = v12[3];
  *(_OWORD *)(a1 + 32) = v12[2];
  *(_OWORD *)(a1 + 48) = v8;
  v9 = v12[5];
  *(_OWORD *)(a1 + 64) = v12[4];
  *(_OWORD *)(a1 + 80) = v9;
  result = *(double *)v12;
  v11 = v12[1];
  *(_OWORD *)a1 = v12[0];
  *(_OWORD *)(a1 + 16) = v11;
  return result;
}

void sub_10001E934()
{
  char *v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSString v10;
  NSString v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSString v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[13];
  uint64_t v42;
  _OWORD v43[7];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 aBlock;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  _OWORD v93[13];
  uint64_t v94;

  v1 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView];
  if (!v1)
    return;
  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v3 = swift_getKeyPath(&unk_1000344E8);
  v4 = v1;
  static Published.subscript.getter(&v79, v0, KeyPath, v3);
  swift_release(KeyPath);
  swift_release(v3);
  v93[10] = v89;
  v93[11] = v90;
  v93[12] = v91;
  v94 = v92;
  v93[6] = v85;
  v93[7] = v86;
  v93[8] = v87;
  v93[9] = v88;
  v93[2] = v81;
  v93[3] = v82;
  v93[4] = v83;
  v93[5] = v84;
  v93[0] = v79;
  v93[1] = v80;
  v5 = v89;
  swift_bridgeObjectRetain(v89);
  sub_100006E80(v93);
  if (!v5)
    goto LABEL_6;
  v6 = swift_getKeyPath(&unk_1000344C0);
  v7 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(&aBlock, v0, v6, v7);
  swift_release(v6);
  swift_release(v7);
  v89 = v75;
  v90 = v76;
  v91 = v77;
  v92 = v78;
  v85 = v71;
  v86 = v72;
  v87 = v73;
  v88 = v74;
  v81 = v67;
  v82 = v68;
  v83 = v69;
  v84 = v70;
  v79 = aBlock;
  v80 = v66;
  v8 = v76;
  swift_bridgeObjectRetain(v76);
  sub_100006E80(&v79);
  if (!v8)
  {
    swift_bridgeObjectRelease(v5);
LABEL_6:
    v17 = objc_msgSend(v4, "deviceIconView");
    v18 = swift_getKeyPath(&unk_1000344C0);
    v19 = swift_getKeyPath(&unk_1000344E8);
    static Published.subscript.getter(&aBlock, v0, v18, v19);
    swift_release(v18);
    swift_release(v19);
    v89 = v75;
    v90 = v76;
    v91 = v77;
    v92 = v78;
    v85 = v71;
    v86 = v72;
    v87 = v73;
    v88 = v74;
    v81 = v67;
    v82 = v68;
    v83 = v69;
    v84 = v70;
    v79 = aBlock;
    v80 = v66;
    v20 = *((_QWORD *)&v69 + 1);
    v21 = *((id *)&v69 + 1);
    sub_100006E80(&v79);
    if (!v20)
    {
      v22 = String._bridgeToObjectiveC()();
      v21 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v22);

    }
    objc_msgSend(v17, "setImage:", v21);

    goto LABEL_9;
  }
  v9 = objc_msgSend((id)objc_opt_self(MRUAssetManager), "sharedManager");
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v12 = swift_allocObject(&unk_100045F80, 32, 7);
  *(_QWORD *)(v12 + 16) = v4;
  *(_QWORD *)(v12 + 24) = v0;
  *(_QWORD *)&v67 = sub_1000200A0;
  *((_QWORD *)&v67 + 1) = v12;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v66 = sub_100010988;
  *((_QWORD *)&v66 + 1) = &unk_100045F98;
  v13 = _Block_copy(&aBlock);
  v14 = *((_QWORD *)&v67 + 1);
  v15 = v4;
  v16 = v0;
  swift_release(v14);
  objc_msgSend(v9, "imageForModelIdentifier:color:completion:", v10, v11, v13);
  _Block_release(v13);

LABEL_9:
  v23 = swift_getKeyPath(&unk_1000344C0);
  v24 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(&aBlock, v0, v23, v24);
  swift_release(v23);
  swift_release(v24);
  v89 = v75;
  v90 = v76;
  v91 = v77;
  v92 = v78;
  v85 = v71;
  v86 = v72;
  v87 = v73;
  v88 = v74;
  v81 = v67;
  v82 = v68;
  v83 = v69;
  v84 = v70;
  v79 = aBlock;
  v80 = v66;
  sub_100006E80(&v79);
  if (v86 == 1)
  {
    v25 = swift_getKeyPath(&unk_1000344C0);
    v26 = swift_getKeyPath(&unk_1000344E8);
    static Published.subscript.getter(&v51, v0, v25, v26);
    swift_release(v25);
    swift_release(v26);
    v75 = v61;
    v76 = v62;
    v77 = v63;
    v78 = v64;
    v71 = v57;
    v72 = v58;
    v73 = v59;
    v74 = v60;
    v67 = v53;
    v68 = v54;
    v69 = v55;
    v70 = v56;
    aBlock = v51;
    v66 = v52;
    v27 = *((_QWORD *)&v57 + 1);
    v28 = *((id *)&v57 + 1);
    sub_100006E80(&aBlock);
    if (v27)
    {
      v29 = objc_msgSend(v4, "artworkView");
      objc_msgSend(v29, "setArtwork:", v28);

    }
  }
  v30 = swift_getKeyPath(&unk_1000344C0);
  v31 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(&v51, v0, v30, v31);
  swift_release(v30);
  swift_release(v31);
  v75 = v61;
  v76 = v62;
  v77 = v63;
  v78 = v64;
  v71 = v57;
  v72 = v58;
  v73 = v59;
  v74 = v60;
  v67 = v53;
  v68 = v54;
  v69 = v55;
  v70 = v56;
  aBlock = v51;
  v66 = v52;
  v32 = v60;
  swift_bridgeObjectRetain(v60);
  sub_100006E80(&aBlock);
  if (v32)
  {
    v33 = objc_msgSend(v4, "artworkView");
    v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v32);
    objc_msgSend(v33, "setItemIdentifier:", v34);

  }
  v35 = objc_msgSend(v4, "artworkView");
  v36 = swift_getKeyPath(&unk_1000344C0);
  v37 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(&v51, v0, v36, v37);
  swift_release(v36);
  swift_release(v37);
  v47 = v61;
  v48 = v62;
  v49 = v63;
  v50 = v64;
  v43[6] = v57;
  v44 = v58;
  v45 = v59;
  v46 = v60;
  v43[2] = v53;
  v43[3] = v54;
  v43[4] = v55;
  v43[5] = v56;
  v43[0] = v51;
  v43[1] = v52;
  sub_100006E80(v43);
  objc_msgSend(v35, "setHidden:", (v44 & 1) == 0);

  v38 = objc_msgSend(v4, "artworkView");
  v39 = swift_getKeyPath(&unk_1000344C0);
  v40 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(v41, v0, v39, v40);
  swift_release(v39);
  swift_release(v40);
  v61 = v41[10];
  v62 = v41[11];
  v63 = v41[12];
  v64 = v42;
  v57 = v41[6];
  v58 = v41[7];
  v59 = v41[8];
  v60 = v41[9];
  v53 = v41[2];
  v54 = v41[3];
  v55 = v41[4];
  v56 = v41[5];
  v51 = v41[0];
  v52 = v41[1];
  sub_100006E80(&v51);
  objc_msgSend(v38, "setPlaying:", v58);

}

_QWORD *sub_10001F0F0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  void *v5;
  Class isa;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_OWORD *, _QWORD);
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _OWORD v28[13];
  uint64_t v29;

  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v2 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(v16, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v28[10] = v24;
  v28[11] = v25;
  v28[12] = v26;
  v29 = v27;
  v28[6] = v20;
  v28[7] = v21;
  v28[8] = v22;
  v28[9] = v23;
  v28[2] = v16[2];
  v28[3] = v17;
  v28[4] = v18;
  v28[5] = v19;
  v28[0] = v16[0];
  v28[1] = v16[1];
  v3 = v17;
  swift_bridgeObjectRetain(v17);
  result = sub_100006E80(v28);
  if (v3)
  {
    v5 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
    v7 = objc_msgSend(v5, "textForRouteNames:", isa);

    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v10 = v9;

    v11 = swift_getKeyPath(&unk_1000344C0);
    v12 = swift_getKeyPath(&unk_1000344E8);
    v13 = (void (*)(_OWORD *, _QWORD))static Published.subscript.modify(v16, v0, v11, v12);
    v15 = *(_QWORD *)(v14 + 40);
    *(_QWORD *)(v14 + 32) = v8;
    *(_QWORD *)(v14 + 40) = v10;
    swift_bridgeObjectRelease(v15);
    v13(v16, 0);
    swift_release(v11);
    return (_QWORD *)swift_release(v12);
  }
  return result;
}

_QWORD *sub_10001F298(double a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  void *v7;
  Class isa;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_OWORD *, _QWORD);
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[13];
  uint64_t v31;

  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v4 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(v18, v1, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v30[10] = v26;
  v30[11] = v27;
  v30[12] = v28;
  v31 = v29;
  v30[6] = v22;
  v30[7] = v23;
  v30[8] = v24;
  v30[9] = v25;
  v30[2] = v18[2];
  v30[3] = v19;
  v30[4] = v20;
  v30[5] = v21;
  v30[0] = v18[0];
  v30[1] = v18[1];
  v5 = v19;
  swift_bridgeObjectRetain(v19);
  result = sub_100006E80(v30);
  if (v5)
  {
    v7 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v5);
    v9 = objc_msgSend(v7, "textForRouteNames:textBoundingWidth:", isa, a1);

    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v13 = swift_getKeyPath(&unk_1000344C0);
    v14 = swift_getKeyPath(&unk_1000344E8);
    v15 = (void (*)(_OWORD *, _QWORD))static Published.subscript.modify(v18, v1, v13, v14);
    v17 = *(_QWORD *)(v16 + 40);
    *(_QWORD *)(v16 + 32) = v10;
    *(_QWORD *)(v16 + 40) = v12;
    swift_bridgeObjectRelease(v17);
    v15(v18, 0);
    swift_release(v13);
    return (_QWORD *)swift_release(v14);
  }
  return result;
}

uint64_t sub_10001F450()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  void (*v9)(_BYTE *, _QWORD);
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_BYTE *, _QWORD);
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, _QWORD);
  uint64_t v26;
  _BYTE v28[32];

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller), "metadataController");
  v2 = objc_msgSend(v1, "nowPlayingInfo");

  v3 = objc_msgSend(v2, "identifier");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v8 = swift_getKeyPath(&unk_1000344E8);
  v9 = (void (*)(_BYTE *, _QWORD))static Published.subscript.modify(v28, v0, KeyPath, v8);
  v11 = *(_QWORD *)(v10 + 144);
  *(_QWORD *)(v10 + 136) = v4;
  *(_QWORD *)(v10 + 144) = v6;
  swift_bridgeObjectRelease(v11);
  v9(v28, 0);
  swift_release(KeyPath);
  swift_release(v8);
  v12 = objc_msgSend(v2, "stringForComponents:", 1);
  if (v12)
  {
    v13 = v12;
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v17 = swift_getKeyPath(&unk_1000344C0);
  v18 = swift_getKeyPath(&unk_1000344E8);
  v19 = (void (*)(_BYTE *, _QWORD))static Published.subscript.modify(v28, v0, v17, v18);
  v21 = *(_QWORD *)(v20 + 128);
  *(_QWORD *)(v20 + 120) = v14;
  *(_QWORD *)(v20 + 128) = v16;
  swift_bridgeObjectRelease(v21);
  v19(v28, 0);
  swift_release(v17);
  swift_release(v18);
  v22 = objc_msgSend(v2, "isPlaying");
  v23 = swift_getKeyPath(&unk_1000344C0);
  v24 = swift_getKeyPath(&unk_1000344E8);
  v25 = (void (*)(_BYTE *, _QWORD))static Published.subscript.modify(v28, v0, v23, v24);
  *(_BYTE *)(v26 + 112) = v22;
  v25(v28, 0);

  swift_release(v23);
  return swift_release(v24);
}

double sub_10001F66C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double result;
  __int128 v12;
  _OWORD v13[13];
  uint64_t v14;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v5 = swift_getKeyPath(&unk_1000344E8);
  static Published.subscript.getter(v13, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  v6 = v13[11];
  *(_OWORD *)(a2 + 160) = v13[10];
  *(_OWORD *)(a2 + 176) = v6;
  *(_OWORD *)(a2 + 192) = v13[12];
  *(_QWORD *)(a2 + 208) = v14;
  v7 = v13[7];
  *(_OWORD *)(a2 + 96) = v13[6];
  *(_OWORD *)(a2 + 112) = v7;
  v8 = v13[9];
  *(_OWORD *)(a2 + 128) = v13[8];
  *(_OWORD *)(a2 + 144) = v8;
  v9 = v13[3];
  *(_OWORD *)(a2 + 32) = v13[2];
  *(_OWORD *)(a2 + 48) = v9;
  v10 = v13[5];
  *(_OWORD *)(a2 + 64) = v13[4];
  *(_OWORD *)(a2 + 80) = v10;
  result = *(double *)v13;
  v12 = v13[1];
  *(_OWORD *)a2 = v13[0];
  *(_OWORD *)(a2 + 16) = v12;
  return result;
}

uint64_t sub_10001F740(uint64_t a1, void **a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  uint64_t KeyPath;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v19[13];
  uint64_t v20;
  _OWORD v21[13];
  uint64_t v22;

  v3 = *(_OWORD *)(a1 + 176);
  v21[10] = *(_OWORD *)(a1 + 160);
  v21[11] = v3;
  v21[12] = *(_OWORD *)(a1 + 192);
  v22 = *(_QWORD *)(a1 + 208);
  v4 = *(_OWORD *)(a1 + 112);
  v21[6] = *(_OWORD *)(a1 + 96);
  v21[7] = v4;
  v5 = *(_OWORD *)(a1 + 144);
  v21[8] = *(_OWORD *)(a1 + 128);
  v21[9] = v5;
  v6 = *(_OWORD *)(a1 + 48);
  v21[2] = *(_OWORD *)(a1 + 32);
  v21[3] = v6;
  v7 = *(_OWORD *)(a1 + 80);
  v21[4] = *(_OWORD *)(a1 + 64);
  v21[5] = v7;
  v8 = *(_OWORD *)(a1 + 16);
  v21[0] = *(_OWORD *)a1;
  v21[1] = v8;
  v9 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v11 = swift_getKeyPath(&unk_1000344E8);
  v12 = *(_OWORD *)(a1 + 176);
  v19[10] = *(_OWORD *)(a1 + 160);
  v19[11] = v12;
  v19[12] = *(_OWORD *)(a1 + 192);
  v20 = *(_QWORD *)(a1 + 208);
  v13 = *(_OWORD *)(a1 + 112);
  v19[6] = *(_OWORD *)(a1 + 96);
  v19[7] = v13;
  v14 = *(_OWORD *)(a1 + 144);
  v19[8] = *(_OWORD *)(a1 + 128);
  v19[9] = v14;
  v15 = *(_OWORD *)(a1 + 48);
  v19[2] = *(_OWORD *)(a1 + 32);
  v19[3] = v15;
  v16 = *(_OWORD *)(a1 + 80);
  v19[4] = *(_OWORD *)(a1 + 64);
  v19[5] = v16;
  v17 = *(_OWORD *)(a1 + 16);
  v19[0] = *(_OWORD *)a1;
  v19[1] = v17;
  sub_100006D28(v21);
  return static Published.subscript.setter(v19, v9, KeyPath, v11);
}

void sub_10001F8AC(void *a1, int a2, id a3, uint64_t a4)
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  _OWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[13];
  uint64_t v32;

  if (a1)
  {
    v5 = a1;
    v6 = objc_msgSend(a3, "deviceIconView");
    v7 = objc_msgSend(a3, "deviceIconView");
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;

    v19 = objc_msgSend(v5, "mru_imageFittingSize:", v9, v11);
    objc_msgSend(v6, "setImage:", v19);

  }
  else
  {
    v13 = objc_msgSend(a3, "deviceIconView");
    KeyPath = swift_getKeyPath(&unk_1000344C0);
    v15 = swift_getKeyPath(&unk_1000344E8);
    static Published.subscript.getter(v20, a4, KeyPath, v15);
    swift_release(KeyPath);
    swift_release(v15);
    v31[10] = v27;
    v31[11] = v28;
    v31[12] = v29;
    v32 = v30;
    v31[6] = v23;
    v31[7] = v24;
    v31[8] = v25;
    v31[9] = v26;
    v31[2] = v20[2];
    v31[3] = v20[3];
    v31[4] = v21;
    v31[5] = v22;
    v31[0] = v20[0];
    v31[1] = v20[1];
    v16 = *((_QWORD *)&v21 + 1);
    v17 = *((id *)&v21 + 1);
    sub_100006E80(v31);
    if (!v16)
    {
      v18 = String._bridgeToObjectiveC()();
      v17 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v18);

    }
    objc_msgSend(v13, "setImage:", v17);

  }
}

void sub_10001FD34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute;
  v2 = sub_100006CE8(&qword_100059730);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

}

id sub_10001FDB4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBaseBannerViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001FE6C()
{
  return type metadata accessor for SuggestedRouteBaseBannerViewController(0);
}

uint64_t type metadata accessor for SuggestedRouteBaseBannerViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10005A150;
  if (!qword_10005A150)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SuggestedRouteBaseBannerViewController);
  return result;
}

void sub_10001FEB0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  sub_10001FF38();
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = "\b";
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 296);
  }
}

void sub_10001FF38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_10005A160)
  {
    v0 = type metadata accessor for Published(0, &type metadata for SuggestedRoute);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_10005A160);
  }
}

uint64_t sub_10001FF94()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = 0;

  v2 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
  result = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate, v3);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    v8 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration), "requestIdentifier");
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 24))(v9, v11, ObjectType, v6);
    swift_bridgeObjectRelease(v11);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

uint64_t sub_100020074()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_1000200A0(void *a1, int a2)
{
  uint64_t v2;

  sub_10001F8AC(a1, a2, *(id *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1000200A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000200B8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

_QWORD *sub_1000200C0(uint64_t a1)
{
  int64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_10002246C(0, v1, 0);
    v3 = (_QWORD *)(a1 + 56);
    do
    {
      v4 = *(v3 - 3);
      v5 = *(v3 - 2);
      v6 = *(v3 - 1);
      v7 = *v3;
      swift_bridgeObjectRetain(*v3);
      v8 = static String._fromSubstring(_:)(v4, v5, v6, v7);
      v10 = v9;
      swift_bridgeObjectRelease(v7);
      v12 = _swiftEmptyArrayStorage[2];
      v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1)
        sub_10002246C(v11 > 1, v12 + 1, 1);
      _swiftEmptyArrayStorage[2] = v12 + 1;
      v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      v13[5] = v10;
      v3 += 4;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000201BC(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  Swift::Int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  unint64_t i;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  _QWORD v34[9];

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v31 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v32 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v33 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v32)
      return 1;
    v11 = *(_QWORD *)(v31 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v32)
        return 1;
      v11 = *(_QWORD *)(v31 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v32)
          return 1;
        v11 = *(_QWORD *)(v31 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v32)
            return 1;
          v11 = *(_QWORD *)(v31 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v33 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    Hasher.init(_seed:)(v34);
    swift_bridgeObjectRetain(v16);
    String.hash(into:)(v34, v17, v16);
    v18 = Hasher._finalize()();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = v22[1];
    v24 = *v22 == v17 && v23 == v16;
    if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v22, v23, v17, v16, 0) & 1) == 0)
    {
      v25 = ~v19;
      for (i = v20 + 1; ; i = v27 + 1)
      {
        v27 = i & v25;
        if (((*(_QWORD *)(v7 + (((i & v25) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v25)) & 1) == 0)
          break;
        v28 = (_QWORD *)(v21 + 16 * v27);
        v29 = v28[1];
        v30 = *v28 == v17 && v29 == v16;
        if (v30 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v28, v29, v17, v16, 0) & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease(v16);
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease(v16);
    result = v14;
    v3 = v33;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v32)
    return 1;
  v11 = *(_QWORD *)(v31 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v32)
      return 1;
    v11 = *(_QWORD *)(v31 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

char *sub_10002045C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  NSString v21;
  id v22;
  void *v23;
  char **v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  NSString v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  objc_class *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  NSString v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  objc_class *v62;
  id v63;
  char *v64;
  void *v65;
  char *v66;
  _QWORD v68[4];
  uint64_t v69;
  uint64_t v70;
  objc_super v71;
  unint64_t v72;
  unint64_t v73;
  objc_super v74;

  v69 = a4;
  v70 = a3;
  v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_contentRole] = 2;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_maximumLayoutMode] = 3;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredCustomLayout] = 4;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors] = 1072;
  v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal] = 1;
  v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea] = 0x3FF0000000000000;
  v7 = &v4[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v8 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v7 + 10) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v7 + 11) = v8;
  *((_OWORD *)v7 + 12) = *(_OWORD *)(a1 + 192);
  *((_QWORD *)v7 + 26) = *(_QWORD *)(a1 + 208);
  v9 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v7 + 6) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v7 + 7) = v9;
  v10 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v7 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v7 + 9) = v10;
  v11 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v7 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v7 + 3) = v11;
  v12 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v7 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v7 + 5) = v12;
  v13 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v7 = *(_OWORD *)a1;
  *((_OWORD *)v7 + 1) = v13;
  v14 = v4;
  sub_100006D28((_QWORD *)a1);
  v15 = objc_msgSend(a2, "bundleIdentifierAffinity");
  if (v15)
  {
    v16 = v15;
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v19 = v18;

    v72 = 0xD000000000000027;
    v73 = 0x800000010003B670;
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v19);
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(0x800000010003B670);
  }
  else
  {
    v21 = String._bridgeToObjectiveC()();
  }
  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_elementIdentifier] = v21;
  v22 = objc_msgSend(a2, "bannerType", v69, v70);
  v23 = (void *)objc_opt_self(MRUEndpointController);
  v24 = &selRef_userSelectedEndpointController;
  if (v22 != (id)3)
    v24 = &selRef_localEndpointController;
  v25 = objc_msgSend(v23, *v24);
  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController] = v25;
  v26 = objc_msgSend(objc_allocWithZone((Class)MRUNowPlayingController), "initWithEndpointController:", v25);
  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller] = v26;
  v27 = objc_msgSend(a2, "staticRequest");
  if (v27)
  {
    v28 = v27;
    v29 = objc_msgSend(v27, "actionImageName");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
    v31 = v30;

  }
  else
  {
    v31 = 0xEC0000006F696475;
  }
  v32 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  v33 = (void *)objc_opt_self(UIImage);
  v34 = objc_msgSend(v33, "systemImageNamed:", v32);

  v35 = (void *)objc_opt_self(UIColor);
  v36 = objc_msgSend(v35, "systemTealColor");
  v37 = (objc_class *)type metadata accessor for AccessoryImageView();
  v74.receiver = objc_allocWithZone(v37);
  v74.super_class = v37;
  v38 = objc_msgSendSuper2(&v74, "initWithImage:", v34);
  objc_msgSend(v38, "setContentMode:", 1);
  objc_msgSend(v38, "setTintColor:", v36);

  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_airPlayImageView] = v38;
  v39 = objc_msgSend(a2, "staticRequest");
  if (v39)
  {
    v40 = v39;
    v41 = objc_msgSend(v39, "routeSymbolName");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
    v43 = v42;

    v44 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v43);
    v45 = objc_msgSend(v33, "_systemImageNamed:", v44);

  }
  else
  {
    v45 = 0;
  }
  v46 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  objc_msgSend(v46, "setImage:", v45);
  v47 = objc_msgSend(v35, "whiteColor");
  objc_msgSend(v46, "setTintColor:", v47);

  v48 = objc_allocWithZone((Class)type metadata accessor for ActivityIndicatorImageAccessoryView());
  v49 = v46;
  v50 = sub_1000260B4(v49);
  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView] = v50;
  v51 = *(_QWORD *)(a1 + 16);
  v52 = *(_QWORD *)(a1 + 24);
  v72 = 124;
  v73 = 0xE100000000000000;
  __chkstk_darwin(v50);
  v68[2] = &v72;
  swift_bridgeObjectRetain(v52);
  sub_100006D28((_QWORD *)a1);
  swift_bridgeObjectRetain(v52);
  v53 = sub_100021B38(0x7FFFFFFFFFFFFFFFLL, 1, sub_100023C74, (uint64_t)v68, v51, v52);
  swift_bridgeObjectRelease(v52);
  v54 = sub_1000200C0(v53);
  swift_bridgeObjectRelease(v53);
  v55 = sub_100023DBC((uint64_t)v54);
  swift_bridgeObjectRelease(v54);
  sub_100006E80((_QWORD *)a1);
  v56 = &v14[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state];
  *v56 = 0;
  *((_QWORD *)v56 + 1) = &_swiftEmptySetSingleton;
  *((_QWORD *)v56 + 2) = v55;

  v57 = &v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  *((_QWORD *)v57 + 1) = 0;
  v58 = swift_unknownObjectWeakInit(v57, 0);
  v59 = &v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *(_QWORD *)v59 = 0xD000000000000017;
  *((_QWORD *)v59 + 1) = 0x8000000100039710;
  v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  v60 = &v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(_QWORD *)v60 = 0;
  v60[8] = 1;
  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration] = a2;
  v61 = v70;
  *(_QWORD *)(v58 + 8) = v69;
  swift_unknownObjectWeakAssign(v58, v61);
  v62 = (objc_class *)type metadata accessor for BannerBaseViewController();
  v71.receiver = v14;
  v71.super_class = v62;
  v63 = a2;
  v64 = (char *)objc_msgSendSuper2(&v71, "initWithNibName:bundle:", 0, 0);
  v65 = *(void **)&v64[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller];
  v66 = v64;
  objc_msgSend(v65, "addObserver:", v66);
  objc_msgSend(v65, "updateAutomaticResponseLoading");
  sub_100020F28();

  swift_unknownObjectRelease(v61);
  sub_100006E80((_QWORD *)a1);

  return v66;
}

uint64_t sub_100020D34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = v2 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
  result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate, a2);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(v3 + 8);
    ObjectType = swift_getObjectType();
    v8 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration), "requestIdentifier");
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 24))(v9, v11, ObjectType, v6);
    swift_bridgeObjectRelease(v11);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

void sub_100020F28()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController), "route");
  v24 = objc_msgSend(v1, "endpointObject");

  if (v24)
  {
    v2 = objc_msgSend(v24, "outputDevices");
    if (!v2)
    {
LABEL_10:

      return;
    }
    v3 = v2;
    v4 = sub_100023F78();
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

    if ((unint64_t)v5 >> 62)
    {
      if (v5 < 0)
        v22 = v5;
      else
        v22 = v5 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v5);
      v23 = _CocoaArrayWrapper.endIndex.getter(v22);
      swift_bridgeObjectRelease(v5);
      if (v23 >= 1)
        goto LABEL_5;
    }
    else if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
    {
LABEL_5:
      v6 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller), "metadataController", v24);
      v7 = objc_msgSend(v6, "nowPlayingInfo");

      v8 = objc_msgSend(v7, "isPlaying");
      v9 = sub_100021198(v5);
      swift_bridgeObjectRelease(v5);
      v10 = sub_100023DBC((uint64_t)v9);
      swift_bridgeObjectRelease(v9);
      v11 = v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state;
      *(_BYTE *)v11 = v8;
      v12 = *(_QWORD *)(v11 + 8);
      v13 = *(_QWORD *)(v11 + 16);
      swift_bridgeObjectRetain(v12);
      v14 = swift_bridgeObjectRetain(v13);
      v15 = sub_1000201BC(v14, v12);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v12);
      v16 = OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState;
      if (*(_BYTE *)(v0
                    + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState) == 1)
        *(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState) = (v15 & 1) == 0;
      sub_1000215F8();
      v17 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)(v11 + 8) = v10;
      swift_bridgeObjectRelease(v17);
      v18 = *(_QWORD *)(v11 + 8);
      v19 = *(_QWORD *)(v11 + 16);
      swift_bridgeObjectRetain(v18);
      v20 = swift_bridgeObjectRetain(v19);
      v21 = sub_1000201BC(v20, v18);
      swift_bridgeObjectRelease(v19);
      swift_bridgeObjectRelease(v18);
      if (*(_BYTE *)(v0 + v16) == 1)
        *(_BYTE *)(v0 + v16) = (v21 & 1) == 0;
      sub_1000215F8();
      goto LABEL_10;
    }

    swift_bridgeObjectRelease(v5);
  }
}

_QWORD *sub_100021198(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  if ((unint64_t)a1 >> 62)
    goto LABEL_17;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; v2 = _CocoaArrayWrapper.endIndex.getter(v16))
  {
    v3 = _swiftEmptyArrayStorage;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1)
         : *(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = objc_msgSend(v5, "uid");
      if (v8)
      {
        v9 = v8;
        v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
          v3 = sub_100022344(0, v3[2] + 1, 1, v3);
        v14 = v3[2];
        v13 = v3[3];
        if (v14 >= v13 >> 1)
          v3 = sub_100022344((_QWORD *)(v13 > 1), v14 + 1, 1, v3);
        v3[2] = v14 + 1;
        v15 = &v3[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }
      else
      {

      }
      ++v4;
      if (v7 == v2)
        goto LABEL_22;
    }
    __break(1u);
LABEL_17:
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
  v3 = _swiftEmptyArrayStorage;
LABEL_22:
  swift_bridgeObjectRelease(a1);
  return v3;
}

void sub_10002132C()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  id v18;
  _QWORD aBlock[5];
  uint64_t v20;

  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController], "route");
  v18 = objc_msgSend(v1, "endpointObject");

  if (v18)
  {
    v2 = objc_msgSend(v18, "outputDevices");
    if (v2)
    {
      v3 = v2;
      v4 = sub_100023F78();
      v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

      if ((unint64_t)v5 >> 62)
        goto LABEL_17;
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v5);
      for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v12))
      {
        v7 = 4;
        while (1)
        {
          v8 = (v5 & 0xC000000000000001) != 0
             ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v5)
             : *(id *)(v5 + 8 * v7);
          v9 = v8;
          v10 = v7 - 3;
          if (__OFADD__(v7 - 4, 1))
            break;
          if (objc_msgSend(v8, "deviceType") == 1)
          {

          }
          else
          {
            v11 = objc_msgSend(v9, "deviceType");

            if (v11 != 3)
            {

              swift_bridgeObjectRelease_n(v5, 2);
              return;
            }
          }
          ++v7;
          if (v10 == v6)
            goto LABEL_21;
        }
        __break(1u);
LABEL_17:
        if (v5 < 0)
          v12 = v5;
        else
          v12 = v5 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v5);
      }
LABEL_21:
      swift_bridgeObjectRelease_n(v5, 2);
      v13 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller];
      v14 = swift_allocObject(&unk_1000460B8, 24, 7);
      *(_QWORD *)(v14 + 16) = v0;
      aBlock[4] = sub_100023FD8;
      v20 = v14;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100010784;
      aBlock[3] = &unk_1000460D0;
      v15 = _Block_copy(aBlock);
      v16 = v20;
      v17 = v0;
      objc_msgSend(v13, "routingDeviceImage:", v15, swift_release(v16).n128_f64[0]);
      _Block_release(v15);

    }
    else
    {

    }
  }
}

void sub_100021590(void *a1, uint64_t a2)
{
  char *v2;
  void *v3;
  id v4;

  v2 = *(char **)(a2 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView);
  v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView];
  v4 = a1;
  objc_msgSend(v3, "setImage:", v4);
  objc_msgSend(v2, "sizeToFit");

}

void sub_1000215F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  char **v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState) != 1)
  {
    v13 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView);
    v14 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning;
    v15 = *(unsigned __int8 *)(v13
                             + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning);
    *(_BYTE *)(v13 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = 0;
    if (v15 != 1)
      return;
    objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView), "stopAnimating");
    v11 = *(void **)(v13 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView);
    v12 = *(unsigned __int8 *)(v13 + v14);
    goto LABEL_10;
  }
  v1 = v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state) & 1) != 0
    || (*(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) & 1) != 0)
  {
    v3 = *(_QWORD *)(v1 + 8);
    v4 = *(_QWORD *)(v1 + 16);
    swift_bridgeObjectRetain(v3);
    v5 = swift_bridgeObjectRetain(v4);
    v6 = sub_1000201BC(v5, v3);
    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v3);
    v7 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning;
    v8 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning);
    v9 = (v6 & 1) == 0;
    *(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = v9;
    if (v8 == v9)
      return;
    v10 = &selRef_stopAnimating;
    if ((v6 & 1) == 0)
      v10 = &selRef_startAnimating;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView), *v10);
    v11 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView);
    v12 = *(unsigned __int8 *)(v2 + v7);
LABEL_10:
    objc_msgSend(v11, "setHidden:", v12);
    return;
  }
  *(_BYTE *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = 0;
}

void sub_100021760()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[13];
  uint64_t v9;

  v1 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 176);
  v8[10] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 160);
  v8[11] = v1;
  v8[12] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 192);
  v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 208);
  v2 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 112);
  v8[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 96);
  v8[7] = v2;
  v3 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 144);
  v8[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 128);
  v8[9] = v3;
  v4 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 48);
  v8[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 32);
  v8[3] = v4;
  v5 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 80);
  v8[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 64);
  v8[5] = v5;
  v6 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute + 16);
  v8[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute);
  v8[1] = v6;
  sub_100006E80(v8);

  v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state + 8);
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_state
                                      + 16));
  swift_bridgeObjectRelease(v7);

}

id sub_100021840()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteConnectedViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SuggestedRouteConnectedViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI37SuggestedRouteConnectedViewController);
}

uint64_t destroy for SuggestedRouteConnectedViewControllerState(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t _s13MediaRemoteUI42SuggestedRouteConnectedViewControllerStateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t assignWithCopy for SuggestedRouteConnectedViewControllerState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for SuggestedRouteConnectedViewControllerState(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SuggestedRouteConnectedViewControllerState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestedRouteConnectedViewControllerState(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SuggestedRouteConnectedViewControllerState(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SuggestedRouteConnectedViewControllerState()
{
  return &type metadata for SuggestedRouteConnectedViewControllerState;
}

uint64_t sub_100021B38(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
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
  unint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t result;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  unint64_t v55;
  _QWORD v57[4];

  v57[3] = a4;
  if (a1 < 0)
    goto LABEL_44;
  v10 = swift_allocObject(&unk_100046068, 24, 7);
  *(_QWORD *)(v10 + 16) = _swiftEmptyArrayStorage;
  v54 = swift_allocObject(&unk_100046090, 24, 7);
  *(_QWORD *)(v54 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v33 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v33 = 11;
    sub_100021FD4(v33 | (v11 << 16), v54, a2 & 1, v10);
    swift_bridgeObjectRelease(a6);
    v14 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain(v14);
    swift_release(v10);
    v34 = v54;
LABEL_41:
    swift_release(v34);
    return (uint64_t)v14;
  }
  v49 = a1;
  v50 = v10;
  v13 = 7;
  if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
    v13 = 11;
  v48 = v13 | (v12 << 16);
  v55 = 4 * v12;
  v14 = _swiftEmptyArrayStorage;
  v15 = 15;
  v16 = 15;
  v17 = 15;
  while (1)
  {
    v18 = String.subscript.getter(v15, a5, a6);
    v20 = v19;
    v57[0] = v18;
    v57[1] = v19;
    v21 = a3(v57);
    if (v6)
    {
      swift_release(v50);
      swift_release(v54);
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(a6);
      return (uint64_t)v14;
    }
    v22 = v21;
    swift_bridgeObjectRelease(v20);
    if ((v22 & 1) != 0)
      break;
    v15 = String.index(after:)(v15, a5, a6);
LABEL_11:
    if (v55 == v15 >> 14)
      goto LABEL_31;
  }
  if (v16 >> 14 == v15 >> 14 && (a2 & 1) != 0)
  {
    v15 = String.index(after:)(v15, a5, a6);
    *(_QWORD *)(v54 + 16) = v15;
    v16 = v15;
    v17 = v15;
    goto LABEL_11;
  }
  if (v15 >> 14 < v16 >> 14)
    goto LABEL_43;
  v23 = String.subscript.getter(v16, v15, a5, a6);
  v51 = v24;
  v52 = v23;
  v26 = v25;
  v28 = v27;
  if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
    v14 = sub_100022238(0, v14[2] + 1, 1, v14);
  v30 = v14[2];
  v29 = v14[3];
  if (v30 >= v29 >> 1)
    v14 = sub_100022238((_QWORD *)(v29 > 1), v30 + 1, 1, v14);
  v14[2] = v30 + 1;
  v31 = &v14[4 * v30];
  v31[4] = v52;
  v31[5] = v26;
  v31[6] = v28;
  v31[7] = v51;
  *(_QWORD *)(v50 + 16) = v14;
  v32 = String.index(after:)(v15, a5, a6);
  v15 = v32;
  *(_QWORD *)(v54 + 16) = v32;
  if (v14[2] != v49)
  {
    v16 = v32;
    v17 = v32;
    goto LABEL_11;
  }
  v17 = v32;
  v16 = v32;
LABEL_31:
  if (v55 == v16 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease(a6);
    v35 = v50;
LABEL_40:
    swift_bridgeObjectRetain(v14);
    swift_release(v35);
    v34 = v54;
    goto LABEL_41;
  }
  if (v55 >= v17 >> 14)
  {
    v36 = String.subscript.getter(v17, v48, a5, a6);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    swift_bridgeObjectRelease(a6);
    if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
      v14 = sub_100022238(0, v14[2] + 1, 1, v14);
    v44 = v14[2];
    v43 = v14[3];
    if (v44 >= v43 >> 1)
      v14 = sub_100022238((_QWORD *)(v43 > 1), v44 + 1, 1, v14);
    v14[2] = v44 + 1;
    v45 = &v14[4 * v44];
    v45[4] = v36;
    v45[5] = v38;
    v45[6] = v40;
    v45[7] = v42;
    v35 = v50;
    *(_QWORD *)(v50 + 16) = v14;
    goto LABEL_40;
  }
LABEL_43:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 754, 0);
  __break(1u);
LABEL_44:
  LOBYTE(v47) = 2;
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Must take zero or more splits", 29, 2, "Swift/Collection.swift", 22, v47, 1552, 0);
  __break(1u);
  return result;
}

uint64_t sub_100021FD4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = String.subscript.getter();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_100022238(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_100022238((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Range requires lowerBound <= upperBound", 39, 2, "Swift/Range.swift", 17, 2, 754, 0);
  __break(1u);
  return result;
}

char *sub_10002212C(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100006CE8((uint64_t *)&unk_10005A2B0);
      v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
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
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32])
          memmove(v14, a4 + 32, 32 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100023CC8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100022238(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      v10 = sub_100006CE8(&qword_10005A290);
      v11 = (_QWORD *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 5);
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
        if (v11 != a4 || v14 >= &a4[4 * v8 + 4])
          memmove(v14, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100023E88(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100022344(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      v10 = sub_100006CE8(&qword_10005A288);
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
    sub_100023FF8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100022450(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100022488(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10002246C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1000225E4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100022488(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006CE8(&qword_10005A2A8);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    memcpy(v14, v15, 32 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000225E4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006CE8(&qword_10005A288);
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

uint64_t sub_10002274C(Swift::Int *a1, void *a2)
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
      v10 = type metadata accessor for Client(0);
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
    v23 = sub_10001B578(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_100022B74(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10001B75C((uint64_t)v8, v25);
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
      type metadata accessor for Client(0);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)(v16, a2);

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
        v20 = static NSObject.== infix(_:_:)(v19, a2);

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_1000230EC((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

uint64_t sub_1000229C8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  Hasher.init(_seed:)(v24);
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
  sub_100023260(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void sub_100022B74(uint64_t a1)
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
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  Swift::Int v21;
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
  sub_100006CE8(&qword_100059DE0);
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
    swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v16 = v15 | (v13 << 6);
      }
      else
      {
        v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return;
        }
        if (v17 >= v11)
          goto LABEL_36;
        v18 = v8[v17];
        ++v13;
        if (!v18)
        {
          v13 = v17 + 1;
          if (v17 + 1 >= v11)
            goto LABEL_36;
          v18 = v8[v13];
          if (!v18)
          {
            v13 = v17 + 2;
            if (v17 + 2 >= v11)
              goto LABEL_36;
            v18 = v8[v13];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v11)
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
              v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  v13 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v13 >= v11)
                    goto LABEL_36;
                  v18 = v8[v13];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v13 = v19;
            }
          }
        }
LABEL_26:
        v10 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
      v21 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = v21 & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v20;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  swift_release(v3);
  *v2 = v6;
}

void sub_100022E10(uint64_t a1)
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
  int64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
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
  sub_100006CE8(&qword_10005A280);
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
    swift_retain(v3);
    v12 = 0;
    while (1)
    {
      if (v9)
      {
        v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v16 = v15 | (v12 << 6);
      }
      else
      {
        v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return;
        }
        if (v17 >= v10)
          goto LABEL_36;
        v18 = v33[v17];
        ++v12;
        if (!v18)
        {
          v12 = v17 + 1;
          if (v17 + 1 >= v10)
            goto LABEL_36;
          v18 = v33[v12];
          if (!v18)
          {
            v12 = v17 + 2;
            if (v17 + 2 >= v10)
              goto LABEL_36;
            v18 = v33[v12];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v10)
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
              v18 = v33[v19];
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v12 >= v10)
                    goto LABEL_36;
                  v18 = v33[v12];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v12 = v19;
            }
          }
        }
LABEL_26:
        v9 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
      v21 = *v20;
      v22 = v20[1];
      Hasher.init(_seed:)(v34);
      String.hash(into:)(v34, v21, v22);
      v23 = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
        v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v13);
      *v14 = v21;
      v14[1] = v22;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  swift_release(v3);
  *v2 = v6;
}

void sub_1000230EC(uint64_t a1, unint64_t a2, char a3)
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
    sub_100022B74(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_1000233F8();
      goto LABEL_14;
    }
    sub_100023750(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = type metadata accessor for Client(0);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)(v14, a1);

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
        v18 = static NSObject.== infix(_:_:)(v17, a1);

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

void sub_100023260(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

  v5 = v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100022E10(v11);
  }
  else
  {
    if (v10 > v9)
    {
      sub_1000235A0();
      goto LABEL_22;
    }
    sub_1000239C8(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v29);
  String.hash(into:)(v29, a1, a2);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  v15 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v16 = *(_QWORD *)(v12 + 48);
    v17 = (_QWORD *)(v16 + 16 * a3);
    v18 = v17[1];
    v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(_QWORD *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v21 = (_QWORD *)(v16 + 16 * a3);
        v22 = v21[1];
        v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0) & 1) != 0)
          goto LABEL_21;
      }
    }
  }
LABEL_22:
  v24 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v25 = (_QWORD *)(*(_QWORD *)(v24 + 48) + 16 * a3);
  *v25 = a1;
  v25[1] = a2;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
}

void sub_1000233F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  id v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v1 = v0;
  sub_100006CE8(&qword_100059DE0);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v13)
      goto LABEL_28;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_28;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
      {
        v9 = v19 + 2;
        if (v19 + 2 >= v13)
          goto LABEL_28;
        v20 = *(_QWORD *)(v6 + 8 * v9);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v18 = v17;
  }
  v21 = v19 + 3;
  if (v21 >= v13)
    goto LABEL_28;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
}

void sub_1000235A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  sub_100006CE8(&qword_10005A280);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
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
    swift_bridgeObjectRetain(v18);
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
}

void sub_100023750(uint64_t a1)
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
  __n128 v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  Swift::Int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100006CE8(&qword_100059DE0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_release(v3);
LABEL_38:
    *v2 = v6;
    return;
  }
  v31 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  v13 = swift_retain(v3);
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
    v23 = NSObject._rawHashValue(seed:)(v21);
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = v23 & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
        v30 = *(_QWORD *)(v12 + 8 * v26);
      }
      while (v30 == -1);
      v15 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    swift_release_n(v3, 2, v13);
    v2 = v31;
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
}

void sub_1000239C8(uint64_t a1)
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
  __n128 v12;
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
  Swift::Int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100006CE8(&qword_10005A280);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_release(v3);
LABEL_38:
    *v2 = v6;
    return;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v32 = v2;
  v33 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  v12 = swift_retain(v3);
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
    if (v18 >= v33)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v33)
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
    Hasher.init(_seed:)(v34);
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v34, v22, v23);
    v24 = Hasher._finalize()();
    v25 = -1 << *(_BYTE *)(v6 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_36:
    swift_release_n(v3, 2, v12);
    v2 = v32;
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
    if (v13 >= v33)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
}

uint64_t sub_100023C74(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD **)(v1 + 16);
  v4 = *a1;
  v5 = a1[1];
  v6 = v3[1];
  if (v4 == *v3 && v5 == v6)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *v3, v6, 0) & 1;
}

uint64_t sub_100023CC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
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

uint64_t sub_100023DBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_1000229C8(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100023E54()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100023E78()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100023E88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
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

unint64_t sub_100023F78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A298;
  if (!qword_10005A298)
  {
    v1 = objc_opt_self(MRAVOutputDevice);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005A298);
  }
  return result;
}

uint64_t sub_100023FB4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100023FD8(void *a1)
{
  uint64_t v1;

  sub_100021590(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100023FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100023FF0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100023FF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

void sub_1000240E8()
{
  _BYTE *v0;

  v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController__isShowingOptimisticState] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_contentRole] = 2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_maximumLayoutMode] = 3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredCustomLayout] = 4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors] = 1072;
  v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal] = 1;
  v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea] = 0x3FF0000000000000;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteConnectedViewController.swift", 57, 2, 94, 0);
  __break(1u);
}

void sub_1000241E0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView) == 1)
  {
    v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
    *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = 0;

    v2 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
    Strong = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate, v3);
    if (Strong)
    {
      v5 = Strong;
      v6 = *(_QWORD *)(v2 + 8);
      ObjectType = swift_getObjectType();
      v8 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration), "requestIdentifier");
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      v11 = v10;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 24))(v9, v11, ObjectType, v6);
      swift_bridgeObjectRelease(v11);
      swift_unknownObjectRelease(v5);
    }
  }
}

uint64_t sub_1000242C8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = 0;

  v2 = v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
  result = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate, v3);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    v8 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration), "requestIdentifier");
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 32))(v9, v11, ObjectType, v6);
    swift_bridgeObjectRelease(v11);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

uint64_t sub_10002439C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001E0F0(v0, qword_10005A2C0);
  sub_1000163A0(v0, (uint64_t)qword_10005A2C0);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return Logger.init(_:)((id)qword_10005B240);
}

id sub_100024510(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v3 = v2;
  v4 = &v2[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate], a2);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v4 + 1);
    ObjectType = swift_getObjectType(Strong);
    v9 = objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration], "requestIdentifier");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v12, ObjectType, v7);
    swift_bridgeObjectRelease(v12);
    swift_unknownObjectRelease(v6);
  }
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for BannerBaseViewController();
  return objc_msgSendSuper2(&v14, "dealloc");
}

void sub_100024668()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for BannerBaseViewController();
  objc_msgSendSuper2(&v7, "viewDidLoad");
  v1 = objc_msgSend(v0, "view");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v0, "bannerTapActionWithSender:");
    objc_msgSend(v2, "addGestureRecognizer:", v3);

    v4 = objc_msgSend(v0, "view");
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(objc_allocWithZone((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v0, "bannerLongPressActionWithSender:");
      objc_msgSend(v5, "addGestureRecognizer:", v6);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1000247B0(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  char *v9;
  uint64_t v10;
  uint64_t Strong;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  id v30;
  id v31;
  char *v32;
  id v33;
  void *v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  os_log_t v41;
  uint64_t v42;
  void **v43;
  void ***v44;
  void **v45;
  void **v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  void ***v50;
  void **v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  os_log_t v59;
  void **v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  objc_super v65;
  void **aBlock;
  _QWORD v67[4];
  uint64_t v68;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for BannerBaseViewController();
  v65.receiver = v1;
  v65.super_class = v8;
  objc_msgSendSuper2(&v65, "viewDidAppear:", a1 & 1);
  v9 = &v1[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate], v10);
  if (Strong)
  {
    v12 = Strong;
    v13 = *((_QWORD *)v9 + 1);
    ObjectType = swift_getObjectType(Strong);
    v63 = v7;
    v15 = v4;
    v16 = v5;
    v17 = ObjectType;
    v18 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration], "requestIdentifier");
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

    v22 = v17;
    v5 = v16;
    v4 = v15;
    v7 = v63;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8))(v19, v21, v22, v13);
    swift_bridgeObjectRelease(v21);
    swift_unknownObjectRelease(v12);
  }
  if (qword_1000589D8 != -1)
    swift_once(&qword_1000589D8, sub_10002439C);
  v23 = sub_1000163A0(v4, (uint64_t)qword_10005A2C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
  v24 = v2;
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, (os_log_type_t)v26))
  {
    HIDWORD(v58) = v26;
    v59 = v25;
    v61 = v23;
    v62 = v5;
    v27 = swift_slowAlloc(38, -1);
    v28 = (char *)swift_slowAlloc(16, -1);
    v60 = (void **)swift_slowAlloc(32, -1);
    aBlock = v60;
    *(_DWORD *)v27 = 67109890;
    LODWORD(v64) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 4);
    *(_WORD *)(v27 + 8) = 2112;
    v64 = (uint64_t)v24;
    v29 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    v63 = v28;
    *(_QWORD *)v28 = v24;

    *(_WORD *)(v27 + 18) = 2112;
    v30 = objc_msgSend(v29, "view");
    v31 = v30;
    if (v30)
      v64 = (uint64_t)v30;
    else
      v64 = 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);
    v32 = v63;
    *((_QWORD *)v63 + 1) = v31;

    *(_WORD *)(v27 + 28) = 2080;
    v33 = objc_msgSend(v29, "view");
    if (!v33)
    {

      __break(1u);
      return;
    }
    v34 = v33;
    v35 = objc_msgSend(v33, "subviews");

    v36 = sub_100025F68();
    v37 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v35, v36);

    v38 = Array.description.getter(v37, v36);
    v40 = v39;
    swift_bridgeObjectRelease(v37);
    v64 = sub_100030094(v38, v40, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65);

    swift_bridgeObjectRelease(v40);
    v41 = v59;
    _os_log_impl((void *)&_mh_execute_header, v59, BYTE4(v58), "[MRUIBanner]: Banner did appear (animated: %{BOOL}d) %@ with view %@ - %s", (uint8_t *)v27, 0x26u);
    v42 = sub_100006CE8(&qword_10005A4F0);
    swift_arrayDestroy(v32, 2, v42);
    swift_slowDealloc(v32, -1, -1);
    v43 = v60;
    swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v7, v4);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v44 = (void ***)&v24[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  if ((v24[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration + 8] & 1) == 0)
  {
    v45 = *v44;
    if (*(double *)v44 > 0.0)
    {
      v46 = v24;
      v47 = Logger.logObject.getter(v46);
      v48 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = swift_slowAlloc(22, -1);
        v50 = (void ***)swift_slowAlloc(8, -1);
        *(_DWORD *)v49 = 138412546;
        aBlock = v46;
        v51 = v46;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v67);
        *v50 = v46;

        *(_WORD *)(v49 + 12) = 2048;
        aBlock = v45;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v67);
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "[MRUIBanner]: Banner  %@ set idle timer of %f seconds", (uint8_t *)v49, 0x16u);
        v52 = sub_100006CE8(&qword_10005A4F0);
        swift_arrayDestroy(v50, 1, v52);
        swift_slowDealloc(v50, -1, -1);
        swift_slowDealloc(v49, -1, -1);
      }
      else
      {

        v47 = v46;
      }

      v53 = swift_allocObject(&unk_100046118, 24, 7);
      swift_unknownObjectWeakInit(v53 + 16, v46);
      v67[3] = sub_100025FC8;
      v68 = v53;
      aBlock = _NSConcreteStackBlock;
      v67[0] = 1107296256;
      v67[1] = sub_100011C50;
      v67[2] = &unk_100046130;
      v54 = _Block_copy(&aBlock);
      v55 = v68;
      swift_retain(v53);
      swift_release(v55);
      v56 = objc_msgSend((id)objc_opt_self(MSVTimer), "timerWithInterval:repeats:block:", 0, v54, *(double *)&v45);
      _Block_release(v54);
      swift_release(v53);
      v57 = *(void **)((char *)v46 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer);
      *(void **)((char *)v46 + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer) = v56;

    }
  }
}

void sub_100024E74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v15, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1, v2);
  if (Strong)
  {
    v5 = (char *)Strong;
    v6 = Strong + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate;
    v7 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate, v4);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)(v6 + 8);
      ObjectType = swift_getObjectType();
      v11 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration], "requestIdentifier");
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      v14 = v13;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 48))(v12, v14, ObjectType, v9);
      swift_bridgeObjectRelease(v14);

      swift_unknownObjectRelease(v8);
    }
    else
    {

    }
  }
}

void sub_100024FA4(char a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  uint64_t v36;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (objc_class *)type metadata accessor for BannerBaseViewController();
  v35.receiver = v1;
  v35.super_class = v7;
  objc_msgSendSuper2(&v35, "viewDidDisappear:", a1 & 1);
  if (qword_1000589D8 != -1)
    swift_once(&qword_1000589D8, sub_10002439C);
  v8 = sub_1000163A0(v3, (uint64_t)qword_10005A2C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  v9 = v1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, (os_log_type_t)v11))
  {
    v30 = v11;
    v31 = v10;
    v33 = v4;
    v12 = swift_slowAlloc(38, -1);
    v13 = (_QWORD *)swift_slowAlloc(16, -1);
    v32 = swift_slowAlloc(32, -1);
    v36 = v32;
    *(_DWORD *)v12 = 67109890;
    LODWORD(v34) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, (char *)&v34 + 4);
    *(_WORD *)(v12 + 8) = 2112;
    v34 = (uint64_t)v9;
    v14 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);
    *v13 = v9;

    *(_WORD *)(v12 + 18) = 2112;
    v15 = objc_msgSend(v14, "view");
    v16 = v15;
    if (v15)
      v34 = (uint64_t)v15;
    else
      v34 = 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);
    v17 = v13;
    v13[1] = v16;

    *(_WORD *)(v12 + 28) = 2080;
    v18 = objc_msgSend(v14, "view");
    if (v18)
    {
      v19 = v18;
      v20 = objc_msgSend(v18, "subviews");

      v21 = sub_100025F68();
      v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);

      v23 = Array.description.getter(v22, v21);
      v25 = v24;
      swift_bridgeObjectRelease(v22);
      v34 = sub_100030094(v23, v25, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);

      swift_bridgeObjectRelease(v25);
      v26 = v31;
      _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v30, "[MRUIBanner]: Banner did disappear (animated: %{BOOL}d) %@ with view %@ - %s", (uint8_t *)v12, 0x26u);
      v27 = sub_100006CE8(&qword_10005A4F0);
      swift_arrayDestroy(v17, 2, v27);
      swift_slowDealloc(v17, -1, -1);
      v28 = v32;
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v12, -1, -1);

      (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v3);
    }
    else
    {

      __break(1u);
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_1000253E8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;
  uint64_t v8;
  _QWORD v10[4];

  swift_unknownObjectRetain(a3);
  v7 = a1;
  _bridgeAnyObjectToAny(_:)(v10, a3);
  v8 = swift_unknownObjectRelease(a3);
  a4(v8);

  return sub_1000134AC(v10);
}

void sub_1000254B8(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void *))
{
  id v9;
  id v10;

  swift_unknownObjectRetain(a3);
  v9 = a4;
  v10 = a1;
  a5(a4);
  swift_unknownObjectRelease(a3);

}

uint64_t type metadata accessor for BannerBaseViewController()
{
  return objc_opt_self(_TtC13MediaRemoteUI24BannerBaseViewController);
}

uint64_t sub_100025580(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _typeName(_:qualified:)(v1, 0);
}

void sub_1000255A4()
{
  void *v0;
  uint64_t ObjectType;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  ObjectType = swift_getObjectType(v0);
  if (qword_1000589D8 != -1)
    swift_once(&qword_1000589D8, sub_10002439C);
  v2 = type metadata accessor for Logger(0);
  sub_1000163A0(v2, (uint64_t)qword_10005A2C0);
  v14 = v0;
  v3 = Logger.logObject.getter(v14);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc(22, -1);
    v6 = swift_slowAlloc(64, -1);
    v16 = v6;
    *(_DWORD *)v5 = 136315394;
    v7 = _typeName(_:qualified:)(ObjectType, 0);
    v9 = v8;
    v15 = sub_100030094(v7, v8, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
    swift_bridgeObjectRelease(v9);
    *(_WORD *)(v5 + 12) = 2080;
    v10 = objc_msgSend(*(id *)&v14[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration], "description");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    v15 = sub_100030094(v11, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);

    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%s] Will appear - %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy(v6, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

void sub_1000257E8(void *a1)
{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  ObjectType = swift_getObjectType(v1);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000589D8 != -1)
    swift_once(&qword_1000589D8, sub_10002439C);
  v9 = sub_1000163A0(v5, (uint64_t)qword_10005A2C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = a1;
  v11 = v2;
  v12 = v10;
  v13 = (char *)v11;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter(v14);
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    v30 = v15;
    v31 = v6;
    v16 = swift_slowAlloc(32, -1);
    v29 = swift_slowAlloc(96, -1);
    v33 = v29;
    *(_DWORD *)v16 = 136315650;
    v17 = _typeName(_:qualified:)(ObjectType, 0);
    v19 = v18;
    v32 = sub_100030094(v17, v18, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);
    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v16 + 12) = 2080;
    if (a1)
    {
      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
      v22 = v21;
      v32 = sub_100030094(v20, v21, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);

      swift_bridgeObjectRelease(v22);
      *(_WORD *)(v16 + 22) = 2080;
      v23 = objc_msgSend(*(id *)&v13[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration], "description");
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

      v32 = sub_100030094(v24, v26, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);

      swift_bridgeObjectRelease(v26);
      _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v30, "[%s] Rejected because: %s - %s", (uint8_t *)v16, 0x20u);
      v27 = v29;
      swift_arrayDestroy(v29, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v5);
    }
    else
    {

      __break(1u);
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_100025AE0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  NSObject *v14;
  int v15;
  __objc2_meth_list **p_class_meths;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  id v26;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char *v45;
  uint64_t Strong;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  char *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;

  v2 = v1;
  ObjectType = swift_getObjectType(v1);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000589D8 != -1)
    swift_once(&qword_1000589D8, sub_10002439C);
  v9 = sub_1000163A0(v5, (uint64_t)qword_10005A2C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = a1;
  v11 = v2;
  v12 = v10;
  v13 = (char *)v11;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.error.getter(v14);
  p_class_meths = &OBJC_PROTOCOL___SBUISystemApertureAccessoryView.class_meths;
  if (!os_log_type_enabled(v14, (os_log_type_t)v15))
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (a1)
      goto LABEL_7;
LABEL_19:
    __break(1u);
    return;
  }
  v56 = v15;
  v57 = v6;
  v58 = v13;
  v17 = swift_slowAlloc(32, -1);
  v55 = swift_slowAlloc(96, -1);
  v61 = v55;
  *(_DWORD *)v17 = 136315650;
  v59 = a1;
  v18 = _typeName(_:qualified:)(ObjectType, 0);
  v20 = v19;
  v60 = sub_100030094(v18, v19, &v61);
  v21 = v59;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);
  swift_bridgeObjectRelease(v20);
  *(_WORD *)(v17 + 12) = 2080;
  if (!v21)
  {

    __break(1u);
    goto LABEL_19;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v24 = v23;
  v60 = sub_100030094(v22, v23, &v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);

  swift_bridgeObjectRelease(v24);
  *(_WORD *)(v17 + 22) = 2080;
  v25 = v58;
  v26 = objc_msgSend(*(id *)&v58[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration], "description");
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
  v29 = v28;

  a1 = v59;
  v60 = sub_100030094(v27, v29, &v61);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);

  swift_bridgeObjectRelease(v29);
  _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v56, "[%s] Disappeared because: %s - %s", (uint8_t *)v17, 0x20u);
  v30 = v55;
  swift_arrayDestroy(v55, 3, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v30, -1, -1);
  v31 = v17;
  v13 = v25;
  p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SBUISystemApertureAccessoryView + 32);
  swift_slowDealloc(v31, -1, -1);

  (*(void (**)(char *, uint64_t))(v57 + 8))(v8, v5);
LABEL_7:
  v32 = BNBannerRevocationReasonDragDismissal;
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v35 = v34;
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  v38 = v36;
  if (v33 == v37 && v35 == v36)
  {
    swift_bridgeObjectRelease_n(v35, 2);
  }
  else
  {
    v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v33, v35, v37, v36, 0);
    swift_bridgeObjectRelease(v35);
    swift_bridgeObjectRelease(v38);
    if ((v40 & 1) == 0)
    {
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
      v43 = v42;
      if (v41 == 0xD000000000000017 && v42 == 0x800000010003B960)
      {
        swift_bridgeObjectRelease(0x800000010003B960);
      }
      else
      {
        v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, 0xD000000000000017, 0x800000010003B960, 0);
        swift_bridgeObjectRelease(v43);
        if ((v44 & 1) == 0)
          return;
      }
    }
  }
  v45 = &v13[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v13[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate], v39);
  if (Strong)
  {
    v47 = Strong;
    v48 = *((_QWORD *)v45 + 1);
    v49 = swift_getObjectType(Strong);
    v50 = objc_msgSend(*(id *)((char *)p_class_meths[92] + (_QWORD)v13), "requestIdentifier");
    v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
    v53 = v52;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 40))(v51, v53, v49, v48);
    swift_bridgeObjectRelease(v53);
    swift_unknownObjectRelease(v47);
  }
}

unint64_t sub_100025F68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005A390;
  if (!qword_10005A390)
  {
    v1 = objc_opt_self(UIView);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005A390);
  }
  return result;
}

uint64_t sub_100025FA4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100025FC8()
{
  uint64_t v0;

  sub_100024E74(v0);
}

uint64_t sub_100025FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100025FE0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100025FE8()
{
  _BYTE *v0;
  char *v1;
  _QWORD *v2;
  char *v3;

  v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate];
  *((_QWORD *)v1 + 1) = 0;
  swift_unknownObjectWeakInit(v1, 0);
  v2 = &v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  *v2 = 0xD000000000000017;
  v2[1] = 0x8000000100039710;
  v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_sendTapEventForAnyTapInsideView] = 1;
  v3 = &v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimerDuration];
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/BannerBaseViewController.swift", 44, 2, 37, 0);
  __break(1u);
}

char *sub_1000260B4(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  char **v12;
  objc_super v14;

  v1[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning] = 0;
  v3 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView;
  v4 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView] = a1;
  v6 = a1;

  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for ActivityIndicatorImageAccessoryView();
  v7 = (char *)objc_msgSendSuper2(&v14, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = *(void **)&v7[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView];
  v9 = v7;
  objc_msgSend(v9, "addSubview:", v8);
  v10 = *(void **)&v9[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView];
  objc_msgSend(v9, "addSubview:", v10);
  v11 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning;
  if (v9[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning])
    v12 = &selRef_startAnimating;
  else
    v12 = &selRef_stopAnimating;
  objc_msgSend(v10, *v12);
  objc_msgSend(v8, "setHidden:", v9[v11]);

  return v9;
}

id sub_100026390()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityIndicatorImageAccessoryView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ActivityIndicatorImageAccessoryView()
{
  return objc_opt_self(_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView);
}

uint64_t sub_100026418(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_100026454()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LockScreenCoordinator()), "init");
  qword_10005B288 = (uint64_t)result;
  return result;
}

void sub_1000264E4()
{
  char *v0;
  void *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  unsigned __int8 v8;
  char *v9;

  v1 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer];
  if (v1)
  {
    objc_msgSend(v1, "preferredContentSize");
    v2 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize];
    *(_QWORD *)v2 = v3;
    *((_QWORD *)v2 + 1) = v4;
    v2[16] = 0;
  }
  sub_100028A50(0, 0, 0);
  if ((sub_100026C14() & 1) == 0)
  {
    v5 = swift_allocObject(&unk_1000465C8, 24, 7);
    *(_QWORD *)(v5 + 16) = v0;
    v6 = v0;
    sub_100028A50(0, (uint64_t)sub_10002989C, v5);
LABEL_7:
    swift_release(v5);
    return;
  }
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
  {
    sub_100028A50(1, 0, 0);
    return;
  }
  v7 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
  v8 = objc_msgSend(v7, "supportLockScreenBackground");

  if ((v8 & 1) != 0)
  {
    v5 = swift_allocObject(&unk_1000465F0, 25, 7);
    *(_QWORD *)(v5 + 16) = v0;
    *(_BYTE *)(v5 + 24) = 0;
    v9 = v0;
    sub_10002778C((uint64_t)sub_10002983C, v5);
    goto LABEL_7;
  }
}

void sub_100026660(char *a1, uint64_t a2, void *a3, _QWORD *a4, void (*a5)(void))
{
  void *v7;
  char *v8;
  id v9;

  v7 = *(void **)&a1[*a4];
  *(_QWORD *)&a1[*a4] = a3;
  v9 = a3;
  v8 = a1;

  a5();
}

void sub_1000266C0()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  char *v11;
  id v12;
  unsigned __int8 v13;
  char *v14;

  sub_100028A50(0, 0, 0);
  v1 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer];
  if (v2)
  {
    v3 = objc_msgSend(v2, "artworkView");
    objc_msgSend(v3, "addObserver:", v0);

    v4 = *(void **)&v0[v1];
    if (v4)
    {
      v5 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork];
      v6 = v4;
      v7 = objc_msgSend(v6, "artworkView");
      objc_msgSend(v7, "setArtwork:", v5);

    }
  }
  v8 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion];
  if (v8)
  {
    v9 = objc_msgSend(v8, "isAnimated");
    if ((sub_100026C14() & 1) != 0)
      goto LABEL_6;
LABEL_9:
    v10 = swift_allocObject(&unk_100046168, 24, 7);
    *(_QWORD *)(v10 + 16) = v0;
    v11 = v0;
    sub_100028DA0(0, v9, (uint64_t)sub_1000293C4, v10);
LABEL_10:
    swift_release(v10);
    return;
  }
  v9 = 0;
  if ((sub_100026C14() & 1) == 0)
    goto LABEL_9;
LABEL_6:
  if (*(_QWORD *)&v0[v1])
  {
    sub_100028DA0(1, v9, 0, 0);
    return;
  }
  v12 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
  v13 = objc_msgSend(v12, "supportLockScreenBackground");

  if ((v13 & 1) != 0)
  {
    v10 = swift_allocObject(&unk_100046190, 25, 7);
    *(_QWORD *)(v10 + 16) = v0;
    *(_BYTE *)(v10 + 24) = v9;
    v14 = v0;
    sub_10002778C((uint64_t)sub_1000293F0, v10);
    goto LABEL_10;
  }
}

uint64_t sub_100026A0C()
{
  uint64_t v0;
  uint64_t result;
  id v2;
  id v3;
  id v4;
  id v5;

  result = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (result)
  {
    result = (uint64_t)objc_msgSend((id)result, "catalog");
    if (result)
    {

      v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v3 = objc_msgSend(v2, "userInterfaceIdiom");

      if (v3 == (id)1)
      {
        return 1;
      }
      else
      {
        v4 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
        v5 = objc_msgSend(v4, "activeInterfaceOrientation");

        return sub_1000293FC((uint64_t)v5);
      }
    }
  }
  return result;
}

void sub_100026AD8(char a1)
{
  _BYTE *v1;
  int v2;
  uint64_t v3;
  _BYTE *v4;
  id v5;
  unsigned int v6;
  _BYTE *v7;

  v2 = v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState];
  v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState] = a1;
  if (v2 != (a1 & 1))
  {
    MRSetPrefersExpandedLockScreenPlatter();
    if ((sub_100026C14() & 1) == 0)
    {
      v3 = swift_allocObject(&unk_100046578, 24, 7);
      *(_QWORD *)(v3 + 16) = v1;
      v4 = v1;
      sub_100028A50(0, (uint64_t)sub_10002989C, v3);
LABEL_6:
      swift_release(v3);
      return;
    }
    if (*(_QWORD *)&v1[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
    {
      sub_100028A50(1, 0, 0);
      return;
    }
    v5 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
    v6 = objc_msgSend(v5, "supportLockScreenBackground");

    if (v6)
    {
      v3 = swift_allocObject(&unk_1000465A0, 25, 7);
      *(_QWORD *)(v3 + 16) = v1;
      *(_BYTE *)(v3 + 24) = 0;
      v7 = v1;
      sub_10002778C((uint64_t)sub_10002983C, v3);
      goto LABEL_6;
    }
  }
}

unint64_t sub_100026C14()
{
  uint64_t v0;
  unint64_t result;
  id v2;
  id v3;
  id v4;
  id v5;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState) != 1)
    return 0;
  result = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (result)
  {
    result = (unint64_t)objc_msgSend((id)result, "catalog");
    if (result)
    {

      v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v3 = objc_msgSend(v2, "userInterfaceIdiom");

      if (v3 == (id)1)
        return *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) != 0;
      v4 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
      v5 = objc_msgSend(v4, "activeInterfaceOrientation");

      result = sub_1000293FC((uint64_t)v5);
      if ((_DWORD)result)
        return *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer) != 0;
    }
  }
  return result;
}

char *sub_100026D14()
{
  char *v0;
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
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[24];
  _QWORD v43[5];
  objc_super v44;

  v1 = sub_100006CE8(&qword_100059660);
  v40 = *(_QWORD *)(v1 - 8);
  v41 = v1;
  __chkstk_darwin(v1);
  v39 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer] = 0;
  v12 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds];
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[32] = 1;
  v13 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  v13[32] = 1;
  v14 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds];
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v14[32] = 1;
  v15 = &v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v15[16] = 1;
  v16 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService;
  v17 = objc_allocWithZone((Class)SBSWallpaperService);
  v18 = v0;
  *(_QWORD *)&v0[v16] = objc_msgSend(v17, "init");
  *(_QWORD *)&v18[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer] = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer] = 0;
  *(_QWORD *)&v18[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork] = 0;
  v19 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState;
  v18[v19] = MRPrefersExpandedLockScreenPlatter();
  v18[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_shouldExpandWhenAmbientSceneDisconnects] = 0;
  v20 = &v18[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable];
  v21 = sub_10000E5A0();
  *(_OWORD *)v20 = 0u;
  *((_OWORD *)v20 + 1) = 0u;
  *((_QWORD *)v20 + 4) = 0;
  static DispatchQoS.unspecified.getter(v21);
  v43[0] = _swiftEmptyArrayStorage;
  v22 = sub_100006870((unint64_t *)&unk_10005A480, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v23 = sub_100006CE8((uint64_t *)&unk_100059ED0);
  v24 = sub_10000FA94((unint64_t *)&unk_10005A490, (uint64_t *)&unk_100059ED0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(v43, v23, v24, v6, v22);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v38);
  *(_QWORD *)&v18[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_workerQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000021, 0x800000010003BEB0, v11, v8, v5, 0);

  v25 = (objc_class *)type metadata accessor for LockScreenCoordinator();
  v44.receiver = v18;
  v44.super_class = v25;
  v26 = objc_msgSendSuper2(&v44, "init");
  v27 = qword_1000589B0;
  v28 = (char *)v26;
  if (v27 != -1)
    swift_once(&qword_1000589B0, sub_100014740);
  swift_beginAccess(qword_10005B1A0 + OBJC_IVAR____TtC13MediaRemoteUI12SceneMonitor__isAmbientSceneActive, v43, 33, 0);
  v29 = sub_100006CE8((uint64_t *)&unk_100059560);
  v30 = v39;
  Published.projectedValue.getter(v29);
  swift_endAccess(v43);
  v31 = swift_allocObject(&unk_100046280, 24, 7);
  swift_unknownObjectWeakInit(v31 + 16, v28);
  v32 = sub_10000FA94(&qword_100059690, &qword_100059660, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v33 = v41;
  v34 = Publisher<>.sink(receiveValue:)(sub_100029694, v31, v41, v32);
  v35 = swift_release(v31);
  (*(void (**)(char *, uint64_t, __n128))(v40 + 8))(v30, v33, v35);
  v43[3] = type metadata accessor for AnyCancellable(0);
  v43[4] = &protocol witness table for AnyCancellable;

  v43[0] = v34;
  v36 = (uint64_t)&v28[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable];
  swift_beginAccess(&v28[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable], v42, 33, 0);
  sub_10000F9E0((uint64_t)v43, v36);
  swift_endAccess(v42);
  return v28;
}

void sub_100027184(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  _BYTE v7[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3, v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    sub_10002882C(v2);

  }
}

id LockScreenCoordinator.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService], "invalidate");
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockScreenCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LockScreenCoordinator()
{
  return objc_opt_self(_TtC13MediaRemoteUI21LockScreenCoordinator);
}

void sub_100027358(double a1, double a2)
{
  char *v2;
  void *v3;
  double *v6;
  uint64_t v7;
  char *v8;
  id v9;
  unsigned int v10;
  char *v11;
  id v12;

  v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer];
  if (v3)
  {
    v12 = v3;
    if ((objc_msgSend(v12, "isShowingMediaSuggestions") & 1) == 0)
    {
      v6 = (double *)&v2[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize];
      *v6 = a1;
      v6[1] = a2;
      *((_BYTE *)v6 + 16) = 0;
      if ((sub_100026C14() & 1) != 0)
      {
        if (*(_QWORD *)&v2[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
        {
          sub_100028A50(1, 0, 0);
          goto LABEL_11;
        }
        v9 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
        v10 = objc_msgSend(v9, "supportLockScreenBackground");

        if (!v10)
          goto LABEL_11;
        v7 = swift_allocObject(&unk_100046550, 25, 7);
        *(_QWORD *)(v7 + 16) = v2;
        *(_BYTE *)(v7 + 24) = 0;
        v11 = v2;
        sub_10002778C((uint64_t)sub_10002983C, v7);
      }
      else
      {
        v7 = swift_allocObject(&unk_100046528, 24, 7);
        *(_QWORD *)(v7 + 16) = v2;
        v8 = v2;
        sub_100028A50(0, (uint64_t)sub_10002989C, v7);
      }

      swift_release(v7);
      return;
    }
LABEL_11:

  }
}

void sub_100027534(CGFloat a1, CGFloat a2)
{
  void *v4;
  id v5;
  CGPoint v6;
  CGRect v7;

  if (qword_1000589E0 != -1)
    swift_once(&qword_1000589E0, sub_100026454);
  v4 = *(void **)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  if (v4)
  {
    v5 = objc_msgSend(v4, "artworkView");
    objc_msgSend(v5, "frame");
    v6.x = a1;
    v6.y = a2;
    if (CGRectContainsPoint(v7, v6))
      sub_100026AD8(0);

  }
}

uint64_t sub_100027638()
{
  uint64_t v0;
  id v1;
  unsigned int v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v1 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
  v2 = objc_msgSend(v1, "supportLockScreenBackground");

  if (!v2)
    return 0;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (!v3)
    return 0;
  v4 = objc_msgSend(v3, "catalog");
  if (!v4)
    return 0;

  v5 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != (id)1)
  {
    v7 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v8 = objc_msgSend(v7, "activeInterfaceOrientation");

    if (!sub_1000293FC((uint64_t)v8))
      return 0;
  }
  v9 = 1;
  sub_100026AD8(1);
  return v9;
}

uint64_t sub_10002778C(uint64_t a1, uint64_t a2)
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
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  NSObject *v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  _QWORD v50[2];
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void **aBlock;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD *v69;

  v58 = a2;
  v56 = a1;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v61 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v52 = *(void (**)(char *, uint64_t))(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject(&unk_100046370, 56, 7);
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  v57 = v9;
  *(_BYTE *)(v9 + 48) = 1;
  v10 = swift_allocObject(&unk_100046370, 56, 7);
  v62 = v10;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_OWORD *)(v10 + 32) = 0u;
  *(_BYTE *)(v10 + 48) = 1;
  v11 = swift_allocObject(&unk_100046370, 56, 7);
  *(_OWORD *)(v11 + 16) = 0u;
  *(_OWORD *)(v11 + 32) = 0u;
  *(_BYTE *)(v11 + 48) = 1;
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v60 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_workerQueue);
  v13 = swift_allocObject(&unk_100046398, 32, 7);
  *(_QWORD *)(v13 + 16) = v11;
  *(_QWORD *)(v13 + 24) = v12;
  v68 = sub_1000294FC;
  v69 = (_QWORD *)v13;
  aBlock = _NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_100011C50;
  v67 = &unk_1000463B0;
  v14 = _Block_copy(&aBlock);
  swift_retain(v11);
  v15 = v12;
  static DispatchQoS.unspecified.getter(v15);
  v63 = &_swiftEmptyArrayStorage;
  v16 = sub_100006870((unint64_t *)&qword_10005A670, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v17 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v18 = sub_10000FA94((unint64_t *)&qword_10005A680, (uint64_t *)&unk_100059E50, (uint64_t)&protocol conformance descriptor for [A]);
  v54 = v17;
  v55 = v16;
  v51 = v18;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v63, v17, v18, v3, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v14);
  _Block_release(v14);
  v19 = *(void (**)(char *, uint64_t))(v61 + 8);
  v59 = v5;
  v60 = v3;
  v20 = v5;
  v21 = v8;
  v22 = v3;
  v23 = (char *)v50[1];
  v53 = v19;
  v19(v20, v22);
  v24 = (void (*)(char *, uint64_t))*((_QWORD *)v52 + 1);
  v61 = v6;
  v52 = v24;
  v24(v8, v6);
  swift_release(v69);
  v25 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v26 = objc_msgSend(v25, "userInterfaceIdiom");

  if (v26 == (id)1)
  {
    dispatch_group_enter(v15);
    v27 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService];
    v28 = swift_allocObject(&unk_100046488, 32, 7);
    v29 = v62;
    *(_QWORD *)(v28 + 16) = v62;
    *(_QWORD *)(v28 + 24) = v15;
    v68 = sub_10002958C;
    v69 = (_QWORD *)v28;
    aBlock = _NSConcreteStackBlock;
    v65 = 1107296256;
    v66 = sub_100027FC0;
    v67 = &unk_1000464A0;
    v30 = _Block_copy(&aBlock);
    v31 = v69;
    v32 = v15;
    swift_retain(v29);
    swift_release(v31);
    objc_msgSend(v27, "fetchLockScreenContentCutoutBoundsForOrientation:completionHandler:", 1, v30);
    _Block_release(v30);
  }
  dispatch_group_enter(v15);
  v33 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService];
  v34 = swift_allocObject(&unk_1000463E8, 32, 7);
  v35 = v57;
  *(_QWORD *)(v34 + 16) = v57;
  *(_QWORD *)(v34 + 24) = v15;
  v68 = sub_100029840;
  v69 = (_QWORD *)v34;
  aBlock = _NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_100027FC0;
  v67 = &unk_100046400;
  v36 = _Block_copy(&aBlock);
  v37 = v69;
  v38 = v15;
  swift_retain(v35);
  swift_release(v37);
  objc_msgSend(v33, "fetchMaximalLockScreenContentCutoutBoundsForOrientation:completionHandler:", 1, v36);
  _Block_release(v36);
  sub_10000E5A0();
  v39 = (void *)static OS_dispatch_queue.main.getter();
  v40 = (_QWORD *)swift_allocObject(&unk_100046438, 64, 7);
  v40[2] = v35;
  v40[3] = v11;
  v41 = v62;
  v40[4] = v62;
  v40[5] = v23;
  v42 = v58;
  v40[6] = v56;
  v40[7] = v42;
  v68 = sub_10002954C;
  v69 = v40;
  aBlock = _NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_100011C50;
  v67 = &unk_100046450;
  v43 = _Block_copy(&aBlock);
  swift_retain(v11);
  swift_retain(v41);
  swift_retain(v35);
  v44 = v23;
  swift_retain(v42);
  static DispatchQoS.unspecified.getter(v45);
  v63 = &_swiftEmptyArrayStorage;
  v47 = v59;
  v46 = v60;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v63, v54, v51, v60, v55);
  OS_dispatch_group.notify(qos:flags:queue:execute:)(v21, v47, v39, v43);
  _Block_release(v43);

  v53(v47, v46);
  v52(v21, v61);
  v48 = v69;
  swift_release(v35);
  swift_release(v41);
  swift_release(v11);
  return swift_release(v48);
}

id sub_100027D08(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id result;
  uint64_t ObjCClassMetadata;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[5];
  _QWORD *v25;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v23 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_1000295A4();
  if (result)
  {
    ObjCClassMetadata = swift_getObjCClassMetadata(result);
    sub_10000E5A0();
    v13 = (void *)static OS_dispatch_queue.main.getter();
    v14 = (_QWORD *)swift_allocObject(&unk_1000464D8, 40, 7);
    v14[2] = a1;
    v14[3] = ObjCClassMetadata;
    v14[4] = a2;
    aBlock[4] = sub_100029688;
    v25 = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100011C50;
    aBlock[3] = &unk_1000464F0;
    v15 = _Block_copy(aBlock);
    v16 = v25;
    swift_retain(a1);
    v17 = a2;
    v18 = swift_release(v16);
    static DispatchQoS.unspecified.getter(v18);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v19 = sub_100006870((unint64_t *)&qword_10005A670, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v20 = sub_100006CE8((uint64_t *)&unk_100059E50);
    v21 = sub_10000FA94((unint64_t *)&qword_10005A680, (uint64_t *)&unk_100059E50, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v20, v21, v4, v19);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100027F2C(uint64_t a1, uint64_t a2, NSObject *a3)
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
  _BYTE v14[24];

  v5 = a1 + 16;
  objc_msgSend((id)swift_getObjCClassFromMetadata(a2), "contentCutoutBoundsForInterfaceOrientation:", 1);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_beginAccess(v5, v14, 1, 0);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 40) = v13;
  *(_BYTE *)(a1 + 48) = 0;
  dispatch_group_leave(a3);
}

uint64_t sub_100027FC0(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void (*v9)(double, double, double, double);
  uint64_t v10;

  v9 = *(void (**)(double, double, double, double))(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  swift_retain(v10);
  v9(a2, a3, a4, a5);
  return swift_release(v10);
}

void sub_10002801C(uint64_t a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  _BYTE v12[24];

  if (!CGRectIsNull(*(CGRect *)&a3))
  {
    swift_beginAccess(a1 + 16, v12, 1, 0);
    *(double *)(a1 + 16) = a3;
    *(double *)(a1 + 24) = a4;
    *(double *)(a1 + 32) = a5;
    *(double *)(a1 + 40) = a6;
    *(_BYTE *)(a1 + 48) = 0;
  }
  dispatch_group_leave(a2);
}

uint64_t sub_100028094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  _BYTE v37[24];
  _BYTE v38[24];
  _BYTE v39[24];

  result = swift_beginAccess(a1 + 16, v39, 0, 0);
  if ((*(_BYTE *)(a1 + 48) & 1) == 0)
  {
    v12 = *(double *)(a1 + 32);
    v11 = *(double *)(a1 + 40);
    v14 = *(double *)(a1 + 16);
    v13 = *(double *)(a1 + 24);
    result = swift_beginAccess(a2 + 16, v38, 0, 0);
    if ((*(_BYTE *)(a2 + 48) & 1) == 0)
    {
      v33 = *(_OWORD *)(a2 + 32);
      v34 = *(_OWORD *)(a2 + 16);
      swift_beginAccess(a3 + 16, v37, 0, 0);
      v15 = v14;
      v16 = v13;
      v17 = v12;
      v18 = v11;
      if ((*(_BYTE *)(a3 + 48) & 1) == 0)
      {
        v17 = *(double *)(a3 + 32);
        v18 = *(double *)(a3 + 40);
        v15 = *(double *)(a3 + 16);
        v16 = *(double *)(a3 + 24);
      }
      v35 = v17;
      v36 = v18;
      v19 = a4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds;
      *(_OWORD *)v19 = v34;
      *(_OWORD *)(v19 + 16) = v33;
      *(_BYTE *)(v19 + 32) = 0;
      v20 = (void *)objc_opt_self(UIScreen);
      v21 = objc_msgSend(v20, "mainScreen");
      objc_msgSend(v21, "bounds");
      v23 = v22;
      v25 = v24;

      v26 = a4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds;
      *(double *)v26 = v14 * v23;
      *(double *)(v26 + 8) = v13 * v25;
      *(double *)(v26 + 16) = v12 * v23;
      *(double *)(v26 + 24) = v11 * v25;
      *(_BYTE *)(v26 + 32) = 0;
      v27 = objc_msgSend(v20, "mainScreen");
      objc_msgSend(v27, "bounds");
      v29 = v28;
      v31 = v30;

      v32 = a4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds;
      *(double *)v32 = v15 * v29;
      *(double *)(v32 + 8) = v16 * v31;
      *(double *)(v32 + 16) = v35 * v29;
      *(double *)(v32 + 24) = v36 * v31;
      *(_BYTE *)(v32 + 32) = 0;
      return a5();
    }
  }
  return result;
}

double sub_10002826C()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double result;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  char *v16;
  id v17;
  unsigned int v18;
  char *v19;
  _QWORD v20[5];
  uint64_t v21;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer], "invalidate");
  v2 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = 0;

  v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork];
  if (!v3)
    goto LABEL_8;
  v4 = objc_msgSend(v3, "catalog");
  if (!v4)
    goto LABEL_8;

  v5 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1
    || (v7 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication"),
        v8 = objc_msgSend(v7, "activeInterfaceOrientation"),
        v7,
        sub_1000293FC((uint64_t)v8)))
  {
    if ((sub_100026C14() & 1) == 0)
    {
      v15 = swift_allocObject(&unk_1000462D0, 24, 7);
      *(_QWORD *)(v15 + 16) = v0;
      v16 = v0;
      sub_100028DA0(0, 1, (uint64_t)sub_10002989C, v15);
LABEL_11:
      *(_QWORD *)&result = swift_release(v15).n128_u64[0];
      return result;
    }
    if (*(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
    {
      sub_100028DA0(1, 1, 0, 0);
      return result;
    }
    v17 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
    v18 = objc_msgSend(v17, "supportLockScreenBackground");

    if (v18)
    {
      v15 = swift_allocObject(&unk_1000462F8, 25, 7);
      *(_QWORD *)(v15 + 16) = v0;
      *(_BYTE *)(v15 + 24) = 1;
      v19 = v0;
      sub_10002778C((uint64_t)sub_10002983C, v15);
      goto LABEL_11;
    }
  }
  else
  {
LABEL_8:
    v10 = swift_allocObject(&unk_100046280, 24, 7);
    swift_unknownObjectWeakInit(v10 + 16, v0);
    v20[4] = sub_1000294E0;
    v21 = v10;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 1107296256;
    v20[2] = sub_100011C50;
    v20[3] = &unk_100046298;
    v11 = _Block_copy(v20);
    v12 = v21;
    swift_retain(v10);
    swift_release(v12);
    v13 = objc_msgSend((id)objc_opt_self(MSVTimer), "timerWithInterval:repeats:block:", 0, v11, 2.0);
    _Block_release(v11);
    swift_release(v10);
    v14 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v13;

  }
  return result;
}

void sub_10002854C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  unsigned int v8;
  char v9[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1, v2);
  if (Strong)
  {
    v4 = (char *)Strong;
    if ((sub_100026C14() & 1) != 0)
    {
      if (*(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer])
      {
        sub_100028DA0(1, 1, 0, 0);
LABEL_9:

        return;
      }
      v7 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
      v8 = objc_msgSend(v7, "supportLockScreenBackground");

      if (!v8)
        goto LABEL_9;
      v5 = swift_allocObject(&unk_100046348, 25, 7);
      *(_QWORD *)(v5 + 16) = v4;
      *(_BYTE *)(v5 + 24) = 1;
      v6 = v4;
      sub_10002778C((uint64_t)sub_10002983C, v5);
    }
    else
    {
      v5 = swift_allocObject(&unk_100046320, 24, 7);
      *(_QWORD *)(v5 + 16) = v4;
      v6 = v4;
      sub_100028DA0(0, 1, (uint64_t)sub_10002989C, v5);
    }

    swift_release(v5);
  }
}

void sub_100028698(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState) != 1)
    goto LABEL_7;
  v2 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  if (!v2)
    goto LABEL_7;
  v3 = objc_msgSend(v2, "catalog");
  if (!v3)
    goto LABEL_7;

  v4 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != (id)1)
  {
    v6 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v7 = objc_msgSend(v6, "activeInterfaceOrientation");

    if (!sub_1000293FC((uint64_t)v7))
      goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer))
  {
LABEL_7:
    v8 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion);
    *(_QWORD *)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion) = 0;

  }
}

void sub_1000287B0(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v4 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion;
  v5 = *(void **)(a1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion);
  if (!v5 || (objc_msgSend(v5, "isValid") & 1) == 0)
  {
    v6 = objc_msgSend(objc_allocWithZone((Class)MRUILockScreenAssertion), "initWithAnimated:", a2 & 1);
    v7 = *(void **)(a1 + v4);
    *(_QWORD *)(a1 + v4) = v6;

  }
}

void sub_10002882C(uint64_t a1)
{
  uint64_t v1;
  char v2;
  os_log_type_t v3;
  NSObject *v4;
  uint8_t *v5;
  char v6;
  id v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;

  v2 = a1;
  v3 = static os_log_type_t.default.getter(a1);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v4 = qword_10005B240;
  if (os_log_type_enabled((os_log_t)qword_10005B240, v3))
  {
    v5 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 67109120;
    v15 = v2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16);
    _os_log_impl((void *)&_mh_execute_header, v4, v3, "LockScreenCoordinator handleAmbientSceneIsActive:%{BOOL}d", v5, 8u);
    swift_slowDealloc(v5, -1, -1);
  }
  if ((v2 & 1) != 0)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_shouldExpandWhenAmbientSceneDisconnects) = *(_BYTE *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState);
    v6 = 0;
LABEL_7:
    sub_100026AD8(v6);
    return;
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_shouldExpandWhenAmbientSceneDisconnects) == 1)
  {
    v7 = objc_msgSend((id)objc_opt_self(MRSharedSettings), "currentSettings");
    v8 = objc_msgSend(v7, "supportLockScreenBackground");

    if (v8)
    {
      v9 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
      if (v9)
      {
        v10 = objc_msgSend(v9, "catalog");
        if (v10)
        {

          v11 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
          v12 = objc_msgSend(v11, "userInterfaceIdiom");

          if (v12 == (id)1
            || (v13 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication"),
                v14 = objc_msgSend(v13, "activeInterfaceOrientation"),
                v13,
                sub_1000293FC((uint64_t)v14)))
          {
            v6 = 1;
            goto LABEL_7;
          }
        }
      }
    }
  }
}

void sub_100028A50(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  CGFloat *v17;
  CGFloat *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat MinY;
  CGFloat v28;
  id v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double Height;
  uint64_t v39;
  char *v40;
  double v41;
  CGFloat *v42;
  CGFloat *v43;
  double *v44;
  char *v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double MaxY;
  double v55;
  _QWORD aBlock[5];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v4 = v3;
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_prefersExpandedState) == (a1 & 1))
  {
    v6 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer;
    v7 = *(void **)(v3 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
    if (v7)
    {
      if (a2)
      {
        aBlock[4] = a2;
        v57 = a3;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100011C50;
        aBlock[3] = &unk_100046248;
        v10 = _Block_copy(aBlock);
        v11 = v57;
        v12 = v7;
        sub_1000294AC(a2, a3);
        swift_release(v11);
      }
      else
      {
        v13 = v7;
        v10 = 0;
      }
      objc_msgSend(v7, "setShowArtworkView:completion:", (a1 & 1) == 0, v10);
      _Block_release(v10);

      v14 = *(void **)(v4 + v6);
      if (v14)
      {
        v15 = objc_msgSend(v14, "view");
        if (!v15)
        {
          __break(1u);
          goto LABEL_21;
        }
        v16 = v15;
        objc_msgSend(v15, "layoutIfNeeded");

      }
    }
  }
  v17 = (CGFloat *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds);
  if ((*(_BYTE *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_topBounds + 32) & 1) == 0)
  {
    v18 = (CGFloat *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds);
    if ((*(_BYTE *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_widgetsTopBounds + 32) & 1) == 0
      && (*(_BYTE *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds + 32) & 1) == 0
      && (*(_BYTE *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize + 16) & 1) == 0)
    {
      v20 = v17[2];
      v19 = v17[3];
      v22 = *v17;
      v21 = v17[1];
      v24 = v18[2];
      v23 = v18[3];
      v25 = *v18;
      v26 = v18[1];
      v55 = *(double *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContentSize + 8);
      MaxY = CGRectGetMaxY(*(CGRect *)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_bottomBounds));
      v58.origin.x = v22;
      v58.origin.y = v21;
      v58.size.width = v20;
      v58.size.height = v19;
      v53 = CGRectGetMaxY(v58);
      v59.origin.x = v22;
      v59.origin.y = v21;
      v59.size.width = v20;
      v59.size.height = v19;
      MinY = CGRectGetMinY(v59);
      v60.origin.x = v25;
      v60.origin.y = v26;
      v60.size.width = v24;
      v60.size.height = v23;
      v28 = CGRectGetMinY(v60);
      v29 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
      objc_msgSend(v29, "bounds");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;

      v61.origin.x = v31;
      v61.origin.y = v33;
      v61.size.width = v35;
      v61.size.height = v37;
      Height = CGRectGetHeight(v61);
      v39 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer;
      v40 = *(char **)(v4 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
      if (v40)
      {
        v41 = v53 + -80.0;
        if (v53 + -80.0 >= MaxY)
          v41 = MaxY;
        v42 = (CGFloat *)&v40[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap];
        *v42 = MinY;
        *((_BYTE *)v42 + 8) = 0;
        v43 = (CGFloat *)&v40[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap];
        *v43 = v28;
        *((_BYTE *)v43 + 8) = 0;
        v44 = (double *)&v40[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap];
        *v44 = v55 + Height - v41 + 20.0;
        *((_BYTE *)v44 + 8) = 0;
        v45 = v40;
        v46 = objc_msgSend(v45, "view");
        if (v46)
        {
          v47 = v46;
          objc_msgSend(v46, "bounds");
          v49 = v48;
          v51 = v50;

          sub_10000F534(v49, v51);
          v52 = *(void **)(v4 + v39);
          if (v52)
            objc_msgSend(v52, "setArtworkVisible:", a1 & 1);
          return;
        }
LABEL_21:
        __break(1u);
      }
    }
  }
}

void sub_100028DA0(char a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  if ((a2 & 1) != 0)
  {
    v8 = (void *)objc_opt_self(UIView);
    v9 = swift_allocObject(&unk_1000461B8, 25, 7);
    *(_QWORD *)(v9 + 16) = v4;
    *(_BYTE *)(v9 + 24) = a1 & 1;
    v20 = sub_10002940C;
    v21 = v9;
    v16 = _NSConcreteStackBlock;
    v17 = 1107296256;
    v18 = sub_100011C50;
    v19 = &unk_1000461D0;
    v10 = _Block_copy(&v16);
    v11 = v21;
    v12 = v4;
    swift_release(v11);
    v13 = swift_allocObject(&unk_100046208, 32, 7);
    *(_QWORD *)(v13 + 16) = a3;
    *(_QWORD *)(v13 + 24) = a4;
    v20 = sub_100029480;
    v21 = v13;
    v16 = _NSConcreteStackBlock;
    v17 = 1107296256;
    v18 = sub_100026418;
    v19 = &unk_100046220;
    v14 = _Block_copy(&v16);
    v15 = v21;
    sub_1000294AC(a3, a4);
    swift_release(v15);
    objc_msgSend(v8, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 1, v10, v14, 0.8, 0.0, 2.0, 300.0, 42.0, 0.0);
    _Block_release(v14);
    _Block_release(v10);
  }
  else
  {
    sub_100028A50(a1 & 1, a3, a4);
  }
}

void LockScreenCoordinator.nowPlayingController(_:metadataController:didChange:)(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1000292E8(a3);
}

void LockScreenCoordinator.artworkView(_:didChangeArtworkImage:)()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSString v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
  if (v1)
  {
    v2 = v1;
    v3 = String._bridgeToObjectiveC()();
    objc_msgSend(v2, "invalidateAllTimelinesForReason:", v3);

  }
}

void *sub_100029134(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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

uint64_t sub_1000291C8(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1000291EC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10002920C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void sub_100029234(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v2 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = a1;
  v4 = a1;

  sub_10002826C();
  v5 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  if (v5)
  {
    v8 = *(id *)(v1 + v2);
    v6 = v5;
    v7 = objc_msgSend(v6, "artworkView");
    objc_msgSend(v7, "setArtwork:", v8);

  }
}

void sub_1000292E8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v2 = OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork) = a1;
  v9 = a1;

  sub_10002826C();
  v4 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  if (v4)
  {
    v5 = *(id *)(v1 + v2);
    v6 = v4;
    v7 = objc_msgSend(v6, "artworkView");
    objc_msgSend(v7, "setArtwork:", v5);

    v8 = v5;
  }
  else
  {
    v8 = v9;
  }

}

uint64_t sub_1000293A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000293C4()
{
  uint64_t v0;

  sub_100028698(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000293CC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

void sub_1000293F0()
{
  uint64_t v0;

  sub_1000287B0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

BOOL sub_1000293FC(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void sub_10002940C()
{
  uint64_t v0;

  sub_100028A50(*(_BYTE *)(v0 + 24), 0, 0);
}

double sub_10002943C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10002944C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100029454()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100029480(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(void);

  if ((result & 1) != 0)
  {
    v2 = *(uint64_t (**)(void))(v1 + 16);
    if (v2)
      return v2();
  }
  return result;
}

double sub_1000294AC(uint64_t a1, uint64_t a2)
{
  double result;

  if (a1)
    *(_QWORD *)&result = swift_retain(a2).n128_u64[0];
  return result;
}

uint64_t sub_1000294BC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000294E0()
{
  uint64_t v0;

  sub_10002854C(v0);
}

uint64_t sub_1000294E8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 56, 7);
}

id sub_1000294FC()
{
  uint64_t v0;

  return sub_100027D08(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100029508()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002954C()
{
  uint64_t v0;

  return sub_100028094(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(uint64_t (**)(void))(v0 + 48));
}

uint64_t sub_100029560()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_10002958C(double a1, double a2, double a3, double a4)
{
  uint64_t v4;

  sub_10002801C(*(_QWORD *)(v4 + 16), *(NSObject **)(v4 + 24), a1, a2, a3, a4);
}

id sub_1000295A4()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_10005B150;
  v7 = qword_10005B150;
  if (!qword_10005B150)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10002969C;
    v3[3] = &unk_100046610;
    v3[4] = &v4;
    sub_10002969C(v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100029644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002965C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

void sub_100029688()
{
  uint64_t v0;

  sub_100027F2C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(NSObject **)(v0 + 32));
}

void sub_100029694(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_100027184(a1, v1);
}

Class sub_10002969C(_QWORD *a1)
{
  void *v2;
  Class result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;

  v7 = 0;
  if (!qword_10005B158)
  {
    v8 = off_100046630;
    v9 = 0;
    qword_10005B158 = _sl_dlopen(&v8, &v7);
  }
  if (qword_10005B158)
  {
    v2 = v7;
    if (!v7)
      goto LABEL_5;
  }
  else
  {
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoverSheetLibrary(void)"));
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MediaRemoteUI-Bridging-Header.h"), 17, CFSTR("%s"), v7);

    __break(1u);
  }
  free(v2);
LABEL_5:
  result = objc_getClass("CSContentCutoutBoundsCalculator");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getCSContentCutoutBoundsCalculatorClass(void)_block_invoke"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MediaRemoteUI-Bridging-Header.h"), 18, CFSTR("Unable to find class %s"), "CSContentCutoutBoundsCalculator");

    __break(1u);
  }
  qword_10005B150 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_1000298B4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001E0F0(v0, qword_10005A4A0);
  sub_1000163A0(v0, (uint64_t)qword_10005A4A0);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return Logger.init(_:)((id)qword_10005B240);
}

id sub_100029960()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BannerPresenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BannerPresenter()
{
  return objc_opt_self(_TtC13MediaRemoteUI15BannerPresenter);
}

uint64_t sub_1000299E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100029A10(a1, a2, a3, a4, 3);
}

uint64_t sub_1000299F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100029A10(a1, a2, a3, a4, 0);
}

uint64_t sub_1000299F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100029A10(a1, a2, a3, a4, 1);
}

uint64_t sub_100029A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100029A10(a1, a2, a3, a4, 2);
}

uint64_t sub_100029A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100029A10(a1, a2, a3, a4, 4);
}

uint64_t sub_100029A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;

  v9 = v5 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate;
  result = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate, a2);
  if (result)
  {
    v11 = result;
    v12 = *(_QWORD *)(v9 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a1, a2, a5, ObjectType, v12);
    return swift_unknownObjectRelease(v11);
  }
  return result;
}

uint64_t sub_100029AA0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xB8))();
}

void sub_100029ABC(void *a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  NSDictionary v22;
  unsigned int v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t Strong;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v79;
  uint64_t v80;
  id v81;

  v3 = a3;
  ObjectType = swift_getObjectType(a3);
  if (qword_1000589E8 != -1)
    swift_once(&qword_1000589E8, sub_1000298B4);
  v6 = type metadata accessor for Logger(0);
  sub_1000163A0(v6, (uint64_t)qword_10005A4A0);
  v7 = swift_unknownObjectRetain_n(a1, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(22, -1);
    v72 = (void *)swift_slowAlloc(64, -1);
    v81 = v72;
    *(_DWORD *)v10 = 136315394;
    v76 = v3;
    v11 = a1;
    v12 = _typeName(_:qualified:)(ObjectType, 0);
    v74 = ObjectType;
    v14 = v13;
    v80 = sub_100030094(v12, v13, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    swift_bridgeObjectRelease(v14);
    *(_WORD *)(v10 + 12) = 2080;
    v15 = objc_msgSend(a1, "description");
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v18 = v17;

    a1 = v11;
    v3 = v76;
    v80 = sub_100030094(v16, v18, (uint64_t *)&v81);
    ObjectType = v74;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%s] Will present %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy(v72, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v72, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
  v19 = *(void **)(v3 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source);
  if (!v19)
    goto LABEL_12;
  v20 = sub_10002A2B0(a2 & 1);
  if (v20)
  {
    v21 = v20;
    sub_100006CE8(&qword_10005A4F8);
    v22.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
  }
  else
  {
    v22.super.isa = 0;
  }
  v81 = 0;
  v23 = objc_msgSend(v19, "postPresentable:options:userInfo:error:", a1, 1, v22.super.isa, &v81, v72);

  v24 = v81;
  if (v23)
  {
    v25 = v81;
LABEL_12:
    v26 = swift_unknownObjectRetain_n(a1, 2);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc(22, -1);
      v30 = (void *)swift_slowAlloc(64, -1);
      v81 = v30;
      *(_DWORD *)v29 = 136315394;
      v31 = _typeName(_:qualified:)(ObjectType, 0);
      v33 = v32;
      v80 = sub_100030094(v31, v32, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
      swift_bridgeObjectRelease(v33);
      *(_WORD *)(v29 + 12) = 2080;
      v34 = objc_msgSend(a1, "requestIdentifier");
      if (v34)
      {
        v35 = v34;
        v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
        v38 = v37;

      }
      else
      {
        v36 = 0;
        v38 = 0;
      }
      v54 = Optional<A>.description.getter(v36, v38);
      v56 = v55;
      swift_bridgeObjectRelease(v38);
      v80 = sub_100030094(v54, v56, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
      swift_unknownObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v56);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%s] Presented %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n(a1, 2);
    }
    return;
  }
  v39 = v81;
  v40 = _convertNSErrorToError(_:)(v24);

  swift_willThrow();
  swift_unknownObjectRetain(a1);
  swift_errorRetain(v40);
  swift_unknownObjectRetain(a1);
  v41 = swift_errorRetain(v40);
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v77 = v3;
    v44 = swift_slowAlloc(32, -1);
    v73 = (uint64_t *)swift_slowAlloc(8, -1);
    v75 = (void *)swift_slowAlloc(64, -1);
    v81 = v75;
    *(_DWORD *)v44 = 136315650;
    v45 = _typeName(_:qualified:)(ObjectType, 0);
    v47 = v46;
    v80 = sub_100030094(v45, v46, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    swift_bridgeObjectRelease(v47);
    *(_WORD *)(v44 + 12) = 2080;
    v79 = a1;
    v48 = objc_msgSend(a1, "requestIdentifier");
    if (v48)
    {
      v49 = v48;
      v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
      v52 = v51;

    }
    else
    {
      v50 = 0;
      v52 = 0;
    }
    v3 = v77;
    v57 = Optional<A>.description.getter(v50, v52);
    v59 = v58;
    swift_bridgeObjectRelease(v52);
    v80 = sub_100030094(v57, v59, (uint64_t *)&v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    a1 = v79;
    swift_unknownObjectRelease_n(v79, 2);
    swift_bridgeObjectRelease(v59);
    *(_WORD *)(v44 + 22) = 2112;
    swift_errorRetain(v40);
    v60 = _swift_stdlib_bridgeErrorToNSError(v40);
    v80 = v60;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    *v73 = v60;
    swift_errorRelease(v40);
    swift_errorRelease(v40);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "[%s] Presentable %s failed with: %@", (uint8_t *)v44, 0x20u);
    v61 = sub_100006CE8(&qword_10005A4F0);
    swift_arrayDestroy(v73, 1, v61);
    swift_slowDealloc(v73, -1, -1);
    swift_arrayDestroy(v75, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v75, -1, -1);
    swift_slowDealloc(v44, -1, -1);

  }
  else
  {
    swift_unknownObjectRelease_n(a1, 2);
    swift_errorRelease(v40);
    swift_errorRelease(v40);

  }
  v62 = v3 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate;
  Strong = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate, v53);
  if (Strong)
  {
    v64 = Strong;
    v65 = *(_QWORD *)(v62 + 8);
    v66 = objc_msgSend(a1, "requestIdentifier");
    if (v66)
    {
      v67 = v66;
      v68 = swift_getObjectType(v64);
      v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v67);
      v71 = v70;

      (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v65 + 8))(v69, v71, 0, v68, v65);
      swift_errorRelease(v40);
      swift_bridgeObjectRelease(v71);
      swift_unknownObjectRelease(v64);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_errorRelease(v40);
  }
}

unint64_t sub_10002A2B0(Swift::Bool a1)
{
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;

  v2 = sub_100006CE8(&qword_10005A500);
  inited = swift_initStackObject(v2, &v9);
  *(_OWORD *)(inited + 16) = xmmword_100034650;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kSBUIPresentableSystemApertureSupportingUserInfoKey);
  *(_QWORD *)(inited + 40) = v4;
  v5 = sub_10002A354();
  v6 = SBUIIsSystemApertureEnabled(v5);
  *(NSNumber *)(inited + 48) = NSNumber.init(BOOLeanLiteral:)(v6);
  *(_QWORD *)(inited + 56) = static String._unconditionallyBridgeFromObjectiveC(_:)(kSBUIPresentableShouldBypassScreenSharingUserInfoKey);
  *(_QWORD *)(inited + 64) = v7;
  *(NSNumber *)(inited + 72) = NSNumber.init(BOOLeanLiteral:)(a1);
  return sub_10002B74C(inited);
}

unint64_t sub_10002A354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100059340;
  if (!qword_100059340)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100059340);
  }
  return result;
}

uint64_t sub_10002A390(void *a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  if (SBUIIsSystemApertureEnabled(a1))
  {
    objc_allocWithZone((Class)type metadata accessor for GroupSessionSystemApertureViewController());
    v4 = a2;
    v5 = a1;
    v6 = sub_100007404(v4, (uint64_t)a1, (uint64_t)&off_100046648);
  }
  else
  {
    objc_allocWithZone((Class)type metadata accessor for GroupSessionBannerViewController());
    v7 = a2;
    v8 = a1;
    v6 = sub_1000184A8(v7, (uint64_t)a1, (uint64_t)&off_100046648);
  }
  v9 = v6;
  swift_getObjectType(v6);
  sub_100029ABC(v9, 0, (uint64_t)a1);
  return swift_unknownObjectRelease(v9);
}

id sub_10002A44C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionBannerPresenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GroupSessionBannerPresenter()
{
  return objc_opt_self(_TtC13MediaRemoteUI27GroupSessionBannerPresenter);
}

uint64_t sub_10002A49C(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
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
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E5A0();
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_100046690, 32, 7);
  *(_QWORD *)(v12 + 16) = v1;
  *(_QWORD *)(v12 + 24) = a1;
  aBlock[4] = sub_10002A6A0;
  v25 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011C50;
  aBlock[3] = &unk_1000466A8;
  v13 = _Block_copy(aBlock);
  v14 = v25;
  v15 = v2;
  v16 = a1;
  swift_release(v14);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = _swiftEmptyArrayStorage;
  v18 = sub_10000E620();
  v19 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v20 = sub_10000E668();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v4, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10002A674()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A6A0()
{
  uint64_t v0;

  return sub_10002A390(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

double sub_10002A6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10002A6B8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10002A6C0()
{
  void *v0;
  uint64_t v1;
  char *v2;
  void *v3;
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  objc_super v12;

  v1 = qword_1000589F0;
  v2 = v0;
  if (v1 != -1)
    swift_once(&qword_1000589F0, sub_10002ECD0);
  v3 = (void *)qword_10005B290;
  v4 = objc_allocWithZone((Class)type metadata accessor for ClientConnectionManager());
  v5 = v3;
  v6 = objc_msgSend(v4, "init");
  v7 = OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager;
  v8 = *(void **)&v5[OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager];
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI10MainServer_clientConnectionManager] = v6;

  v9 = *(void **)&v5[v7];
  if (v9)
  {
    v10 = OBJC_IVAR____TtC13MediaRemoteUI11AppDelegate_server;
    v11 = v9;
    sub_10001A6FC();

    *(_QWORD *)&v2[v10] = v5;
    v12.receiver = v2;
    v12.super_class = (Class)type metadata accessor for AppDelegate();
    objc_msgSendSuper2(&v12, "init");
  }
  else
  {
    __break(1u);
  }
}

id sub_10002A7C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI11AppDelegate);
}

_BYTE *sub_10002A824(char a1)
{
  _BYTE *v1;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  _BYTE *v6;
  unint64_t v7;
  _BYTE *v8;
  NSString v9;
  id v10;
  void *v11;
  _BYTE *v12;
  id v13;
  id v14;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  Class isa;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;

  sub_100006CE8(&qword_10005A5F0);
  __chkstk_darwin();
  v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[OBJC_IVAR____TtC13MediaRemoteUI13RouteIconView_routeType] = a1;
  v5 = (objc_class *)type metadata accessor for RouteIconView();
  v46.receiver = v1;
  v46.super_class = v5;
  v6 = objc_msgSendSuper2(&v46, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v7 = 0xE700000000000000;
  switch(v6[OBJC_IVAR____TtC13MediaRemoteUI13RouteIconView_routeType])
  {
    case 1:
      v7 = 0xE800000000000000;
      break;
    case 2:
      break;
    case 8:
    case 0xB:
      v7 = 0xEC0000006C6C6966;
      break;
    default:
      v7 = 0x800000010003C110;
      break;
  }
  v8 = v6;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v10 = objc_msgSend((id)objc_opt_self(UIImage), "_systemImageNamed:", v9);

  objc_msgSend(v8, "setImage:", v10);
  objc_msgSend(v8, "setContentMode:", 1);
  v11 = (void *)objc_opt_self(UIColor);
  v12 = v8;
  v13 = objc_msgSend(v11, "secondaryLabelColor");
  objc_msgSend(v12, "setTintColor:", v13);

  objc_msgSend(v12, "setClipsToBounds:", 0);
  v14 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v4, 1, 1, v15);
  type metadata accessor for MainActor(0);
  v16 = v12;
  v17 = v14;
  v18 = static MainActor.shared.getter();
  v19 = (_QWORD *)swift_allocObject(&unk_1000466F0, 48, 7);
  v19[2] = v18;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v17;
  v19[5] = v16;
  v20 = sub_10002B0DC((uint64_t)v4, (uint64_t)&unk_10005A600, (uint64_t)v19);
  swift_release(v20);
  objc_msgSend(v17, "setContentMode:", 1);
  v21 = objc_msgSend(v17, "layer");
  objc_msgSend(v21, "setShadowRadius:", 10.0);

  v22 = objc_msgSend(v17, "layer");
  v23 = objc_msgSend(v11, "blackColor");
  v24 = objc_msgSend(v23, "CGColor");

  objc_msgSend(v22, "setShadowColor:", v24);
  objc_msgSend(v17, "setClipsToBounds:", 0);
  v25 = objc_msgSend(v17, "layer");
  objc_msgSend(v25, "setMasksToBounds:", 0);

  objc_msgSend(v16, "addSubview:", v17);
  v26 = (void *)objc_opt_self(NSLayoutConstraint);
  v27 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v28 = swift_allocObject(v27, 64, 7);
  *(_OWORD *)(v28 + 16) = xmmword_100034700;
  v29 = objc_msgSend(v17, "leadingAnchor");
  v30 = objc_msgSend(v16, "centerXAnchor");
  v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 4.0);

  *(_QWORD *)(v28 + 32) = v31;
  v32 = objc_msgSend(v17, "topAnchor");
  v33 = objc_msgSend(v16, "centerYAnchor");
  v34 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 4.0);

  *(_QWORD *)(v28 + 40) = v34;
  v35 = objc_msgSend(v17, "widthAnchor");
  v36 = objc_msgSend(v16, "widthAnchor");
  v37 = objc_msgSend(v35, "constraintEqualToAnchor:multiplier:", v36, 0.4);

  *(_QWORD *)(v28 + 48) = v37;
  v38 = objc_msgSend(v17, "heightAnchor");
  v39 = objc_msgSend(v17, "widthAnchor");
  v40 = objc_msgSend(v38, "constraintEqualToAnchor:", v39);

  *(_QWORD *)(v28 + 56) = v40;
  v45 = v28;
  specialized Array._endMutation()();
  v41 = v45;
  sub_100006F84();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v41);
  objc_msgSend(v26, "activateConstraints:", isa);

  return v16;
}

uint64_t sub_10002AE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[16] = a4;
  v5[17] = a5;
  v6 = type metadata accessor for MainActor(0);
  v5[18] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v5[19] = v7;
  v5[20] = v8;
  return swift_task_switch(sub_10002AEBC, v7, v8);
}

uint64_t sub_10002AEBC()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  id v3;
  NSString v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0 + 2;
  v2 = (void *)v0[17];
  v3 = objc_msgSend((id)objc_opt_self(MRUAssetsProvider), "sharedAssetsProvider");
  v0[21] = v3;
  v4 = String._bridgeToObjectiveC()();
  v0[22] = v4;
  v5 = objc_msgSend(v2, "traitCollection");
  v0[23] = v5;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10002AFDC;
  v6 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v7 = v0 + 10;
  v7[1] = 0x40000000;
  v7[2] = sub_10002B094;
  v7[3] = &unk_100046730;
  v7[4] = v6;
  objc_msgSend(v3, "applicationIconForBundleIdentifier:traitCollection:completion:", v4, v5, v7);
  return swift_continuation_await(v1);
}

uint64_t sub_10002AFDC()
{
  uint64_t v0;

  return swift_task_switch(sub_10002B020, *(_QWORD *)(*(_QWORD *)v0 + 152), *(_QWORD *)(*(_QWORD *)v0 + 160));
}

uint64_t sub_10002B020()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(v0 + 176);
  v1 = *(void **)(v0 + 184);
  v3 = *(void **)(v0 + 168);
  v4 = *(void **)(v0 + 128);
  swift_release(*(_QWORD *)(v0 + 144));
  v5 = *(void **)(v0 + 120);
  objc_msgSend(v4, "setImage:", v5);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002B094(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_10002B5D8((uint64_t)&v6, v3);
  return swift_continuation_resume(v2);
}

uint64_t sub_10002B0DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10002B454(a1);
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
  v16 = swift_allocObject(&unk_100046718, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10005A610, v16);
}

id sub_10002B310()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RouteIconView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RouteIconView()
{
  return objc_opt_self(_TtC13MediaRemoteUI13RouteIconView);
}

uint64_t sub_10002B360()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002B394(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10005A5FC);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10002B40C;
  return sub_10002AE50(a1, v4, v5, v7, v6);
}

uint64_t sub_10002B40C()
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

uint64_t sub_10002B454(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006CE8(&qword_10005A5F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002B494(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10002B4F8;
  return v6(a1);
}

uint64_t sub_10002B4F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10002B544()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002B568(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10005A60C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10002B40C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10005A608 + dword_10005A608))(a1, v4);
}

uint64_t sub_10002B5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CE8(&qword_10005A618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10002B620(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006CE8(&qword_10005A698);
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
    sub_10002D0D0(v7, (uint64_t)v16);
    result = sub_10002CA08((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_1000098E4(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
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

unint64_t sub_10002B74C(uint64_t a1)
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
  sub_100006CE8(&qword_10005A688);
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
    result = sub_10002CA38(v7, v8);
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

id sub_10002B864()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  NSString v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_super v15;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter];
  }
  else
  {
    v4 = (char *)objc_allocWithZone((Class)type metadata accessor for GroupSessionBannerPresenter());
    v5 = &v4[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
    *((_QWORD *)v5 + 1) = 0;
    swift_unknownObjectWeakInit(v5, 0);
    v6 = OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source;
    v7 = v0;
    v8 = v4;
    v9 = String._bridgeToObjectiveC()();
    v10 = objc_msgSend((id)objc_opt_self(BNBannerSource), "bannerSourceForDestination:forRequesterIdentifier:", 0, v9);

    *(_QWORD *)&v4[v6] = v10;
    *((_QWORD *)v5 + 1) = &off_100046748;
    swift_unknownObjectWeakAssign(v5, v7);

    v15.receiver = v8;
    v15.super_class = (Class)type metadata accessor for BannerPresenter();
    v11 = objc_msgSendSuper2(&v15, "init");

    v12 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v11;
    v3 = v11;

    v2 = 0;
  }
  v13 = v2;
  return v3;
}

id sub_10002B9B8()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  char *v5;
  id v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter];
  }
  else
  {
    v4 = (char *)objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerPresenter());
    v5 = v0;
    v6 = sub_10002CC98((uint64_t)v5, v4);

    v7 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

uint64_t sub_10002BA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  _QWORD *v37;

  v7 = v6;
  v31 = a1;
  v13 = type metadata accessor for DispatchWorkItemFlags(0);
  v35 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchQoS(0);
  v33 = *(_QWORD *)(v16 - 8);
  v34 = v16;
  __chkstk_darwin(v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E5A0();
  v32 = static OS_dispatch_queue.main.getter();
  v19 = (_QWORD *)swift_allocObject(&unk_1000467B8, 72, 7);
  v19[2] = a3;
  v19[3] = a4;
  v20 = v31;
  v19[4] = v6;
  v19[5] = v20;
  v19[6] = a2;
  v19[7] = a5;
  v19[8] = a6;
  aBlock[4] = sub_10002CC84;
  v37 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011C50;
  aBlock[3] = &unk_1000467D0;
  v21 = _Block_copy(aBlock);
  v22 = v37;
  swift_bridgeObjectRetain(a4);
  v23 = v7;
  swift_bridgeObjectRetain(a2);
  sub_1000294AC(a5, a6);
  swift_release(v22);
  static DispatchQoS.unspecified.getter(v24);
  aBlock[0] = _swiftEmptyArrayStorage;
  v25 = sub_10000E620();
  v26 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v27 = sub_10000E668();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v26, v27, v13, v25);
  v28 = (void *)v32;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v18, v15, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v34);
}

void sub_10002BC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  NSString v8;
  void *v9;
  NSString v10;
  id v11;
  unint64_t v12;
  Class isa;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;

  v8 = String._bridgeToObjectiveC()();
  v9 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
  if (!v9)
  {
LABEL_4:
    if (a6)
      a6(0);

    return;
  }
  v10 = String._bridgeToObjectiveC()();
  v11 = v8;
  v12 = sub_10002B74C((uint64_t)_swiftEmptyArrayStorage);
  sub_100006CE8(&qword_10005A4F8);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  v27 = 0;
  v14 = objc_msgSend(v9, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v10, v11, 1, isa, &v27);

  v15 = v27;
  if (v14)
  {
    v16 = v27;

    goto LABEL_4;
  }
  v17 = v27;
  v18 = _convertNSErrorToError(_:)(v15);

  swift_willThrow();
  v20 = static os_log_type_t.default.getter(v19);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v21 = qword_10005B240;
  v22 = v20;
  if (os_log_type_enabled((os_log_t)qword_10005B240, v20))
  {
    swift_errorRetain(v18);
    swift_errorRetain(v18);
    v23 = (uint8_t *)swift_slowAlloc(12, -1);
    v24 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v23 = 138412290;
    swift_errorRetain(v18);
    v25 = (void *)_swift_stdlib_bridgeErrorToNSError(v18);
    v27 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
    *v24 = v25;
    swift_errorRelease(v18);
    swift_errorRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "revoke banner failed: %@", v23, 0xCu);
    v26 = sub_100006CE8(&qword_10005A4F0);
    swift_arrayDestroy(v24, 1, v26);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v23, -1, -1);
  }
  if (a6)
  {
    swift_errorRetain(v18);
    a6(v18);
    swift_errorRelease(v18);
  }
  swift_errorRelease(v18);
}

uint64_t sub_10002BF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[5];
  _QWORD *v31;

  v5 = v4;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v29 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v27 = *(_QWORD *)(v13 - 8);
  v28 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E5A0();
  v16 = (void *)static OS_dispatch_queue.main.getter();
  v17 = (_QWORD *)swift_allocObject(&unk_100046768, 56, 7);
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = v4;
  v17[5] = a3;
  v17[6] = a4;
  aBlock[4] = sub_10002C9C0;
  v31 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011C50;
  aBlock[3] = &unk_100046780;
  v18 = _Block_copy(aBlock);
  v19 = v31;
  swift_bridgeObjectRetain(a2);
  v20 = v5;
  swift_retain(a4);
  swift_release(v19);
  static DispatchQoS.unspecified.getter(v21);
  aBlock[0] = _swiftEmptyArrayStorage;
  v22 = sub_10000E620();
  v23 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v24 = sub_10000E668();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v23, v24, v10, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v12, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v28);
}

void sub_10002C11C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  NSString v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  Class isa;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  v6 = String._bridgeToObjectiveC()();
  v7 = v6;
  v8 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
  if (!v8)
    goto LABEL_4;
  v9 = v6;
  v10 = sub_10002B74C((uint64_t)_swiftEmptyArrayStorage);
  sub_100006CE8(&qword_10005A4F8);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  v25 = 0;
  v12 = objc_msgSend(v8, "revokeAllPresentablesWithReason:userInfo:error:", v9, isa, &v25);

  v13 = v25;
  if (v12)
  {
    v14 = v25;

LABEL_4:
    a4(0);

    return;
  }
  v15 = v25;
  v16 = _convertNSErrorToError(_:)(v13);

  swift_willThrow();
  v18 = static os_log_type_t.default.getter(v17);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v19 = qword_10005B240;
  v20 = v18;
  if (os_log_type_enabled((os_log_t)qword_10005B240, v18))
  {
    swift_errorRetain(v16);
    swift_errorRetain(v16);
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v21 = 138412290;
    swift_errorRetain(v16);
    v23 = (void *)_swift_stdlib_bridgeErrorToNSError(v16);
    v25 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
    *v22 = v23;
    swift_errorRelease(v16);
    swift_errorRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "revoke banner failed: %@", v21, 0xCu);
    v24 = sub_100006CE8(&qword_10005A4F0);
    swift_arrayDestroy(v22, 1, v24);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);
  }
  swift_errorRetain(v16);
  a4(v16);
  swift_errorRelease(v16);
  swift_errorRelease(v16);
}

id sub_10002C3C8()
{
  char *v0;
  char *v1;
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
  Swift::String v12;
  void **v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  objc_class *v25;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  void **aBlock;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  void (*v34)();
  _QWORD *v35;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v28 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for DispatchQoS(0);
  v5 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v0, "description");
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  aBlock = (void **)v9;
  v31 = v11;
  v12._countAndFlagsBits = 0x74696E69656420;
  v12._object = (void *)0xE700000000000000;
  String.append(_:)(v12);
  v13 = aBlock;
  v14 = v31;
  sub_10000E5A0();
  v15 = (void *)static OS_dispatch_queue.main.getter();
  v16 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source];
  v17 = (_QWORD *)swift_allocObject(&unk_100046808, 40, 7);
  v17[2] = v13;
  v17[3] = v14;
  v17[4] = v16;
  v34 = sub_10002CE24;
  v35 = v17;
  aBlock = _NSConcreteStackBlock;
  v31 = 1107296256;
  v32 = sub_100011C50;
  v33 = &unk_100046820;
  v18 = _Block_copy(&aBlock);
  v19 = v35;
  v20 = v16;
  swift_release(v19);
  static DispatchQoS.unspecified.getter(v21);
  aBlock = (void **)_swiftEmptyArrayStorage;
  v22 = sub_10000E620();
  v23 = sub_100006CE8((uint64_t *)&unk_100059E50);
  v24 = sub_10000E668();
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v23, v24, v2, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v4, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
  v25 = (objc_class *)type metadata accessor for BannerController();
  v29.receiver = v1;
  v29.super_class = v25;
  return objc_msgSendSuper2(&v29, "dealloc");
}

void sub_10002C610(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4;
  id v5;
  unint64_t v6;
  Class isa;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = String._bridgeToObjectiveC()();
  if (a3)
  {
    v5 = v4;
    v6 = sub_10002B74C((uint64_t)_swiftEmptyArrayStorage);
    sub_100006CE8(&qword_10005A4F8);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    v13 = 0;
    v8 = objc_msgSend(a3, "revokeAllPresentablesWithReason:userInfo:error:", v5, isa, &v13);

    v9 = v13;
    if (v8)
    {
      v10 = v13;

    }
    else
    {
      v11 = v13;
      v12 = _convertNSErrorToError(_:)(v9);

      swift_willThrow();
      swift_errorRelease(v12);
    }
  }
  else
  {

  }
}

id sub_10002C7DC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  NSString v4;
  id v5;
  objc_super v7;

  v1 = &v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate];
  *((_QWORD *)v1 + 1) = 0;
  swift_unknownObjectWeakInit(v1, 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter] = 0;
  v2 = OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source;
  v3 = v0;
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend((id)objc_opt_self(BNBannerSource), "bannerSourceForDestination:forRequesterIdentifier:", 0, v4);

  *(_QWORD *)&v0[v2] = v5;
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for BannerController();
  return objc_msgSendSuper2(&v7, "init");
}

uint64_t type metadata accessor for BannerController()
{
  return objc_opt_self(_TtC13MediaRemoteUI16BannerController);
}

uint64_t sub_10002C8FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;

  v7 = v3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate;
  result = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate, a2);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)(v7 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, ObjectType, v10);
    return swift_unknownObjectRelease(v9);
  }
  return result;
}

uint64_t sub_10002C98C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10002C9C0()
{
  uint64_t v0;

  sub_10002C11C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t))(v0 + 40));
}

double sub_10002C9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10002C9E0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002C9E8(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

unint64_t sub_10002CA08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10002CA9C(a1, v4);
}

unint64_t sub_10002CA38(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, a1, a2);
  v4 = Hasher._finalize()();
  return sub_10002CB60(a1, a2, v4);
}

unint64_t sub_10002CA9C(uint64_t a1, uint64_t a2)
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
      sub_10002D094(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000A478((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10002CB60(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10002CC40()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  if (*(_QWORD *)(v0 + 56))
    swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

void sub_10002CC84()
{
  uint64_t v0;

  sub_10002BC4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void (**)(uint64_t))(v0 + 56));
}

id sub_10002CC98(uint64_t a1, char *a2)
{
  uint64_t v4;
  id v5;
  char *v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSString v12;
  id v13;
  objc_super v15;

  v4 = OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter;
  v5 = objc_allocWithZone((Class)MRURouteTextFormatter);
  v6 = a2;
  v7 = objc_msgSend(v5, "init");
  v8 = objc_msgSend(v7, "configuration");
  objc_msgSend(v8, "setOmitGroupLeaderName:", 1);

  *(_QWORD *)&a2[v4] = v7;
  v9 = &v6[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9, 0);
  v10 = OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_source;
  v11 = v6;
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend((id)objc_opt_self(BNBannerSource), "bannerSourceForDestination:forRequesterIdentifier:", 0, v12);

  *(_QWORD *)&v6[v10] = v13;
  *((_QWORD *)v9 + 1) = &off_100046748;
  swift_unknownObjectWeakAssign(v9, a1);

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for BannerPresenter();
  return objc_msgSendSuper2(&v15, "init");
}

uint64_t sub_10002CDF8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_10002CE24()
{
  uint64_t v0;

  sub_10002C610(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

void sub_10002CE30(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = objc_opt_self(MRRouteBannerRequest);
  v6 = swift_dynamicCastObjCClass(a1, v5);
  if (v6)
  {
    v7 = (void *)v6;
    _Block_copy(a3);
    v8 = a1;
    v9 = (char *)sub_10002B9B8();
    _Block_copy(a3);
    sub_100030794(v7, v9, (void (**)(const void *, _QWORD))a3);
    _Block_release(a3);
LABEL_5:

LABEL_6:
    _Block_release(a3);
    return;
  }
  v10 = objc_opt_self(MRGroupSessionBannerRequest);
  v11 = (void *)swift_dynamicCastObjCClass(a1, v10);
  v12 = _Block_copy(a3);
  if (v11)
  {
    v8 = a1;
    v9 = (char *)sub_10002B864();
    sub_10002A49C(v11);
    goto LABEL_5;
  }
  v13 = static os_log_type_t.error.getter(v12);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  v14 = qword_10005B240;
  if (!os_log_type_enabled((os_log_t)qword_10005B240, (os_log_type_t)v13))
    goto LABEL_6;
  v15 = a1;
  v16 = (uint8_t *)swift_slowAlloc(12, -1);
  v17 = swift_slowAlloc(32, -1);
  v22 = (uint64_t)v15;
  v23 = v17;
  *(_DWORD *)v16 = 136315138;
  swift_unknownObjectRetain(v15);
  v18 = sub_100006CE8(&qword_10005A690);
  v19 = String.init<A>(describing:)(&v22, v18);
  v21 = v20;
  v22 = sub_100030094(v19, v20, &v23);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);

  swift_bridgeObjectRelease(v21);
  _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v13, "Unsupported banner configuration: %s", v16, 0xCu);
  swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v17, -1, -1);
  swift_slowDealloc(v16, -1, -1);
  _Block_release(a3);
}

uint64_t sub_10002D094(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10002D0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006CE8((uint64_t *)&unk_10005A6A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_10002D128()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  char *v12;
  void *v13;
  id v14;
  _OWORD v16[13];
  uint64_t v17;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView);
  if (v2)
  {
    v3 = *(char **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView);
  }
  else
  {
    v4 = v0;
    v5 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176);
    v16[10] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160);
    v16[11] = v5;
    v16[12] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192);
    v17 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208);
    v6 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112);
    v16[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96);
    v16[7] = v6;
    v7 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144);
    v16[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128);
    v16[9] = v7;
    v8 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48);
    v16[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32);
    v16[3] = v8;
    v9 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80);
    v16[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64);
    v16[5] = v9;
    v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16);
    v16[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute);
    v16[1] = v10;
    v11 = objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerTitleView(0));
    sub_100006D28(v16);
    v12 = sub_100004F9C((uint64_t)v16);
    v13 = *(void **)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v12;
    v3 = v12;

    v2 = 0;
  }
  v14 = v2;
  return v3;
}

id sub_10002D1F8()
{
  id v0;
  id v1;
  double v2;
  double v3;
  NSString v4;

  v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v1 = objc_msgSend((id)objc_opt_self(UIFont), "mru_suggestedRouteBannerSubtitleFont");
  objc_msgSend(v0, "setFont:", v1);

  objc_msgSend(v0, "setTextAlignment:", 1);
  LODWORD(v2) = 1148846080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v2);
  LODWORD(v3) = 1148846080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 1, v3);
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "setText:", v4);

  return v0;
}

char *sub_10002D2F4(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  double v27;
  char *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  Class isa;
  objc_super v40;
  _BYTE v41[216];
  _QWORD v42[28];

  v3 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView;
  v4 = objc_allocWithZone((Class)MRUActivityRouteView);
  v5 = v1;
  v6 = objc_msgSend(v4, "init");
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v1[v3] = v6;
  v7 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton;
  v8 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 0);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v5[v7] = v8;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView] = 0;
  v9 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView;
  *(_QWORD *)&v5[v9] = sub_10002D1F8();
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_titleLabelMaxWidth] = 0x4066400000000000;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillViewMaxWidth] = 0x4072C00000000000;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_maxActivityRouteViewSide] = 0x4049000000000000;
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_waveformIconPointSizeRatio] = 0x3FEB333333333333;
  v10 = &v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v12 = *(_OWORD *)(a1 + 176);
  v11 = *(_OWORD *)(a1 + 192);
  v13 = *(_OWORD *)(a1 + 160);
  *((_QWORD *)v10 + 26) = *(_QWORD *)(a1 + 208);
  *((_OWORD *)v10 + 11) = v12;
  *((_OWORD *)v10 + 12) = v11;
  *((_OWORD *)v10 + 10) = v13;
  v15 = *(_OWORD *)(a1 + 96);
  v14 = *(_OWORD *)(a1 + 112);
  v16 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v10 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v10 + 9) = v16;
  *((_OWORD *)v10 + 6) = v15;
  *((_OWORD *)v10 + 7) = v14;
  v18 = *(_OWORD *)(a1 + 32);
  v17 = *(_OWORD *)(a1 + 48);
  v19 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v10 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v10 + 5) = v19;
  *((_OWORD *)v10 + 2) = v18;
  *((_OWORD *)v10 + 3) = v17;
  v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v10 = *(_OWORD *)a1;
  *((_OWORD *)v10 + 1) = v20;
  v21 = objc_allocWithZone((Class)PLPillView);
  sub_100006D28((_QWORD *)a1);
  v22 = objc_msgSend(v21, "initWithLeadingAccessoryView:trailingAccessoryView:", v6, v8);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v5[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView] = v22;

  v40.receiver = v5;
  v40.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  v23 = (char *)objc_msgSendSuper2(&v40, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v24 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView;
  v25 = *(void **)&v23[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView];
  v26 = v23;
  LODWORD(v27) = 1148846080;
  objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v27);
  objc_msgSend(v25, "setMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge);
  objc_msgSend(v26, "addSubview:", v25);
  objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton], "_setTouchInsets:", -8.0, -8.0, -8.0, -8.0);
  sub_10002D6C8();
  v28 = sub_10002D128();
  v29 = objc_msgSend(objc_allocWithZone((Class)PLPillContentItem), "initWithText:style:accessoryView:", 0, 1, v28);

  v30 = objc_msgSend(objc_allocWithZone((Class)PLPillContentItem), "initWithText:style:accessoryView:", 0, 1, *(_QWORD *)&v26[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView]);
  v31 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v32 = swift_allocObject(v31, 48, 7);
  *(_OWORD *)(v32 + 16) = xmmword_100033A80;
  *(_QWORD *)(v32 + 32) = v29;
  *(_QWORD *)(v32 + 40) = v30;
  v42[0] = v32;
  specialized Array._endMutation()();
  v33 = v42[0];
  v34 = *(void **)&v23[v24];
  sub_100008314(0, (unint64_t *)&qword_100059C38, PLPillContentItem_ptr);
  v35 = v29;
  v36 = v30;
  v37 = v34;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v33);
  objc_msgSend(v37, "setCenterContentItems:animated:", isa, 0);

  objc_msgSend(*(id *)&v23[v24], "setReferenceContentItemForIntrinsicContentSize:", v35);
  sub_100006E10((uint64_t)v42);
  sub_100006E38((uint64_t)v42, (uint64_t)v41);
  sub_10002DB0C((uint64_t)v41);
  sub_100006E80((_QWORD *)a1);

  return v26;
}

void sub_10002D6C8()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  Class isa;

  v1 = (void *)objc_opt_self(NSLayoutConstraint);
  v2 = sub_100006CE8((uint64_t *)&unk_100058CB0);
  v3 = swift_allocObject(v2, 56, 7);
  *(_OWORD *)(v3 + 16) = xmmword_1000347A0;
  v4 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView];
  v5 = objc_msgSend(v4, "topAnchor");
  v6 = objc_msgSend(v0, "topAnchor");
  v7 = objc_msgSend(v5, "constraintEqualToAnchor:", v6);

  *(_QWORD *)(v3 + 32) = v7;
  v8 = objc_msgSend(v4, "centerXAnchor");
  v9 = objc_msgSend(v0, "centerXAnchor");
  v10 = objc_msgSend(v8, "constraintEqualToAnchor:", v9);

  *(_QWORD *)(v3 + 40) = v10;
  v11 = objc_msgSend(v4, "widthAnchor");
  v12 = objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", *(double *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillViewMaxWidth]);

  *(_QWORD *)(v3 + 48) = v12;
  specialized Array._endMutation()();
  sub_100008314(0, (unint64_t *)&qword_100059040, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "activateConstraints:", isa);

}

id sub_10002D8A8()
{
  char *v0;
  double v1;
  double v2;
  void *v3;
  objc_super v5;
  CGRect v6;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  objc_msgSendSuper2(&v5, "layoutSubviews");
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView], "bounds");
  v1 = *(double *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_maxActivityRouteViewSide];
  v2 = ceil(CGRectGetHeight(v6) / 1.41421356);
  if (v2 >= v1)
    v2 = v1;
  v3 = *(void **)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView];
  objc_msgSend(v3, "setSide:", v2);
  return objc_msgSend(v3, "setSideConstraintActive:", 1);
}

void sub_10002DB0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  void *v57;
  uint64_t v58;
  NSString v59;
  void *v60;
  int v61;
  void *v62;
  char **v63;
  id v64;
  void *v65;
  uint64_t v66;
  NSString v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  _OWORD v72[3];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  _BYTE v84[216];
  _OWORD v85[13];
  uint64_t v86;
  _OWORD v87[13];
  uint64_t v88;
  _OWORD v89[13];
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  _OWORD v105[13];
  uint64_t v106;

  v2 = v1;
  v4 = sub_10002D128();
  v5 = v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute;
  v6 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 80);
  v89[4] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64);
  v89[5] = v6;
  v7 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48);
  v89[2] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32);
  v89[3] = v7;
  v8 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 144);
  v89[8] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128);
  v89[9] = v8;
  v9 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 112);
  v89[6] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96);
  v89[7] = v9;
  v90 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 208);
  v89[12] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 192);
  v10 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 160);
  v89[11] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 176);
  v89[10] = v10;
  v11 = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16);
  v89[0] = *(_OWORD *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute);
  v89[1] = v11;
  v12 = &v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v13 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 16];
  v87[0] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v87[1] = v13;
  v14 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 80];
  v16 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  v15 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 48];
  v87[4] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 64];
  v87[5] = v14;
  v87[2] = v16;
  v87[3] = v15;
  v17 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 144];
  v19 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 96];
  v18 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 112];
  v87[8] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 128];
  v87[9] = v17;
  v87[6] = v19;
  v87[7] = v18;
  v21 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 176];
  v20 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 192];
  v22 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 160];
  v88 = *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 208];
  v87[11] = v21;
  v87[12] = v20;
  v87[10] = v22;
  v23 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 176];
  v24 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 192];
  v25 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 144];
  v101 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 160];
  v102 = v23;
  v103 = v24;
  v104 = *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 208];
  v26 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 112];
  v27 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 128];
  v28 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 80];
  v97 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 96];
  v98 = v26;
  v99 = v27;
  v100 = v25;
  v29 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 48];
  v30 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 64];
  v31 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 16];
  v93 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  v94 = v29;
  v95 = v30;
  v96 = v28;
  v32 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 16];
  v91 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v92 = v32;
  v105[1] = v31;
  v105[0] = v91;
  v33 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 32];
  v34 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 48];
  v35 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 64];
  v105[5] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 80];
  v105[4] = v35;
  v105[3] = v34;
  v105[2] = v33;
  v36 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 96];
  v37 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 112];
  v38 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 128];
  v105[9] = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 144];
  v105[8] = v38;
  v105[7] = v37;
  v105[6] = v36;
  v39 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 160];
  v40 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 176];
  v41 = *(_OWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 192];
  v106 = *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute + 208];
  v105[12] = v41;
  v105[11] = v40;
  v105[10] = v39;
  memmove(&v4[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute], (const void *)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute), 0xD8uLL);
  sub_100006D28(v89);
  sub_100006D28(v89);
  sub_100006D28(v87);
  sub_100006E80(v105);
  v42 = *((_OWORD *)v12 + 1);
  v85[0] = *(_OWORD *)v12;
  v85[1] = v42;
  v43 = *((_OWORD *)v12 + 5);
  v45 = *((_OWORD *)v12 + 2);
  v44 = *((_OWORD *)v12 + 3);
  v85[4] = *((_OWORD *)v12 + 4);
  v85[5] = v43;
  v85[2] = v45;
  v85[3] = v44;
  v46 = *((_OWORD *)v12 + 9);
  v48 = *((_OWORD *)v12 + 6);
  v47 = *((_OWORD *)v12 + 7);
  v85[8] = *((_OWORD *)v12 + 8);
  v85[9] = v46;
  v85[6] = v48;
  v85[7] = v47;
  v50 = *((_OWORD *)v12 + 11);
  v49 = *((_OWORD *)v12 + 12);
  v51 = *((_OWORD *)v12 + 10);
  v86 = *((_QWORD *)v12 + 26);
  v85[11] = v50;
  v85[12] = v49;
  v85[10] = v51;
  sub_100006D28(v85);
  LOBYTE(v12) = sub_1000197E8((uint64_t *)v85, (uint64_t)v87);
  sub_100006E80(v85);
  if ((v12 & 1) == 0)
  {
    v80 = v101;
    v81 = v102;
    v82 = v103;
    v83 = v104;
    v76 = v97;
    v77 = v98;
    v78 = v99;
    v79 = v100;
    v72[2] = v93;
    v73 = v94;
    v74 = v95;
    v75 = v96;
    v72[0] = v91;
    v72[1] = v92;
    nullsub_2(v72);
    sub_100006E38((uint64_t)v72, (uint64_t)v84);
    sub_1000059D8((uint64_t)v84);
  }
  sub_100006E80(v89);
  sub_100006E80(v87);

  v53 = *(_QWORD *)(v5 + 56);
  v52 = *(_QWORD *)(v5 + 64);
  sub_100006E38(a1, (uint64_t)v72);
  if (sub_100006F6C((uint64_t)v72) == 1)
  {
    if (!v52)
      goto LABEL_18;
    goto LABEL_14;
  }
  v55 = *((_QWORD *)&v73 + 1);
  v54 = v74;
  swift_bridgeObjectRetain(v74);
  if (!v52)
  {
    if (!v54)
      goto LABEL_18;
    swift_bridgeObjectRelease(v54);
    goto LABEL_14;
  }
  if (!v54)
    goto LABEL_14;
  if (v53 == v55 && v52 == v54)
  {
    swift_bridgeObjectRelease(v54);
    goto LABEL_18;
  }
  v56 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v52, v55, v54, 0);
  swift_bridgeObjectRelease(v54);
  if ((v56 & 1) == 0)
  {
LABEL_14:
    v57 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView);
    v58 = *(_QWORD *)(v5 + 64);
    if (v58)
    {
      swift_bridgeObjectRetain(*(_QWORD *)(v5 + 64));
      v59 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v58);
    }
    else
    {
      v59 = 0;
    }
    objc_msgSend(v57, "setText:", v59);

  }
LABEL_18:
  v60 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView);
  v61 = *(unsigned __int8 *)(v5 + 184);
  v62 = (void *)objc_opt_self(UIColor);
  v63 = &selRef_secondaryLabelColor;
  if (!v61)
    v63 = &selRef_systemBlueColor;
  v64 = objc_msgSend(v62, *v63);
  objc_msgSend(v60, "setTextColor:", v64);

  v65 = *(void **)(v2 + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton);
  v66 = *(_QWORD *)(v5 + 88);
  swift_bridgeObjectRetain(v66);
  v67 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v66);
  v68 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v67);

  if (v68)
  {
    v69 = objc_msgSend(v68, "imageWithSymbolConfiguration:", *(_QWORD *)(v5 + 96));

  }
  else
  {
    v69 = 0;
  }
  objc_msgSend(v65, "setImage:forState:", v69, 0);

  v70 = objc_msgSend(v65, "imageView");
  if (v70)
  {
    v71 = v70;
    objc_msgSend(v70, "setContentMode:", 1);

  }
}

void sub_10002DFE0()
{
  void *v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  char **v6;
  id v7;

  v1 = sub_10002D128();
  v2 = objc_msgSend(v0, "traitCollection");
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  v4 = *(void **)&v1[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView];
  v5 = (void *)objc_opt_self(UIColor);
  v6 = &selRef_blackColor;
  if (v3 != (id)1)
    v6 = &selRef_whiteColor;
  v7 = objc_msgSend(v5, *v6);
  objc_msgSend(v4, "setTintColor:", v7);

}

id sub_10002E128()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SuggestedRouteBannerView()
{
  return objc_opt_self(_TtC13MediaRemoteUI24SuggestedRouteBannerView);
}

void sub_10002E240()
{
  char *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView;
  v2 = objc_msgSend(objc_allocWithZone((Class)MRUActivityRouteView), "init");
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v1] = v2;
  v3 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton;
  v4 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  *(_QWORD *)&v0[v3] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView] = 0;
  v5 = OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView;
  *(_QWORD *)&v0[v5] = sub_10002D1F8();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_titleLabelMaxWidth] = 0x4066400000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillViewMaxWidth] = 0x4072C00000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_maxActivityRouteViewSide] = 0x4049000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_waveformIconPointSizeRatio] = 0x3FEB333333333333;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteBannerView.swift", 44, 2, 127, 0);
  __break(1u);
}

id sub_10002E570()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackdropSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BackdropSceneDelegate()
{
  return objc_opt_self(_TtC13MediaRemoteUI21BackdropSceneDelegate);
}

uint64_t sub_10002E5D0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100034818);
  v5 = swift_getKeyPath(&unk_100034840);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10002E64C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100034818);
  v5 = swift_getKeyPath(&unk_100034840);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

void sub_10002E6BC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  id v12;
  objc_class *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  objc_super v25;
  char v26;

  v3 = objc_opt_self(UIWindowScene);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (v4)
  {
    v5 = v4;
    v6 = a1;
    v7 = static os_log_type_t.default.getter(v6);
    if (qword_1000589C0 != -1)
      swift_once(&qword_1000589C0, sub_10001E320);
    os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, qword_10005B240, "BackdropScene will connect", 26, 2, _swiftEmptyArrayStorage);
    if (qword_1000589B0 != -1)
      swift_once(&qword_1000589B0, sub_100014740);
    v8 = qword_10005B1A0;
    KeyPath = swift_getKeyPath(&unk_100034818);
    v10 = swift_getKeyPath(&unk_100034840);
    v26 = 1;
    swift_retain(v8);
    static Published.subscript.setter(&v26, v8, KeyPath, v10);
    v11 = type metadata accessor for BackdropViewController();
    v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v11)), "init");
    v13 = (objc_class *)type metadata accessor for CoverSheetBackgroundViewController();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_topGap];
    *(_QWORD *)v15 = 0;
    v15[8] = 1;
    v16 = &v14[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_widgetsTopGap];
    *(_QWORD *)v16 = 0;
    v16[8] = 1;
    v17 = &v14[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_bottomGap];
    *(_QWORD *)v17 = 0;
    v17[8] = 1;
    v18 = &v14[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_ambientLifecycleCancellable];
    *(_OWORD *)v18 = 0u;
    *((_OWORD *)v18 + 1) = 0u;
    *((_QWORD *)v18 + 4) = 0;
    *(_QWORD *)&v14[OBJC_IVAR____TtC13MediaRemoteUI34CoverSheetBackgroundViewController_backdropViewController] = v12;
    v25.receiver = v14;
    v25.super_class = v13;
    v19 = objc_msgSendSuper2(&v25, "initWithNibName:bundle:", 0, 0);
    v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v5);
    objc_msgSend(v20, "setRootViewController:", v19);
    objc_msgSend(v20, "makeKeyWindow");
    v21 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window) = v20;
    v22 = v20;

    if (qword_1000589E0 != -1)
      swift_once(&qword_1000589E0, sub_100026454);
    v23 = *(void **)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
    *(_QWORD *)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer) = v19;
    v24 = v19;

    sub_1000266C0();
  }
}

uint64_t sub_10002E96C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  if (qword_1000589E0 != -1)
    swift_once(&qword_1000589E0, sub_100026454);
  v1 = *(void **)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
  *(_QWORD *)(qword_10005B288 + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer) = 0;

  sub_1000266C0();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window) = 0;

  if (qword_1000589B0 != -1)
    swift_once(&qword_1000589B0, sub_100014740);
  v3 = qword_10005B1A0;
  KeyPath = swift_getKeyPath(&unk_100034818);
  v5 = swift_getKeyPath(&unk_100034840);
  v9 = 0;
  swift_retain(v3);
  v6 = static Published.subscript.setter(&v9, v3, KeyPath, v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  return os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, qword_10005B240, "BackdropScene did disconnect", 28, 2, _swiftEmptyArrayStorage);
}

void sub_10002EAC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = static os_log_type_t.default.getter(a1);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, qword_10005B240, "BackdropScene will enter foreground", 35, 2, _swiftEmptyArrayStorage);
  v3 = OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  if (v4)
  {
    objc_msgSend(v4, "setHidden:", 0);
    v5 = *(void **)(v1 + v3);
    if (v5)
    {
      v6 = objc_msgSend(v5, "rootViewController");
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 0);

      }
    }
  }
  v8 = objc_msgSend(*(id *)(v1 + v3), "rootViewController");
  objc_msgSend(v8, "endAppearanceTransition");

}

void sub_10002EBD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = static os_log_type_t.default.getter(a1);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, qword_10005B240, "BackdropScene did enter background", 34, 2, _swiftEmptyArrayStorage);
  v3 = OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC13MediaRemoteUI21BackdropSceneDelegate_window);
  if (v4)
  {
    v5 = objc_msgSend(v4, "rootViewController");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "beginAppearanceTransition:animated:", 0, 0);

    }
  }
  v7 = objc_msgSend(*(id *)(v1 + v3), "rootViewController");
  objc_msgSend(v7, "endAppearanceTransition");

}

id sub_10002ECD0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MainServer()), "init");
  qword_10005B290 = (uint64_t)result;
  return result;
}

id sub_10002EDB4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MainServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MainServer()
{
  return objc_opt_self(_TtC13MediaRemoteUI10MainServer);
}

uint64_t sub_10002EE14()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001E0F0(v0, qword_10005A790);
  sub_1000163A0(v0, (uint64_t)qword_10005A790);
  if (qword_1000589C8 != -1)
    swift_once(&qword_1000589C8, sub_10001E370);
  return Logger.init(_:)((id)qword_10005B248);
}

void sub_10002EE94(uint64_t a1, _QWORD *a2, void *a3, void (*a4)(_QWORD))
{
  char *v6;

  v6 = sub_10002EF00(a2, a3);
  swift_getObjectType(v6);
  sub_100029ABC(v6, 1, a1);
  a4(0);

}

char *sub_10002EF00(_QWORD *a1, void *a2)
{
  char *v2;
  id v5;
  char *v6;
  void *v8;
  id v9;
  char *v10;
  void *v11;
  id v12;
  char *v13;

  if (SBUIIsSystemApertureEnabled(a1))
  {
    if (objc_msgSend(a2, "bannerType") == (id)2 || objc_msgSend(a2, "bannerType") == (id)3)
    {
      objc_allocWithZone((Class)type metadata accessor for SuggestedRouteConnectedViewController());
      sub_100006D28(a1);
      v5 = a2;
      v6 = v2;
      return sub_10002045C((uint64_t)a1, v5, (uint64_t)v2, (uint64_t)&off_100046648);
    }
    else
    {
      v11 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter];
      objc_allocWithZone((Class)type metadata accessor for SuggestedRouteSystemApertureViewController(0));
      sub_100006D28(a1);
      v12 = a2;
      v13 = v2;
      return sub_10001CA78(a1, v12, v11, (uint64_t)v2, &off_100046648);
    }
  }
  else
  {
    v8 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter];
    objc_allocWithZone((Class)type metadata accessor for SuggestedRouteBannerViewController(0));
    sub_100006D28(a1);
    v9 = a2;
    v10 = v2;
    return sub_100011C7C(a1, v9, v8, (uint64_t)v2, (uint64_t)&off_100046648);
  }
}

uint64_t sub_10002F054@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BOOL4 v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject **v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  NSObject **v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  BOOL v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  NSString v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject **v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  NSObject *v92;
  uint64_t v94;
  _QWORD v95[13];
  char v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  NSObject *v107;
  _BYTE v108[208];

  v4 = objc_msgSend(a1, "bannerType") == (id)1;
  v5 = objc_msgSend(a1, "bannerType") == (id)4;
  if (v5)
    v6 = 1;
  else
    v6 = v4;
  v90 = sub_10002F9C4(v5, a1, v2, v4);
  v8 = v7;
  v91 = v6;
  v92 = sub_10002FC08(v6);
  if (qword_1000589F8 != -1)
    swift_once(&qword_1000589F8, sub_10002EE14);
  v9 = type metadata accessor for Logger(0);
  sub_1000163A0(v9, (uint64_t)qword_10005A790);
  v10 = a1;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter(v11);
  if (os_log_type_enabled(v11, v12))
  {
    v88 = v8;
    v13 = swift_slowAlloc(22, -1);
    v14 = (NSObject **)swift_slowAlloc(16, -1);
    *(_DWORD *)v13 = 138412546;
    v107 = v10;
    v15 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108);
    *v14 = v10;

    *(_WORD *)(v13 + 12) = 2112;
    v16 = -[NSObject staticRequest](v15, "staticRequest");
    v17 = v16;
    if (v16)
      v107 = v16;
    else
      v107 = 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108);
    v14[1] = v17;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MRDRRC] configuration: %@ static request: %@", (uint8_t *)v13, 0x16u);
    v18 = sub_100006CE8(&qword_10005A4F0);
    swift_arrayDestroy(v14, 2, v18);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    v8 = v88;
  }
  else
  {

  }
  v19 = -[NSObject staticRequest](v10, "staticRequest");
  if (v19)
  {
    v20 = v19;
    v21 = -[NSObject bannerType](v10, "bannerType");
    switch((unint64_t)v21)
    {
      case 1uLL:
        v33 = SBUIIsSystemApertureEnabled(v21);
        v34 = v33 == 0;
        if (v33)
          v30 = 0xD000000000000014;
        else
          v30 = 0xD000000000000020;
        v35 = 0x800000010003C4D0;
        v36 = 0x800000010003C500;
        goto LABEL_27;
      case 4uLL:
        v37 = SBUIIsSystemApertureEnabled(v21);
        v34 = v37 == 0;
        if (v37)
          v30 = 1937075312;
        else
          v30 = 0xD000000000000010;
        v35 = 0x800000010003C520;
        v36 = 0xE400000000000000;
LABEL_27:
        if (v34)
          v32 = v35;
        else
          v32 = v36;
        break;
      default:
        v29 = objc_msgSend(v20, "actionImageName");
        v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
        v32 = v31;

        break;
    }
    v38 = v10;
    swift_bridgeObjectRetain_n(v32, 2);
    v39 = v38;
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.default.getter(v40);
    v87 = v32;
    v89 = v30;
    if (os_log_type_enabled(v40, v41))
    {
      v42 = swift_slowAlloc(22, -1);
      v83 = (NSObject **)swift_slowAlloc(8, -1);
      v85 = swift_slowAlloc(32, -1);
      v107 = v85;
      *(_DWORD *)v42 = 136315394;
      swift_bridgeObjectRetain(v32);
      v94 = sub_100030094(v30, v32, (uint64_t *)&v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, v95);
      swift_bridgeObjectRelease_n(v32, 3);
      *(_WORD *)(v42 + 12) = 2112;
      v94 = (uint64_t)v39;
      v43 = v20;
      v44 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, v95);
      *v83 = v39;

      v20 = v43;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "[MRDRRC] actionImageName: %s config: %@", (uint8_t *)v42, 0x16u);
      v45 = sub_100006CE8(&qword_10005A4F0);
      swift_arrayDestroy(v83, 1, v45);
      swift_slowDealloc(v83, -1, -1);
      swift_arrayDestroy(v85, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v85, -1, -1);
      swift_slowDealloc(v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v32, 2);
    }
    v46 = -[NSObject requestIdentifier](v39, "requestIdentifier");
    v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
    v84 = v48;
    v86 = v47;

    v49 = -[NSObject routeIdentifier](v39, "routeIdentifier");
    v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
    v81 = v51;
    v82 = v50;

    v52 = objc_msgSend(v20, "routeName");
    v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
    v80 = v54;

    v55 = objc_msgSend(v20, "outputDeviceNames");
    v56 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v55, &type metadata for String);

    v57 = objc_msgSend(v20, "routeSymbolName");
    static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
    v59 = v58;

    v60 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v59);
    v61 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v60);

    if (v61)
    {
      v62 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
      v63 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithHierarchicalColor:", v62);

      v64 = objc_msgSend(v61, "imageByApplyingSymbolConfiguration:", v63);
    }
    else
    {
      v64 = 0;
    }
    v65 = objc_msgSend(v20, "soloModelID");
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
    v70 = objc_msgSend(v20, "soloDeviceEnclosureColor");
    if (v70)
    {
      v71 = v70;
      v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v70);
      v74 = v73;

    }
    else
    {
      v72 = 0;
      v74 = 0;
    }
    v75 = objc_msgSend(v20, "userSelectedDeviceNames");
    v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v75, &type metadata for String);
    v77 = v20;
    v78 = v76;

    v94 = v86;
    v95[0] = v84;
    v95[1] = v82;
    v95[2] = v81;
    v95[3] = v53;
    v95[4] = v80;
    v95[5] = v56;
    v95[6] = v90;
    v95[7] = v8;
    v95[8] = v64;
    v95[9] = v89;
    v95[10] = v87;
    v95[11] = v92;
    v95[12] = 0;
    v96 = 0;
    v97 = 0u;
    v98 = 0u;
    v99 = v67;
    v100 = v69;
    v101 = v72;
    v102 = v74;
    v103 = v91;
    v104 = 0;
    v105 = 0xE000000000000000;
    v106 = v78;
    nullsub_2(&v94);
  }
  else
  {
    swift_bridgeObjectRelease(v8);
    v22 = v10;
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v25 = 138412290;
      v107 = v22;
      v27 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108);
      *v26 = v22;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[MRDRRC] configuration: %@ has static type but no static request", v25, 0xCu);
      v28 = sub_100006CE8(&qword_10005A4F0);
      swift_arrayDestroy(v26, 1, v28);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);
      v22 = v92;
    }
    else
    {

      v23 = v22;
    }

    sub_100006E10((uint64_t)&v94);
  }
  sub_100006E38((uint64_t)&v94, (uint64_t)&v107);
  return sub_100006E38((uint64_t)&v107, a2);
}

uint64_t sub_10002F9C4(char a1, id a2, uint64_t a3, char a4)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  Class isa;
  NSString v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;

  if ((a1 & 1) == 0)
  {
    v16 = (void *)objc_opt_self(MRUStringsProvider);
    if ((a4 & 1) != 0)
      v17 = objc_msgSend(v16, "routeRecommendationAirPlayConnected");
    else
      v17 = objc_msgSend(v16, "routeRecommendationTapToAirPlay");
LABEL_14:
    v14 = v17;
    goto LABEL_15;
  }
  v5 = objc_msgSend(a2, "staticRequest");
  if (!v5)
  {
    if (qword_1000589F8 != -1)
      swift_once(&qword_1000589F8, sub_10002EE14);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_1000163A0(v18, (uint64_t)qword_10005A790);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Attempted to create delta banner without providing existing device names. Fallback to TapToAirPlay string", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    v17 = objc_msgSend((id)objc_opt_self(MRUStringsProvider), "routeRecommendationTapToAirPlay");
    goto LABEL_14;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "userSelectedDeviceNames");

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String);
  v9 = *(void **)(a3 + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerPresenter_routeTextFormatter);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  v11 = objc_msgSend(v9, "textForRouteNames:", isa);

  if (!v11)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v13 = v12;
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v13);
  }
  v14 = objc_msgSend((id)objc_opt_self(MRUStringsProvider), "routeRecommendationAddWithFormattedExistingRouteName:", v11);

LABEL_15:
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);

  return v23;
}

id sub_10002FC08(uint64_t a1)
{
  int v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  Class isa;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  if ((a1 & 1) != 0)
  {
    v1 = SBUIIsSystemApertureEnabled(a1);
    v2 = (void *)objc_opt_self(UIImageSymbolConfiguration);
    v3 = objc_msgSend(v2, "configurationWithTextStyle:scale:", UIFontTextStyleTitle1, 1);
    v4 = objc_msgSend(v2, "configurationWithWeight:", 5);
    v5 = objc_msgSend(v3, "configurationByApplyingConfiguration:", v4);

    if (v1)
    {
      isa = (Class)objc_msgSend((id)objc_opt_self(UIColor), "systemCyanColor");
      v7 = objc_msgSend(v2, "configurationWithHierarchicalColor:", isa);
    }
    else
    {
      v14 = sub_100006CE8((uint64_t *)&unk_100058CB0);
      v15 = swift_allocObject(v14, 48, 7);
      *(_OWORD *)(v15 + 16) = xmmword_100033A80;
      v16 = (void *)objc_opt_self(UIColor);
      *(_QWORD *)(v15 + 32) = objc_msgSend(v16, "systemWhiteColor");
      *(_QWORD *)(v15 + 40) = objc_msgSend(v16, "systemBlueColor");
      specialized Array._endMutation()();
      sub_100008314(0, &qword_10005A7E0, UIColor_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v15);
      v7 = objc_msgSend(v2, "configurationWithPaletteColors:", isa);
    }
    v12 = v7;

    v13 = objc_msgSend(v5, "configurationByApplyingConfiguration:", v12);
  }
  else
  {
    v8 = (void *)objc_opt_self(UIImageSymbolConfiguration);
    v9 = objc_msgSend(v8, "configurationWithTextStyle:scale:", UIFontTextStyleTitle1, 1);
    v10 = objc_msgSend(v8, "configurationWithWeight:", 5);
    v5 = objc_msgSend(v9, "configurationByApplyingConfiguration:", v10);

    v11 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
    v12 = objc_msgSend(v8, "configurationWithHierarchicalColor:", v11);

    v13 = objc_msgSend(v5, "configurationByApplyingConfiguration:", v12);
  }
  v17 = v13;

  return v17;
}

uint64_t sub_10002FED4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate, a2);
  if (result)
  {
    v6 = result;
    v7 = type metadata accessor for BannerController();
    swift_dynamicCastClassUnconditional(v6, v7, 0, 0, 0);
    sub_10002BA38(a1, a2, 0x756F2064656D6974, 0xE900000000000074, 0, 0);
    return swift_unknownObjectRelease(v6);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10002FF70()
{
  uint64_t v0;

}

id sub_10002FF80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestedRouteBannerPresenter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SuggestedRouteBannerPresenter()
{
  return objc_opt_self(_TtC13MediaRemoteUI29SuggestedRouteBannerPresenter);
}

uint64_t sub_10002FFE0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10002FFF0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100030024(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
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
  v9 = sub_100030094(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100030094(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100030164(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000A4F0((uint64_t)v12, *a3);
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
      sub_10000A4F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000134AC(v12);
  return v7;
}

uint64_t sub_100030164(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10003031C(a5, a6);
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

uint64_t sub_10003031C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000303B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100030588(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100030588(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000303B0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100030524(v4, 0);
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

_QWORD *sub_100030524(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006CE8(&qword_10005A7D8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100030588(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006CE8(&qword_10005A7D8);
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

_BYTE **sub_1000306D4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_1000306E4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
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

double sub_100030794(void *a1, char *a2, void (**a3)(const void *, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t Strong;
  uint64_t v66;
  uint64_t v67;
  uint64_t ObjectType;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double result;
  _QWORD v74[2];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (**v83)(const void *, _QWORD);
  char *v84;
  _QWORD *v85;
  _QWORD v86[4];
  uint64_t v87;
  _QWORD v88[27];
  _OWORD v89[13];
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;

  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v82 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v80 = *(_QWORD *)(v9 - 8);
  v81 = v9;
  __chkstk_darwin(v9);
  v79 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject(&unk_100046860, 24, 7);
  *(_QWORD *)(v11 + 16) = a3;
  v83 = a3;
  _Block_copy(a3);
  if (qword_1000589F8 != -1)
    swift_once(&qword_1000589F8, sub_10002EE14);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_1000163A0(v12, (uint64_t)qword_10005A790);
  v14 = a1;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter(v15);
  if (os_log_type_enabled(v15, v16))
  {
    v76 = v13;
    v17 = swift_slowAlloc(12, -1);
    v77 = v6;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc(32, -1);
    v84 = a2;
    v75 = v19;
    *(_QWORD *)&v91 = v19;
    v78 = v11;
    *(_DWORD *)v18 = 136315138;
    v74[1] = v18 + 4;
    v20 = v8;
    v21 = objc_msgSend(v14, "requestIdentifier");
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v24 = v23;

    v8 = v20;
    *(_QWORD *)&v89[0] = sub_100030094(v22, v24, (uint64_t *)&v91);
    v11 = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v89, (char *)v89 + 8);

    swift_bridgeObjectRelease(v24);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MRDRRC] got request %s - will not try to resolve (not required)", v18, 0xCu);
    v25 = v75;
    swift_arrayDestroy(v75, 1, (char *)&type metadata for Any + 8);
    a2 = v84;
    swift_slowDealloc(v25, -1, -1);
    v26 = v18;
    v6 = v77;
    swift_slowDealloc(v26, -1, -1);

  }
  else
  {

  }
  sub_10002F054(v14, (uint64_t)v88);
  sub_100006E38((uint64_t)v88, (uint64_t)v89);
  if (sub_100006F6C((uint64_t)v89) == 1)
  {
    v27 = v14;
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.default.getter(v28);
    v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      v31 = swift_slowAlloc(22, -1);
      LODWORD(v81) = v30;
      v32 = v31;
      v82 = swift_slowAlloc(64, -1);
      *(_QWORD *)&v91 = v82;
      *(_DWORD *)v32 = 136315394;
      v33 = objc_msgSend(v27, "routeIdentifier");
      v84 = a2;
      v34 = v33;
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
      v37 = v36;

      v85 = (_QWORD *)sub_100030094(v35, v37, (uint64_t *)&v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, v86);

      swift_bridgeObjectRelease(v37);
      *(_WORD *)(v32 + 12) = 2080;
      v38 = objc_msgSend(v27, "requestIdentifier");
      v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
      v40 = v11;
      v42 = v41;

      v85 = (_QWORD *)sub_100030094(v39, v42, (uint64_t *)&v91);
      a2 = v84;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, v86);

      v43 = v42;
      v11 = v40;
      swift_bridgeObjectRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v81, "[MRDRRC] couldn't generate suggested route %s for %s - will say it's invalidated", (uint8_t *)v32, 0x16u);
      v44 = v82;
      swift_arrayDestroy(v82, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v32, -1, -1);

    }
    else
    {

    }
    v64 = &a2[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate];
    Strong = swift_unknownObjectWeakLoadStrong(&a2[OBJC_IVAR____TtC13MediaRemoteUI15BannerPresenter_delegate], v45);
    if (Strong)
    {
      v66 = Strong;
      v67 = *((_QWORD *)v64 + 1);
      ObjectType = swift_getObjectType(Strong);
      v69 = objc_msgSend(v27, "requestIdentifier");
      v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
      v72 = v71;

      (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v67 + 8))(v70, v72, 0, ObjectType, v67);
      swift_bridgeObjectRelease(v72);
      swift_unknownObjectRelease(v66);
    }
    v83[2](v83, 0);
  }
  else
  {
    v101 = v89[10];
    v102 = v89[11];
    v103 = v89[12];
    v104 = v90;
    v97 = v89[6];
    v98 = v89[7];
    v99 = v89[8];
    v100 = v89[9];
    v93 = v89[2];
    v94 = v89[3];
    v95 = v89[4];
    v96 = v89[5];
    v91 = v89[0];
    v92 = v89[1];
    sub_100008314(0, (unint64_t *)&qword_100059EC0, OS_dispatch_queue_ptr);
    v46 = (void *)static OS_dispatch_queue.main.getter();
    v47 = swift_allocObject(&unk_100046888, 264, 7);
    v48 = v102;
    *(_OWORD *)(v47 + 184) = v101;
    *(_OWORD *)(v47 + 200) = v48;
    *(_OWORD *)(v47 + 216) = v103;
    v49 = v98;
    *(_OWORD *)(v47 + 120) = v97;
    *(_OWORD *)(v47 + 136) = v49;
    v50 = v100;
    *(_OWORD *)(v47 + 152) = v99;
    *(_OWORD *)(v47 + 168) = v50;
    v51 = v94;
    *(_OWORD *)(v47 + 56) = v93;
    *(_OWORD *)(v47 + 72) = v51;
    v52 = v96;
    *(_OWORD *)(v47 + 88) = v95;
    *(_OWORD *)(v47 + 104) = v52;
    v53 = v92;
    *(_OWORD *)(v47 + 24) = v91;
    *(_QWORD *)(v47 + 16) = a2;
    v54 = v104;
    *(_OWORD *)(v47 + 40) = v53;
    *(_QWORD *)(v47 + 232) = v54;
    *(_QWORD *)(v47 + 240) = v14;
    *(_QWORD *)(v47 + 248) = sub_10001C804;
    *(_QWORD *)(v47 + 256) = v11;
    v86[3] = sub_100030FA8;
    v87 = v47;
    v85 = _NSConcreteStackBlock;
    v86[0] = 1107296256;
    v86[1] = sub_100011C50;
    v86[2] = &unk_1000468A0;
    v55 = _Block_copy(&v85);
    v56 = v87;
    v57 = v14;
    v58 = a2;
    sub_1000310C0(v88, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100030FD4);
    swift_retain(v11);
    swift_release(v56);
    v59 = v79;
    static DispatchQoS.unspecified.getter(v60);
    v85 = _swiftEmptyArrayStorage;
    v61 = sub_10000E620();
    v62 = sub_100006CE8((uint64_t *)&unk_100059E50);
    v63 = sub_10000E668();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v85, v62, v63, v6, v61);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v59, v8, v55);
    _Block_release(v55);

    sub_1000310C0(v88, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100031134);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v8, v6);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v59, v81);
  }
  *(_QWORD *)&result = swift_release(v11).n128_u64[0];
  return result;
}

uint64_t sub_100030ED8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030EFC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 152));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 168));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 184));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 200));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 224));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 232));

  swift_release(*(_QWORD *)(v0 + 256));
  return swift_deallocObject(v0, 264, 7);
}

void sub_100030FA8()
{
  uint64_t v0;

  sub_10002EE94(*(_QWORD *)(v0 + 16), (_QWORD *)(v0 + 24), *(void **)(v0 + 240), *(void (**)(_QWORD))(v0 + 248));
}

double sub_100030FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_100030FCC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100030FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  id v31;
  id v32;
  id v33;
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a27);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRetain(a6);
    swift_bridgeObjectRetain(a7);
    swift_bridgeObjectRetain(a9);
    v31 = a10;
    swift_bridgeObjectRetain(a12);
    v32 = a13;
    v33 = a14;
    swift_bridgeObjectRetain(a17);
    swift_bridgeObjectRetain(a19);
    swift_bridgeObjectRetain(a21);
    swift_bridgeObjectRetain(a23);
    return swift_bridgeObjectRetain(a26);
  }
  return result;
}

_QWORD *sub_1000310C0(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23],
    a1[24],
    a1[25],
    a1[26]);
  return a1;
}

uint64_t sub_100031134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    swift_bridgeObjectRelease(a12);

    swift_bridgeObjectRelease(a26);
    swift_bridgeObjectRelease(a7);
    swift_bridgeObjectRelease(a9);

    swift_bridgeObjectRelease(a17);
    swift_bridgeObjectRelease(a19);
    swift_bridgeObjectRelease(a21);
    swift_bridgeObjectRelease(a23);
    return swift_bridgeObjectRelease(a27);
  }
  return result;
}

uint64_t sub_100031224()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC13MediaRemoteUIP33_17C2A9C26964A89A75B9FA614C8A44EB19ResourceBundleClass);
}

void sub_100031254(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to acquire assertion: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquire");
}

id objc_msgSend_acquireBackgroundContentAssertionWithDefinition_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireBackgroundContentAssertionWithDefinition:errorHandler:");
}

id objc_msgSend_artworkView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkView");
}

id objc_msgSend_backgroundContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundContainer");
}

id objc_msgSend_backgroundContentAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundContentAssertion");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "center");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_delayAcquire(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayAcquire");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_handleBackgroundTapAt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBackgroundTapAt:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_setBackgroundContentAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundContentAssertion:");
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleTimerDisabled:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}
