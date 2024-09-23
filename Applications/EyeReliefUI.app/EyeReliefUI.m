BOOL sub_100002CFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100002D10()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002D54()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002D7C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t *sub_100002DBC@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_100002DD4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_100002DE0(char a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD aBlock[5];
  uint64_t v23;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006838(0, (unint64_t *)&qword_10001DB40, OS_dispatch_queue_ptr);
  v12 = (void *)static OS_dispatch_queue.main.getter();
  v13 = swift_allocObject(&unk_100018D98, 32, 7);
  *(_BYTE *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  aBlock[4] = sub_100006974;
  v23 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006BF8;
  aBlock[3] = &unk_100018DB0;
  v14 = _Block_copy(aBlock);
  v15 = v23;
  v16 = a2;
  swift_release(v15);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v18 = sub_100006878();
  v19 = sub_1000057A0(&qword_10001DB50);
  v20 = sub_1000068C0();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v4, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_100002FC0(char a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  uint64_t v35;

  v2 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel;
  v3 = *(_QWORD *)&a2[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel];
  if (v3)
  {
    KeyPath = swift_getKeyPath(&unk_100010FD8);
    v7 = swift_getKeyPath(&unk_100011000);
    v8 = swift_retain(v3);
    static Published.subscript.getter(v34, v8, KeyPath, v7);
    swift_release(v3);
    swift_release(KeyPath);
    *(_QWORD *)&v9 = swift_release(v7).n128_u64[0];
    if (LOBYTE(v34[0]) == 1)
    {
      v10 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer;
      v11 = *(void **)&a2[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer];
      if (a1 == 1)
      {
        v12 = *(void **)&a2[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer];
        v13 = v12;
        if (!v11)
        {
          if (qword_10001DA30 != -1)
            swift_once(&qword_10001DA30, sub_100006B3C);
          v14 = type metadata accessor for Logger(0);
          v15 = sub_100005814(v14, (uint64_t)qword_10001EA30);
          v16 = Logger.logObject.getter(v15);
          v17 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v16, v17))
          {
            v18 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "Scheduled safe distance timer", v18, 2u);
            swift_slowDealloc(v18, -1, -1);
          }

          v11 = *(void **)&a2[v10];
          v12 = v11;
          v13 = v11;
          if (!v11)
          {
            v19 = (void *)objc_opt_self(NSTimer);
            v20 = swift_allocObject(&unk_100018DE8, 24, 7);
            *(_QWORD *)(v20 + 16) = a2;
            v34[4] = sub_100006980;
            v35 = v20;
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 1107296256;
            v34[2] = sub_10000346C;
            v34[3] = &unk_100018E00;
            v21 = _Block_copy(v34);
            v22 = v35;
            v23 = a2;
            swift_release(v22);
            v13 = objc_msgSend(v19, "scheduledTimerWithTimeInterval:repeats:block:", 0, v21, 1.0);
            _Block_release(v21);
            v12 = 0;
            v11 = *(void **)&a2[v10];
          }
        }
        *(_QWORD *)&a2[v10] = v13;
        v24 = v12;

      }
      else
      {
        if (v11)
        {
          if (qword_10001DA30 != -1)
            swift_once(&qword_10001DA30, sub_100006B3C);
          v25 = type metadata accessor for Logger(0);
          v26 = sub_100005814(v25, (uint64_t)qword_10001EA30);
          v27 = Logger.logObject.getter(v26);
          v28 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v27, v28))
          {
            v29 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Cancelled safe distance timer", v29, 2u);
            swift_slowDealloc(v29, -1, -1);
          }

        }
        objc_msgSend(*(id *)&a2[v10], "invalidate", v9);
        v30 = *(void **)&a2[v10];
        *(_QWORD *)&a2[v10] = 0;

        v31 = *(_QWORD *)&a2[v2];
        if (v31)
        {
          v32 = swift_getKeyPath(&unk_100010FD8);
          v33 = swift_getKeyPath(&unk_100011000);
          LOBYTE(v34[0]) = 1;
          swift_retain(v31);
          static Published.subscript.setter(v34, v31, v32, v33);
        }
      }
    }
  }
}

double sub_100003320(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  double result;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  char v13;

  if (qword_10001DA30 != -1)
    swift_once(&qword_10001DA30, sub_100006B3C);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100005814(v3, (uint64_t)qword_10001EA30);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fired safe distance timer", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  v9 = *(_QWORD *)(a2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel);
  if (v9)
  {
    KeyPath = swift_getKeyPath(&unk_100010FD8);
    v11 = swift_getKeyPath(&unk_100011000);
    v13 = 0;
    swift_retain(v9);
    static Published.subscript.setter(&v13, v9, KeyPath, v11);
  }
  v12 = *(_QWORD *)(a2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming);
  if (v12)
  {
    swift_retain(*(_QWORD *)(a2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming));
    sub_10000FF04();
    *(_QWORD *)&result = swift_release(v12).n128_u64[0];
  }
  return result;
}

void sub_10000346C(uint64_t a1, void *a2)
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

uint64_t sub_1000034BC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD aBlock[5];
  uint64_t v21;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006838(0, (unint64_t *)&qword_10001DB40, OS_dispatch_queue_ptr);
  v10 = (void *)static OS_dispatch_queue.main.getter();
  v11 = swift_allocObject(&unk_100018D48, 24, 7);
  *(_QWORD *)(v11 + 16) = a1;
  aBlock[4] = sub_100006870;
  v21 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006BF8;
  aBlock[3] = &unk_100018D60;
  v12 = _Block_copy(aBlock);
  v13 = v21;
  v14 = a1;
  swift_release(v13);
  static DispatchQoS.unspecified.getter(v15);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v16 = sub_100006878();
  v17 = sub_1000057A0(&qword_10001DB50);
  v18 = sub_1000068C0();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v2, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100003694(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  char v10;

  if (qword_10001DA30 != -1)
    swift_once(&qword_10001DA30, sub_100006B3C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100005814(v2, (uint64_t)qword_10001EA30);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Unable to stream. Enabling continue button.", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel);
  if (v7)
  {
    KeyPath = swift_getKeyPath(&unk_100010FD8);
    v9 = swift_getKeyPath(&unk_100011000);
    v10 = 0;
    swift_retain(v7);
    static Published.subscript.setter(&v10, v7, KeyPath, v9);
  }
}

void sub_100003860()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double Height;
  double Width;
  double v53;
  void *v54;
  double v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  CGFloat *v64;
  void *v65;
  CGFloat *v66;
  char *v67;
  uint64_t v68;
  void *v69;
  CGFloat *v70;
  char *v71;
  void **aBlock;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  CGFloat *v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v1 = v0;
  v2 = type metadata accessor for ShieldIntervention(0);
  __chkstk_darwin(v2);
  v4 = (char *)&aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for InterventionViewModel(0);
  v6 = swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  LOBYTE(aBlock) = 1;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v7 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel;
  v8 = *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel];
  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel] = v6;
  v9 = objc_msgSend(v1, "view", swift_release(v8).n128_f64[0]);
  if (!v9)
  {
    __break(1u);
    goto LABEL_19;
  }
  v10 = v9;
  v11 = (void *)objc_opt_self(UIColor);
  v12 = objc_msgSend(v11, "clearColor");
  objc_msgSend(v10, "setBackgroundColor:", v12);

  v13 = *(_QWORD *)&v1[v7];
  if (!v13)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v14 = swift_allocObject(&unk_100018B40, 24, 7);
  *(_QWORD *)(v14 + 16) = v1;
  v15 = v1;
  v16 = swift_retain(v13);
  sub_100006C24(v16, (uint64_t)sub_100005798, v14, (uint64_t)v4);
  v17 = objc_allocWithZone((Class)sub_1000057A0(&qword_10001DAA8));
  v18 = UIHostingController.init(rootView:)(v4);
  v19 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention;
  v20 = *(void **)&v15[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
  *(_QWORD *)&v15[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention] = v18;

  v21 = *(void **)&v15[v19];
  if (!v21)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v22 = objc_msgSend(v21, "view");
  if (!v22)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v23 = v22;
  v24 = objc_msgSend(v11, "clearColor");
  objc_msgSend(v23, "setBackgroundColor:", v24);

  v25 = *(void **)&v15[v19];
  if (!v25)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v26 = objc_msgSend(v25, "view");
  if (!v26)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v27 = v26;
  v28 = objc_msgSend(v26, "layer");

  objc_msgSend(v28, "setMasksToBounds:", 1);
  v29 = *(void **)&v15[v19];
  if (!v29)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v30 = objc_msgSend(v29, "view");
  if (!v30)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v31 = v30;
  v32 = objc_msgSend(v30, "layer");

  v33 = (void *)objc_opt_self(UIScreen);
  v34 = objc_msgSend(v33, "mainScreen");
  v35 = objc_msgSend(v34, "traitCollection");

  objc_msgSend(v35, "displayCornerRadius");
  v37 = v36;

  objc_msgSend(v32, "setCornerRadius:", v37);
  v38 = *(void **)&v15[v19];
  if (!v38)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v39 = objc_msgSend(v38, "view");
  if (!v39)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v40 = v39;
  v41 = objc_msgSend(v39, "layer");

  objc_msgSend(v41, "setCornerCurve:", kCACornerCurveContinuous);
  v42 = objc_msgSend(v33, "mainScreen");
  objc_msgSend(v42, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;

  v78.origin.x = v44;
  v78.origin.y = v46;
  v78.size.width = v48;
  v78.size.height = v50;
  Height = CGRectGetHeight(v78);
  v79.origin.x = v44;
  v79.origin.y = v46;
  v79.size.width = v48;
  v79.size.height = v50;
  Width = CGRectGetWidth(v79);
  v80.origin.x = v44;
  v80.origin.y = v46;
  v80.size.width = v48;
  v80.size.height = v50;
  v53 = CGRectGetHeight(v80);
  v54 = *(void **)&v15[v19];
  if (!v54)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v55 = v53;
  v56 = objc_msgSend(v54, "view");
  if (!v56)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v57 = v56;
  objc_msgSend(v56, "setFrame:", 0.0, Height, Width, v55);

  if (!*(_QWORD *)&v15[v19])
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  objc_msgSend(v15, "addChildViewController:");
  v58 = objc_msgSend(v15, "view");
  if (!v58)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v59 = v58;
  v60 = *(void **)&v15[v19];
  if (!v60)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v61 = objc_msgSend(v60, "view");
  if (v61)
  {
    v62 = v61;
    objc_msgSend(v59, "addSubview:", v61);

    sub_10000464C();
    v63 = (void *)objc_opt_self(UIView);
    v64 = (CGFloat *)swift_allocObject(&unk_100018B68, 56, 7);
    *((_QWORD *)v64 + 2) = v15;
    v64[3] = v44;
    v64[4] = v46;
    v64[5] = v48;
    v64[6] = v50;
    v76 = sub_1000057E0;
    v77 = v64;
    aBlock = _NSConcreteStackBlock;
    v73 = 1107296256;
    v74 = sub_100006BF8;
    v75 = &unk_100018B80;
    v65 = _Block_copy(&aBlock);
    v66 = v77;
    v67 = v15;
    swift_release(v66);
    v68 = swift_allocObject(&unk_100018BB8, 24, 7);
    *(_QWORD *)(v68 + 16) = v67;
    v76 = sub_100005804;
    v77 = (CGFloat *)v68;
    aBlock = _NSConcreteStackBlock;
    v73 = 1107296256;
    v74 = sub_1000044B8;
    v75 = &unk_100018BD0;
    v69 = _Block_copy(&aBlock);
    v70 = v77;
    v71 = v67;
    swift_release(v70);
    objc_msgSend(v63, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v65, v69, 200.0, 35.0);
    _Block_release(v69);
    _Block_release(v65);
    return;
  }
LABEL_33:
  __break(1u);
}

void sub_100003E6C(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void **v19;
  void **v20;
  uint64_t v21;
  unint64_t v22;
  void **v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  double v31;
  double v32;
  id v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat Height;
  CGFloat Width;
  CGFloat v44;
  void *v45;
  CGFloat *v46;
  void *v47;
  CGFloat *v48;
  char *v49;
  uint64_t v50;
  void *v51;
  CGFloat *v52;
  id v53;
  char *v54;
  uint64_t v55;
  char *v56;
  void *v57;
  uint64_t v58;
  void **aBlock;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  CGFloat *v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction];
  if (v6)
  {
    v7 = *(_QWORD *)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel];
    if (v7)
    {
      KeyPath = swift_getKeyPath(&unk_100010FD8);
      v9 = swift_getKeyPath(&unk_100011000);
      v10 = v6;
      v11 = swift_retain(v7);
      static Published.subscript.getter(&aBlock, v11, KeyPath, v9);
      swift_release(v7);
      swift_release(KeyPath);
      swift_release(v9);
      v12 = aBlock;
    }
    else
    {
      v13 = v6;
      v12 = 0;
    }
    if (qword_10001DA30 != -1)
      swift_once(&qword_10001DA30, sub_100006B3C);
    v14 = sub_100005814(v2, (uint64_t)qword_10001EA30);
    v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = (void **)swift_slowAlloc(32, -1);
      v57 = v6;
      v20 = v19;
      v55 = v3;
      v56 = a1;
      *(_DWORD *)v18 = 136315138;
      aBlock = v19;
      if (v12)
        v21 = 0x656661736E75;
      else
        v21 = 1701208435;
      if (v12)
        v22 = 0xE600000000000000;
      else
        v22 = 0xE400000000000000;
      v58 = sub_1000058A8(v21, v22, (uint64_t *)&aBlock);
      a1 = v56;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &aBlock, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease(v22);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "User pressed dismiss button at %s distance. Replying back to eyereliefd", v18, 0xCu);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      v23 = v20;
      v6 = v57;
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v55 + 8))(v5, v2);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    v24 = *(void **)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
    if (v24)
    {
      v25 = objc_msgSend(v24, "view");
      if (v25)
      {
        v26 = v25;
        v27 = objc_msgSend(v25, "layer");

        v28 = (void *)objc_opt_self(UIScreen);
        v29 = objc_msgSend(v28, "mainScreen");
        v30 = objc_msgSend(v29, "traitCollection");

        objc_msgSend(v30, "displayCornerRadius");
        v32 = v31;

        objc_msgSend(v27, "setCornerRadius:", v32);
        v33 = objc_msgSend(v28, "mainScreen");
        objc_msgSend(v33, "bounds");
        v35 = v34;
        v37 = v36;
        v39 = v38;
        v41 = v40;

        v65.origin.x = v35;
        v65.origin.y = v37;
        v65.size.width = v39;
        v65.size.height = v41;
        Height = CGRectGetHeight(v65);
        v66.origin.x = v35;
        v66.origin.y = v37;
        v66.size.width = v39;
        v66.size.height = v41;
        Width = CGRectGetWidth(v66);
        v67.origin.x = v35;
        v67.origin.y = v37;
        v67.size.width = v39;
        v67.size.height = v41;
        v44 = CGRectGetHeight(v67);
        v45 = (void *)objc_opt_self(UIView);
        v46 = (CGFloat *)swift_allocObject(&unk_100018C08, 56, 7);
        *((_QWORD *)v46 + 2) = a1;
        v46[3] = 0.0;
        v46[4] = Height;
        v46[5] = Width;
        v46[6] = v44;
        v63 = sub_100005850;
        v64 = v46;
        aBlock = _NSConcreteStackBlock;
        v60 = 1107296256;
        v61 = sub_100006BF8;
        v62 = &unk_100018C20;
        v47 = _Block_copy(&aBlock);
        v48 = v64;
        v49 = a1;
        swift_release(v48);
        v50 = swift_allocObject(&unk_100018C58, 33, 7);
        *(_QWORD *)(v50 + 16) = v6;
        *(_QWORD *)(v50 + 24) = v49;
        *(_BYTE *)(v50 + 32) = v12;
        v63 = sub_10000589C;
        v64 = (CGFloat *)v50;
        aBlock = _NSConcreteStackBlock;
        v60 = 1107296256;
        v61 = sub_1000044B8;
        v62 = &unk_100018C70;
        v51 = _Block_copy(&aBlock);
        v52 = v64;
        v53 = v6;
        v54 = v49;
        swift_release(v52);
        objc_msgSend(v45, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v47, v51, 200.0, 30.0);
        _Block_release(v51);
        _Block_release(v47);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

id sub_10000438C(_BYTE *a1, double a2, double a3, double a4, double a5)
{
  id result;
  void *v11;

  result = *(id *)&a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
  if (result)
  {
    result = objc_msgSend(result, "view");
    if (result)
    {
      v11 = result;
      objc_msgSend(result, "setFrame:", a2, a3, a4, a5);

      a1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar] = 1;
      return objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100004438(int a1, int a2, id a3, uint64_t a4, char a5)
{
  id v7;

  if (objc_msgSend(a3, "canSendResponse"))
    sub_100006558(a3, (a5 & 1) == 0);
  v7 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v7, "terminateWithSuccess");

}

uint64_t sub_1000044B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v6 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v6(a2, a3);
  return swift_release(v5);
}

void sub_100004500(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v5;
  double Width;
  id v11;
  CGRect v12;
  CGRect v13;

  v5 = *(void **)(a1 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention);
  if (v5)
  {
    v11 = objc_msgSend(v5, "view");
    if (v11)
    {
      v12.origin.x = a2;
      v12.origin.y = a3;
      v12.size.width = a4;
      v12.size.height = a5;
      Width = CGRectGetWidth(v12);
      v13.origin.x = a2;
      v13.origin.y = a3;
      v13.size.width = a4;
      v13.size.height = a5;
      objc_msgSend(v11, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v13));

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1000045C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a3 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention);
  if (v3)
  {
    v4 = objc_msgSend(v3, "view");
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "layer");

      objc_msgSend(v6, "setCornerRadius:", 0.0);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000464C()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
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
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;

  v1 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention;
  v2 = *(void **)&v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention];
  if (!v2)
  {
    __break(1u);
    goto LABEL_17;
  }
  v3 = objc_msgSend(v2, "view");
  if (!v3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v4 = v3;
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = *(void **)&v0[v1];
  if (!v5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = objc_msgSend(v5, "view");
  if (!v6)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "topAnchor");

  v9 = objc_msgSend(v0, "view");
  if (!v9)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "topAnchor");

  v12 = objc_msgSend(v8, "constraintEqualToAnchor:", v11);
  objc_msgSend(v12, "setActive:", 1);

  v13 = *(void **)&v0[v1];
  if (!v13)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v14 = objc_msgSend(v13, "view");
  if (!v14)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, "bottomAnchor");

  v17 = objc_msgSend(v0, "view");
  if (!v17)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "bottomAnchor");

  v20 = objc_msgSend(v16, "constraintEqualToAnchor:", v19);
  objc_msgSend(v20, "setActive:", 1);

  v21 = *(void **)&v0[v1];
  if (!v21)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v22 = objc_msgSend(v21, "view");
  if (!v22)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, "leftAnchor");

  v25 = objc_msgSend(v0, "view");
  if (!v25)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, "leftAnchor");

  v28 = objc_msgSend(v24, "constraintEqualToAnchor:", v27);
  objc_msgSend(v28, "setActive:", 1);

  v29 = *(void **)&v0[v1];
  if (!v29)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v30 = objc_msgSend(v29, "view");
  if (!v30)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v31 = v30;
  v32 = objc_msgSend(v30, "rightAnchor");

  v33 = objc_msgSend(v0, "view");
  if (v33)
  {
    v34 = v33;
    v35 = objc_msgSend(v33, "rightAnchor");

    v36 = objc_msgSend(v32, "constraintEqualToAnchor:", v35);
    objc_msgSend(v36, "setActive:", 1);

    return;
  }
LABEL_29:
  __break(1u);
}

void sub_1000049A4(void *a1, void (*a2)(id))
{
  char *v2;
  char *v3;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject *oslog;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  id v32[4];
  _OWORD v33[2];

  v3 = v2;
  v6 = objc_msgSend(v3, "_remoteViewControllerProxy");
  if (v6)
  {
    v7 = v6;
    _bridgeAnyObjectToAny(_:)(v31);
    swift_unknownObjectRelease(v7);
    sub_1000066BC(v31, v33);
    sub_100005F08((uint64_t)v33, (uint64_t)v31);
    v8 = sub_1000057A0(&qword_10001DB30);
    swift_dynamicCast(v32, v31, (char *)&type metadata for Any + 8, v8, 7);
    v9 = v32[0];
    objc_msgSend(v32[0], "setReachabilityDisabled:", 1);
    swift_unknownObjectRelease(v9);
    sub_100005F08((uint64_t)v33, (uint64_t)v31);
    swift_dynamicCast(v32, v31, (char *)&type metadata for Any + 8, v8, 7);
    v10 = v32[0];
    objc_msgSend(v32[0], "setAllowsAlertStacking:", 1);
    swift_unknownObjectRelease(v10);
    sub_100005F08((uint64_t)v33, (uint64_t)v31);
    swift_dynamicCast(v32, v31, (char *)&type metadata for Any + 8, v8, 7);
    v11 = v32[0];
    objc_msgSend(v32[0], "setWallpaperTunnelActive:", 1);
    swift_unknownObjectRelease(v11);
    v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] = 1;
    if (a1)
    {
      v12 = objc_msgSend(a1, "userInfo");
      if (v12)
      {
        v13 = v12;
        v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v12, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

        *(_QWORD *)&v29 = 0xD000000000000012;
        *((_QWORD *)&v29 + 1) = 0x8000000100011B10;
        AnyHashable.init<A>(_:)(v31, &v29, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v14 + 16) && (v15 = sub_100005F48((uint64_t)v31), (v16 & 1) != 0))
        {
          sub_100005F08(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&v29);
        }
        else
        {
          v29 = 0u;
          v30 = 0u;
        }
        swift_bridgeObjectRelease(v14);
        sub_1000066CC((uint64_t)v31);
        if (*((_QWORD *)&v30 + 1))
        {
          sub_1000066BC(&v29, v32);
          sub_100005F08((uint64_t)v32, (uint64_t)v31);
          if (swift_dynamicCast(&v29, v31, (char *)&type metadata for Any + 8, &type metadata for Double, 6))
          {
            v21 = v29;
            v22 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold;
          }
          else
          {
            v22 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold;
            v21 = *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold];
          }
          *(_QWORD *)&v3[v22] = v21;
          if (qword_10001DA30 != -1)
            swift_once(&qword_10001DA30, sub_100006B3C);
          v23 = type metadata accessor for Logger(0);
          sub_100005814(v23, (uint64_t)qword_10001EA30);
          v24 = v3;
          v25 = Logger.logObject.getter(v24);
          v26 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v25, v26))
          {
            v27 = (uint8_t *)swift_slowAlloc(12, -1);
            *(_DWORD *)v27 = 134217984;
            *(_QWORD *)&v31[0] = *(_QWORD *)&v3[v22];
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, (char *)v31 + 8, v27 + 4, v27 + 12);

            _os_log_impl((void *)&_mh_execute_header, v25, v26, "Setting distance threshold to %f mm", v27, 0xCu);
            swift_slowDealloc(v27, -1, -1);
          }
          else
          {

          }
          v12 = (id)sub_100005EE8(v32);
        }
        else
        {
          v12 = (id)sub_100006700((uint64_t)&v29);
        }
      }
      if (a2)
      {
        a2(v12);
        sub_100005EE8(v33);
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
    if (qword_10001DA30 != -1)
      swift_once(&qword_10001DA30, sub_100006B3C);
    v17 = type metadata accessor for Logger(0);
    v18 = sub_100005814(v17, (uint64_t)qword_10001EA30);
    oslog = Logger.logObject.getter(v18);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v19, "configureWithContext: Failed to instantiate remote VC proxy", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

  }
}

void sub_100004EE8(void *a1, void (*a2)(uint64_t))
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t **v14;
  __n128 v15;
  uint64_t *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    goto LABEL_22;
  v5 = objc_msgSend(a1, "actions");
  v6 = sub_100006838(0, &qword_10001DAB8, BSAction_ptr);
  v7 = sub_10000665C();
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v5, v6, v7);

  if ((v8 & 0xC000000000000001) != 0)
  {
    if (v8 < 0)
      v9 = v8;
    else
      v9 = v8 & 0xFFFFFFFFFFFFFF8;
    v10 = __CocoaSet.count.getter(v9);
  }
  else
  {
    v10 = *(_QWORD *)(v8 + 16);
  }
  v11 = swift_bridgeObjectRelease(v8);
  if (v10)
  {
    v12 = objc_msgSend(a1, "actions");
    v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v12, v6, v7);

    v14 = sub_10000603C(v13);
    swift_bridgeObjectRelease(v13);
    if (((unint64_t)v14 & 0x8000000000000000) != 0 || ((unint64_t)v14 & 0x4000000000000000) != 0)
    {
      v19 = swift_bridgeObjectRetain(v14);
      v20 = _CocoaArrayWrapper.endIndex.getter(v19);
      v15 = swift_release(v14);
      if (v20)
      {
LABEL_12:
        if (((unint64_t)v14 & 0xC000000000000001) == 0)
        {
          if (v14[2])
          {
            v16 = v14[4];
LABEL_15:
            v17 = v16;
            swift_release(v14);
            v18 = *(void **)(v2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction);
            *(_QWORD *)(v2 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction) = v17;

            goto LABEL_16;
          }
          __break(1u);
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_20:
        v16 = (uint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v14, v15);
        goto LABEL_15;
      }
    }
    else if (v14[2])
    {
      goto LABEL_12;
    }
    v15 = swift_release(v14);
    __break(1u);
    goto LABEL_20;
  }
LABEL_16:
  if (a2)
  {
    a2(v11);
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_10000516C()
{
  unsigned __int8 *v0;
  uint64_t result;
  void *v2;
  id v3;
  id v4;
  char *v5;
  id v6;
  id v7;

  result = (uint64_t)objc_msgSend(v0, "view");
  if (result)
  {
    v2 = (void *)result;
    v3 = objc_msgSend((id)result, "window");

    if (v3
      && (v4 = objc_msgSend(v3, "windowScene"), v3, v4)
      && (v5 = (char *)objc_msgSend(v4, "interfaceOrientation"), v4, (unint64_t)(v5 - 3) <= 1)
      && (v6 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice"),
          v7 = objc_msgSend(v6, "userInterfaceIdiom"),
          v6,
          !v7))
    {
      return 1;
    }
    else
    {
      return v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar];
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000052D4(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  NSString v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention] = 0;
  v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] = 3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold] = 0x4072C00000000000;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer] = 0;
  v3[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar] = 0;
  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_100005418(void *a1)
{
  _BYTE *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention] = 0;
  v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] = 3;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold] = 0x4072C00000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_viewModel] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer] = 0;
  v1[OBJC_IVAR____TtC11EyeReliefUI14ViewController_shouldHideStatusBar] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_1000054F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ViewController()
{
  return objc_opt_self(_TtC11EyeReliefUI14ViewController);
}

_BYTE *initializeBufferWithCopyOfBuffer for InterventionType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InterventionType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InterventionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100005698 + 4 * byte_100010EF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1000056CC + 4 * byte_100010EF0[v4]))();
}

uint64_t sub_1000056CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000056D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000056DCLL);
  return result;
}

uint64_t sub_1000056E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000056F0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1000056F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000056FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005708(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100005714(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InterventionType()
{
  return &type metadata for InterventionType;
}

unint64_t sub_100005730()
{
  unint64_t result;

  result = qword_10001DAA0;
  if (!qword_10001DAA0)
  {
    result = swift_getWitnessTable(&unk_100010FAC, &type metadata for InterventionType);
    atomic_store(result, (unint64_t *)&qword_10001DAA0);
  }
  return result;
}

uint64_t sub_100005774()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100005798()
{
  uint64_t v0;

  sub_100003E6C(*(char **)(v0 + 16));
}

uint64_t sub_1000057A0(uint64_t *a1)
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

uint64_t sub_1000057E0()
{
  return sub_10000585C((uint64_t (*)(_QWORD, double, double, double, double))sub_100004500);
}

uint64_t sub_1000057EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000057FC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100005804(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000045C4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100005814(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000582C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100005850()
{
  return sub_10000585C((uint64_t (*)(_QWORD, double, double, double, double))sub_10000438C);
}

uint64_t sub_10000585C(uint64_t (*a1)(_QWORD, double, double, double, double))
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_100005870()
{
  uint64_t v0;

  return swift_deallocObject(v0, 33, 7);
}

void sub_10000589C(int a1, int a2)
{
  uint64_t v2;

  sub_100004438(a1, a2, *(id *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32));
}

uint64_t sub_1000058A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100005978(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100005F08((uint64_t)v12, *a3);
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
      sub_100005F08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100005EE8(v12);
  return v7;
}

uint64_t sub_100005978(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100005B30(a5, a6);
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

uint64_t sub_100005B30(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100005BC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100005D9C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100005D9C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100005BC4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100005D38(v4, 0);
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

_QWORD *sub_100005D38(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000057A0(&qword_10001DAB0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005D9C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000057A0(&qword_10001DAB0);
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

uint64_t sub_100005EE8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005F08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100005F48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100005F78(a1, v4);
}

unint64_t sub_100005F78(uint64_t a1, uint64_t a2)
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
      sub_100006740(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000066CC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t **sub_10000603C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t **v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t **result;
  uint64_t v9;

  v1 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      goto LABEL_5;
    return (uint64_t **)&_swiftEmptyArrayStorage;
  }
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  v2 = __CocoaSet.count.getter(a1);
  if (!v2)
    return (uint64_t **)&_swiftEmptyArrayStorage;
LABEL_5:
  if (v2 <= 0)
  {
    v4 = (uint64_t **)&_swiftEmptyArrayStorage;
  }
  else
  {
    v3 = sub_1000057A0(&qword_10001DAC8);
    v4 = (uint64_t **)swift_allocObject(v3, 8 * v2 + 32, 7);
    v5 = j__malloc_size(v4);
    v6 = v5 - 32;
    if (v5 < 32)
      v6 = v5 - 25;
    v4[2] = (uint64_t *)v2;
    v4[3] = (uint64_t *)((2 * (v6 >> 3)) | 1);
  }
  swift_bridgeObjectRetain(v1);
  v7 = sub_100006134(&v9, v4 + 4, v2, v1);
  result = (uint64_t **)sub_1000066B4(v9);
  if (v7 == (uint64_t *)v2)
    return v4;
  __break(1u);
  return result;
}

uint64_t *sub_100006134(uint64_t *result, uint64_t **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t *v36;
  _QWORD v37[5];

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a4 < 0)
      v8 = a4;
    else
      v8 = a4 & 0xFFFFFFFFFFFFFF8;
    v9 = __CocoaSet.makeIterator()(v8);
    v10 = sub_100006838(0, &qword_10001DAB8, BSAction_ptr);
    v11 = sub_10000665C();
    result = Set.Iterator.init(_cocoa:)(v37, v9, v10, v11);
    v4 = v37[0];
    v12 = v37[1];
    v13 = v37[2];
    v14 = v37[3];
    v15 = v37[4];
    v33 = v7;
    if (v6)
      goto LABEL_6;
LABEL_39:
    v16 = 0;
LABEL_49:
    *v33 = v4;
    v33[1] = v12;
    v33[2] = v13;
    v33[3] = v14;
    v33[4] = v15;
    return (uint64_t *)v16;
  }
  v14 = 0;
  v29 = -1 << *(_BYTE *)(a4 + 32);
  v12 = a4 + 56;
  v13 = ~v29;
  v30 = -v29;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  else
    v31 = -1;
  v15 = v31 & *(_QWORD *)(a4 + 56);
  v33 = result;
  if (!a2)
    goto LABEL_39;
LABEL_6:
  if (!a3)
  {
    v16 = 0;
    goto LABEL_49;
  }
  if (a3 < 0)
    goto LABEL_51;
  v16 = 0;
  v34 = (unint64_t)(v13 + 64) >> 6;
  v32 = v13;
  while (1)
  {
    if (v4 < 0)
    {
      v23 = v12;
      v24 = __CocoaSet.Iterator.next()(result);
      if (!v24)
        goto LABEL_48;
      v25 = v24;
      v35 = v24;
      v26 = sub_100006838(0, &qword_10001DAB8, BSAction_ptr);
      swift_unknownObjectRetain(v25, v27);
      swift_dynamicCast(&v36, &v35, (char *)&type metadata for Swift.AnyObject + 8, v26, 7);
      v19 = v36;
      result = (uint64_t *)swift_unknownObjectRelease(v25);
      v12 = v23;
      if (!v19)
        goto LABEL_48;
      goto LABEL_11;
    }
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_10;
    }
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v20 >= v34)
    {
      v15 = 0;
      goto LABEL_48;
    }
    v21 = *(_QWORD *)(v12 + 8 * v20);
    if (v21)
      goto LABEL_26;
    v22 = v14 + 2;
    if (v14 + 2 >= v34)
    {
      v15 = 0;
      ++v14;
      goto LABEL_48;
    }
    v21 = *(_QWORD *)(v12 + 8 * v22);
    if (!v21)
    {
      if (v14 + 3 >= v34)
        goto LABEL_45;
      v21 = *(_QWORD *)(v12 + 8 * (v14 + 3));
      if (v21)
      {
        v20 = v14 + 3;
        goto LABEL_26;
      }
      v22 = v14 + 4;
      if (v14 + 4 >= v34)
      {
        v15 = 0;
        v14 += 3;
        goto LABEL_48;
      }
      v21 = *(_QWORD *)(v12 + 8 * v22);
      if (!v21)
      {
        v20 = v14 + 5;
        if (v14 + 5 >= v34)
        {
LABEL_45:
          v15 = 0;
          v14 = v22;
          goto LABEL_48;
        }
        v21 = *(_QWORD *)(v12 + 8 * v20);
        if (!v21)
        {
          v28 = v14 + 6;
          while (v34 != v28)
          {
            v21 = *(_QWORD *)(v12 + 8 * v28++);
            if (v21)
            {
              v20 = v28 - 1;
              goto LABEL_26;
            }
          }
          v15 = 0;
          v14 = v34 - 1;
          goto LABEL_48;
        }
        goto LABEL_26;
      }
    }
    v20 = v22;
LABEL_26:
    v15 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v20 << 6);
    v14 = v20;
LABEL_10:
    result = (uint64_t *)*(id *)(*(_QWORD *)(v4 + 48) + 8 * v18);
    v19 = result;
    if (!result)
      goto LABEL_48;
LABEL_11:
    ++v16;
    *v6++ = v19;
    if (v16 == a3)
    {
      v16 = a3;
LABEL_48:
      v13 = v32;
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

void sub_10000643C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionType] == 1)
    sub_100003860();
  v1 = swift_allocObject(&unk_100018CF8, 24, 7);
  *(_QWORD *)(v1 + 16) = v0;
  v2 = swift_allocObject(&unk_100018D20, 24, 7);
  *(_QWORD *)(v2 + 16) = v0;
  v3 = *(double *)&v0[OBJC_IVAR____TtC11EyeReliefUI14ViewController_tooCloseDistanceThreshold];
  v4 = type metadata accessor for DistanceStreaming();
  swift_allocObject(v4, 88, 7);
  v5 = v0;
  sub_10000F1F8((uint64_t)sub_100006828, v1, (uint64_t)sub_100006830, v2, v3);
  v6 = OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming;
  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming];
  *(_QWORD *)&v5[OBJC_IVAR____TtC11EyeReliefUI14ViewController_distanceStreaming] = v8;
  swift_release(v7);
  v9 = *(_QWORD *)&v5[v6];
  if (v9)
  {
    swift_retain(*(_QWORD *)&v5[v6]);
    sub_10000FA00();
    swift_release(v9);
  }
}

void sub_100006558(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;

  v6 = objc_msgSend(objc_allocWithZone((Class)BSMutableSettings), "init");
  objc_msgSend(v6, "setFlag:forSetting:", a2, 0);
  v4 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseWithInfo:", v6);
  if (objc_msgSend(a1, "canSendResponse"))
  {
    v5 = v4;
    objc_msgSend(a1, "sendResponse:", v5);

  }
}

uint64_t sub_10000661C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000662C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006650()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_10000665C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DAC0;
  if (!qword_10001DAC0)
  {
    v1 = sub_100006838(255, &qword_10001DAB8, BSAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001DAC0);
  }
  return result;
}

uint64_t sub_1000066B4(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_1000066BC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000066CC(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100006700(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000057A0(&qword_10001DB38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006740(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

void sub_10000677C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_interventionResponseAction);
  if (v1)
  {
    v2 = v1;
    if (objc_msgSend(v2, "canSendResponse"))
      sub_100006558(v2, 0x7FFFFFFFFFFFFFFFLL);

  }
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC11EyeReliefUI14ViewController_shieldIntervention))
  {
    v3 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    objc_msgSend(v3, "terminateWithSuccess");

  }
}

uint64_t sub_100006828(char a1)
{
  uint64_t v1;

  return sub_100002DE0(a1, *(void **)(v1 + 16));
}

uint64_t sub_100006830()
{
  uint64_t v0;

  return sub_1000034BC(*(void **)(v0 + 16));
}

uint64_t sub_100006838(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_100006870()
{
  uint64_t v0;

  sub_100003694(*(_QWORD *)(v0 + 16));
}

unint64_t sub_100006878()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DB48;
  if (!qword_10001DB48)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001DB48);
  }
  return result;
}

unint64_t sub_1000068C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DB58;
  if (!qword_10001DB58)
  {
    v1 = sub_10000690C(&qword_10001DB50);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001DB58);
  }
  return result;
}

uint64_t sub_10000690C(uint64_t *a1)
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

uint64_t sub_100006950()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100006974()
{
  uint64_t v0;

  sub_100002FC0(*(_BYTE *)(v0 + 16), *(char **)(v0 + 24));
}

double sub_100006980(uint64_t a1)
{
  uint64_t v1;

  return sub_100003320(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100006988(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000069B8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000069C4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000069E4(uint64_t result, int a2, int a3)
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
  sub_100006AA0(a1, &qword_10001DB60, (uint64_t)&unk_100018E90);
}

__n128 sub_100006A24(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006A30(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100006A50(uint64_t result, int a2, int a3)
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
  sub_100006AA0(a1, &qword_10001DB68, (uint64_t)&unk_100018F10);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100006AA0(a1, &qword_10001DB70, (uint64_t)&unk_100018F90);
}

void sub_100006AA0(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100006B3C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006BB8(v0, qword_10001EA30);
  sub_100005814(v0, (uint64_t)qword_10001EA30);
  return Logger.init(subsystem:category:)(0xD000000000000013, 0x8000000100011B50, 0x65696C6552657945, 0xEB00000000495566);
}

uint64_t *sub_100006BB8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006BF8(uint64_t a1)
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

uint64_t sub_100006C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSString v30;
  NSString v31;
  id v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSString v41;
  NSString v42;
  id v43;
  __n128 v44;
  void (*v45)(char *, char *, uint64_t, __n128);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  __n128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char v61;
  uint64_t v62;
  uint64_t v63;

  sub_1000057A0(&qword_10001E238);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v60 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v54 - v10;
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v56 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v54 - v17;
  __chkstk_darwin(v16);
  v55 = (char *)&v54 - v19;
  v61 = 0;
  State.init(wrappedValue:)(&v62, &v61, &type metadata for Bool);
  v20 = v63;
  *(_BYTE *)(a4 + 16) = v62;
  *(_QWORD *)(a4 + 24) = v20;
  v61 = 0;
  State.init(wrappedValue:)(&v62, &v61, &type metadata for Bool);
  v21 = v63;
  *(_BYTE *)(a4 + 32) = v62;
  *(_QWORD *)(a4 + 40) = v21;
  v61 = 0;
  State.init(wrappedValue:)(&v62, &v61, &type metadata for Bool);
  v22 = v63;
  *(_BYTE *)(a4 + 48) = v62;
  *(_QWORD *)(a4 + 56) = v22;
  *(_QWORD *)(a4 + 80) = a2;
  *(_QWORD *)(a4 + 88) = a3;
  swift_retain(a1);
  v57 = a2;
  v58 = a3;
  sub_10000DDE4(a2, a3);
  v23 = type metadata accessor for InterventionViewModel(0);
  v24 = sub_10000D958(&qword_10001E240, type metadata accessor for InterventionViewModel, (uint64_t)&unk_100011288);
  v59 = a1;
  *(_QWORD *)(a4 + 64) = ObservedObject.init(wrappedValue:)(a1, v23, v24);
  *(_QWORD *)(a4 + 72) = v25;
  v26 = type metadata accessor for ShieldConfiguration(0);
  v27 = swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
  sub_1000079E4();
  *(_QWORD *)a4 = v27;
  *(_QWORD *)(a4 + 8) = 0;
  v28 = (void *)objc_opt_self(NSBundle);
  v29 = objc_msgSend(v28, "mainBundle");
  v30 = String._bridgeToObjectiveC()();
  v31 = String._bridgeToObjectiveC()();
  v32 = objc_msgSend(v29, "URLForResource:withExtension:", v30, v31);

  if (v32)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v32);

    v33 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v33(v11, v18, v12);
    v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v34(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v35 = v55;
      v33(v55, v11, v12);
      v36 = (char *)(a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 40));
      v33(v36, v35, v12);
      v37 = type metadata accessor for VideoPlayerUIViewWrapper(0);
      v36[*(int *)(v37 + 20)] = 1;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v36, 0, 1, v37);
      goto LABEL_6;
    }
  }
  else
  {
    v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v34(v11, 1, 1, v12);
  }
  sub_10000EDD8((uint64_t)v11, &qword_10001E238);
  v38 = a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 40);
  v39 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v38, 1, 1, v39);
LABEL_6:
  v40 = objc_msgSend(v28, "mainBundle");
  v41 = String._bridgeToObjectiveC()();
  v42 = String._bridgeToObjectiveC()();
  v43 = objc_msgSend(v40, "URLForResource:withExtension:", v41, v42);

  if (v43)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v43);
    sub_10000661C(v57, v58);

    v44 = swift_release(v59);
    v45 = *(void (**)(char *, char *, uint64_t, __n128))(v13 + 32);
    v46 = (uint64_t)v60;
    v45(v60, v18, v12, v44);
    v34((char *)v46, 0, 1, v12);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v46, 1, v12) != 1)
    {
      v47 = v56;
      ((void (*)(char *, uint64_t, uint64_t))v45)(v56, v46, v12);
      v48 = a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 44);
      ((void (*)(uint64_t, char *, uint64_t))v45)(v48, v47, v12);
      v49 = type metadata accessor for VideoPlayerUIViewWrapper(0);
      *(_BYTE *)(v48 + *(int *)(v49 + 20)) = 0;
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v48, 0, 1, v49);
    }
  }
  else
  {
    sub_10000661C(v57, v58);
    v51 = swift_release(v59);
    v46 = (uint64_t)v60;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t, __n128))v34)(v60, 1, 1, v12, v51);
  }
  sub_10000EDD8(v46, &qword_10001E238);
  v52 = a4 + *(int *)(type metadata accessor for ShieldIntervention(0) + 44);
  v53 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v52, 1, 1, v53);
}

char *sub_100007184(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  char *v6;
  uint64_t v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  char *v18;
  NSURL *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  objc_super v30;

  v13 = OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer;
  v14 = objc_allocWithZone((Class)AVPlayerLayer);
  v15 = v6;
  *(_QWORD *)&v6[v13] = objc_msgSend(v14, "init");
  *(_QWORD *)&v15[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper] = 0;

  v30.receiver = v15;
  v30.super_class = (Class)type metadata accessor for VideoPlayerUIView();
  v16 = objc_msgSendSuper2(&v30, "initWithFrame:", a3, a4, a5, a6);
  v17 = objc_allocWithZone((Class)AVPlayerItem);
  v18 = (char *)v16;
  URL._bridgeToObjectiveC()(v19);
  v21 = v20;
  v22 = objc_msgSend(v17, "initWithURL:", v20);

  v23 = objc_msgSend(objc_allocWithZone((Class)AVQueuePlayer), "init");
  objc_msgSend(v23, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
  objc_msgSend(v23, "_setParticipatesInAudioSession:", 0);
  objc_msgSend(v23, "insertItem:afterItem:", v22, 0);
  if ((a2 & 1) != 0)
  {
    v24 = objc_msgSend((id)objc_opt_self(AVPlayerLooper), "playerLooperWithPlayer:templateItem:", v23, v22);
    v25 = *(void **)&v18[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper];
    *(_QWORD *)&v18[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLooper] = v24;

  }
  else
  {
    objc_msgSend(v23, "setActionAtItemEnd:", 2);
  }
  v26 = *(void **)&v18[OBJC_IVAR____TtC11EyeReliefUI17VideoPlayerUIView_videoLayer];
  objc_msgSend(v26, "setPlayer:", v23);
  v27 = objc_msgSend(v18, "layer");
  objc_msgSend(v27, "addSublayer:", v26);

  objc_msgSend(v23, "play");
  v28 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(a1, v28);
  return v18;
}

id sub_100007510()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlayerUIView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VideoPlayerUIView()
{
  return objc_opt_self(_TtC11EyeReliefUI17VideoPlayerUIView);
}

char *sub_100007598(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v10;

  v4 = type metadata accessor for URL(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, v2);
  LOBYTE(a2) = *(_BYTE *)(v2 + *(int *)(a2 + 20));
  v8 = objc_allocWithZone((Class)type metadata accessor for VideoPlayerUIView());
  return sub_100007184((uint64_t)v6, a2, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_100007648(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_100007688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_10000D958(&qword_10001E220, type metadata accessor for VideoPlayerUIViewWrapper, (uint64_t)&unk_1000111A8);
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000076F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_10000D958(&qword_10001E220, type metadata accessor for VideoPlayerUIViewWrapper, (uint64_t)&unk_1000111A8);
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100007758(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000D958(&qword_10001E220, type metadata accessor for VideoPlayerUIViewWrapper, (uint64_t)&unk_1000111A8);
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_100007794()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_1000112C0);
  v2 = swift_getKeyPath(&unk_1000112E8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100007804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11EyeReliefUI21InterventionViewModel__isTooClose;
  v2 = sub_1000057A0(&qword_10001E230);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100007858()
{
  return type metadata accessor for InterventionViewModel(0);
}

uint64_t type metadata accessor for InterventionViewModel(uint64_t a1)
{
  return sub_100008EF4(a1, (uint64_t *)&unk_10001DBE0, (uint64_t)&nominal type descriptor for InterventionViewModel);
}

void sub_100007874(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100008078(319, (unint64_t *)&unk_10001DBF0, (uint64_t)&type metadata for Bool);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
  }
}

uint64_t sub_1000078F0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for InterventionViewModel(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000792C()
{
  return sub_10000797C((uint64_t)&unk_100011358, (uint64_t)&unk_1000114B8);
}

uint64_t sub_100007940()
{
  return sub_10000797C((uint64_t)&unk_100011308, (uint64_t)&unk_100011558);
}

uint64_t sub_100007954()
{
  return sub_10000797C((uint64_t)&unk_100011330, (uint64_t)&unk_100011538);
}

uint64_t sub_100007968()
{
  return sub_10000797C((uint64_t)&unk_100011380, (uint64_t)&unk_100011498);
}

uint64_t sub_10000797C(uint64_t a1, uint64_t a2)
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

uint64_t sub_1000079E4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  void *v7;
  id v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
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
  id v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;
  Swift::String v56;
  Swift::String v57;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v3 = objc_msgSend(v2, "model");

  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String.uppercased()();
  swift_bridgeObjectRelease(v5);
  v51 = 0xD000000000000017;
  v52 = 0x8000000100011DB0;
  String.append(_:)(v6);
  v7 = (void *)objc_opt_self(NSBundle);
  v8 = objc_msgSend(v7, "mainBundle");
  v53._object = (void *)0x8000000100011DD0;
  v9._countAndFlagsBits = 0xD000000000000017;
  v9._object = (void *)0x8000000100011DB0;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  v53._countAndFlagsBits = 0xD00000000000002ELL;
  v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v53);
  swift_bridgeObjectRelease(0x8000000100011DB0);

  v12 = static String.localizedStringWithFormat(_:_:)(v11._countAndFlagsBits, v11._object, &_swiftEmptyArrayStorage);
  v14 = v13;
  swift_bridgeObjectRelease(v11._object);
  swift_beginAccess(v1 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__titleString, &v51, 33, 0);
  v49 = v12;
  v50 = v14;
  Published.init(initialValue:)(&v49, &type metadata for String);
  swift_endAccess(&v51);
  v51 = 0xD00000000000001ALL;
  v52 = 0x8000000100011E00;
  String.append(_:)(v6);
  v15 = v51;
  v16 = (void *)v52;
  v17 = objc_msgSend(v7, "mainBundle");
  v54._countAndFlagsBits = 0xD000000000000034;
  v54._object = (void *)0x8000000100011E20;
  v18._countAndFlagsBits = v15;
  v18._object = v16;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v54);
  swift_bridgeObjectRelease(v16);

  v21 = static String.localizedStringWithFormat(_:_:)(v20._countAndFlagsBits, v20._object, &_swiftEmptyArrayStorage);
  v23 = v22;
  swift_bridgeObjectRelease(v20._object);
  swift_beginAccess(v1 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__subtitleString, &v51, 33, 0);
  v49 = v21;
  v50 = v23;
  Published.init(initialValue:)(&v49, &type metadata for String);
  swift_endAccess(&v51);
  v24 = objc_msgSend(v7, "mainBundle");
  v25._countAndFlagsBits = 0xD000000000000014;
  v55._object = (void *)0x8000000100011E80;
  v25._object = (void *)0x8000000100011E60;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  v55._countAndFlagsBits = 0xD00000000000002ELL;
  v27 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, (NSBundle)v24, v26, v55);

  v28 = static String.localizedStringWithFormat(_:_:)(v27._countAndFlagsBits, v27._object, &_swiftEmptyArrayStorage);
  v30 = v29;
  swift_bridgeObjectRelease(v27._object);
  swift_beginAccess(v1 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__successTitleString, &v51, 33, 0);
  v49 = v28;
  v50 = v30;
  Published.init(initialValue:)(&v49, &type metadata for String);
  swift_endAccess(&v51);
  v51 = 0xD000000000000018;
  v52 = 0x8000000100011EB0;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(v6._object);
  v31 = v51;
  v32 = (void *)v52;
  v33 = objc_msgSend(v7, "mainBundle");
  v56._countAndFlagsBits = 0xD000000000000031;
  v56._object = (void *)0x8000000100011ED0;
  v34._countAndFlagsBits = v31;
  v34._object = v32;
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  v36 = NSLocalizedString(_:tableName:bundle:value:comment:)(v34, (Swift::String_optional)0, (NSBundle)v33, v35, v56);
  swift_bridgeObjectRelease(v32);

  v37 = static String.localizedStringWithFormat(_:_:)(v36._countAndFlagsBits, v36._object, &_swiftEmptyArrayStorage);
  v39 = v38;
  swift_bridgeObjectRelease(v36._object);
  swift_beginAccess(v1 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__successSubtitleString, &v51, 33, 0);
  v49 = v37;
  v50 = v39;
  Published.init(initialValue:)(&v49, &type metadata for String);
  swift_endAccess(&v51);
  v40 = objc_msgSend(v7, "mainBundle");
  v57._countAndFlagsBits = 0xD000000000000027;
  v57._object = (void *)0x8000000100011F10;
  v41._countAndFlagsBits = 0x45554E49544E4F43;
  v41._object = (void *)0xE800000000000000;
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  v43 = NSLocalizedString(_:tableName:bundle:value:comment:)(v41, (Swift::String_optional)0, (NSBundle)v40, v42, v57);

  v44 = static String.localizedStringWithFormat(_:_:)(v43._countAndFlagsBits, v43._object, &_swiftEmptyArrayStorage);
  v46 = v45;
  swift_bridgeObjectRelease(v43._object);
  v47 = (uint64_t *)(v1 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString);
  *v47 = v44;
  v47[1] = v46;
  return v1;
}

uint64_t sub_100007F20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__titleString;
  v2 = sub_1000057A0(&qword_10001E228);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__successTitleString, v2);
  v3(v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__successSubtitleString, v2);
  v3(v0 + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration__subtitleString, v2);
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString
                                      + 8));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100007FD0()
{
  return type metadata accessor for ShieldConfiguration(0);
}

uint64_t type metadata accessor for ShieldConfiguration(uint64_t a1)
{
  return sub_100008EF4(a1, (uint64_t *)&unk_10001DCE8, (uint64_t)&nominal type descriptor for ShieldConfiguration);
}

void sub_100007FEC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  sub_100008078(319, (unint64_t *)&unk_10001DCF8, (uint64_t)&type metadata for String);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    v4[3] = v4[0];
    v4[4] = &unk_1000110D8;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
  }
}

void sub_100008078(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_1000080BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(const void *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain(v5);
  }
  else
  {
    v8 = a2 + 10;
    v9 = a2[10];
    v10 = a2[1];
    *(_QWORD *)(a1 + 8) = v10;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v11 = a2[3];
    *(_QWORD *)(a1 + 24) = v11;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    v12 = a2[5];
    *(_QWORD *)(a1 + 40) = v12;
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v14 = a2[7];
    v13 = a2[8];
    *(_QWORD *)(a1 + 56) = v14;
    *(_QWORD *)(a1 + 64) = v13;
    v15 = a2[9];
    *(_QWORD *)(a1 + 72) = v15;
    swift_retain(v5);
    swift_retain(v10);
    swift_retain(v11);
    swift_retain(v12);
    swift_retain(v14);
    swift_retain(v15);
    if (v9)
    {
      v16 = a2[11];
      *(_QWORD *)(a1 + 80) = v9;
      *(_QWORD *)(a1 + 88) = v16;
      swift_retain(v16);
    }
    else
    {
      *(_OWORD *)(a1 + 80) = *v8;
    }
    v17 = *(int *)(a3 + 40);
    v18 = (void *)(a1 + v17);
    v19 = (char *)a2 + v17;
    v20 = type metadata accessor for VideoPlayerUIViewWrapper(0);
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48);
    if (v22(v19, 1, v20))
    {
      v23 = sub_1000057A0(&qword_10001DE58);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v24 = type metadata accessor for URL(0);
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v18, v19, v24);
      *((_BYTE *)v18 + *(int *)(v20 + 20)) = v19[*(int *)(v20 + 20)];
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    v25 = *(int *)(a3 + 44);
    v26 = (void *)(a1 + v25);
    v27 = (char *)a2 + v25;
    if (v22(v27, 1, v20))
    {
      v28 = sub_1000057A0(&qword_10001DE58);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      v29 = type metadata accessor for URL(0);
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v26, v27, v29);
      *((_BYTE *)v26 + *(int *)(v20 + 20)) = v27[*(int *)(v20 + 20)];
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v26, 0, 1, v20);
    }
  }
  return a1;
}

uint64_t type metadata accessor for VideoPlayerUIViewWrapper(uint64_t a1)
{
  return sub_100008EF4(a1, qword_10001DF68, (uint64_t)&nominal type descriptor for VideoPlayerUIViewWrapper);
}

uint64_t sub_1000082FC(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  unsigned int (*v6)(char *, uint64_t, uint64_t);
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;

  swift_release(*a1);
  swift_release(a1[1]);
  swift_release(a1[3]);
  swift_release(a1[5]);
  swift_release(a1[7]);
  swift_release(a1[9]);
  if (a1[10])
    swift_release(a1[11]);
  v4 = (char *)a1 + *(int *)(a2 + 40);
  v5 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v6 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48);
  if (!v6(v4, 1, v5))
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
  }
  v8 = (char *)a1 + *(int *)(a2 + 44);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v6)(v8, 1, v5);
  if (!(_DWORD)result)
  {
    v10 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v8, v10);
  }
  return result;
}

uint64_t sub_100008400(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(const void *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v6 = *a2;
  v7 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  v8 = a2[3];
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  v9 = a2[5];
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  v11 = a2[7];
  v10 = a2[8];
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v10;
  v12 = a2[9];
  *(_QWORD *)(a1 + 72) = v12;
  v14 = a2 + 10;
  v13 = a2[10];
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  swift_retain(v11);
  swift_retain(v12);
  if (v13)
  {
    v15 = a2[11];
    *(_QWORD *)(a1 + 80) = v13;
    *(_QWORD *)(a1 + 88) = v15;
    swift_retain(v15);
  }
  else
  {
    *(_OWORD *)(a1 + 80) = *v14;
  }
  v16 = *(int *)(a3 + 40);
  v17 = (void *)(a1 + v16);
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  if (v21(v18, 1, v19))
  {
    v22 = sub_1000057A0(&qword_10001DE58);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v23 = type metadata accessor for URL(0);
    (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v17, v18, v23);
    *((_BYTE *)v17 + *(int *)(v19 + 20)) = v18[*(int *)(v19 + 20)];
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  v24 = *(int *)(a3 + 44);
  v25 = (void *)(a1 + v24);
  v26 = (char *)a2 + v24;
  if (v21(v26, 1, v19))
  {
    v27 = sub_1000057A0(&qword_10001DE58);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    v28 = type metadata accessor for URL(0);
    (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v25, v26, v28);
    *((_BYTE *)v25 + *(int *)(v19 + 20)) = v26[*(int *)(v19 + 20)];
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v25, 0, 1, v19);
  }
  return a1;
}

uint64_t *sub_100008600(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
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
  _BYTE *v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(_BYTE *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  _BYTE *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_retain(v6);
  swift_release(v7);
  v8 = a1[1];
  v9 = a2[1];
  a1[1] = v9;
  swift_retain(v9);
  swift_release(v8);
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  v10 = a1[3];
  v11 = a2[3];
  a1[3] = v11;
  swift_retain(v11);
  swift_release(v10);
  *((_BYTE *)a1 + 32) = *((_BYTE *)a2 + 32);
  v12 = a1[5];
  v13 = a2[5];
  a1[5] = v13;
  swift_retain(v13);
  swift_release(v12);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  v14 = a1[7];
  v15 = a2[7];
  a1[7] = v15;
  swift_retain(v15);
  swift_release(v14);
  a1[8] = a2[8];
  v16 = a2[9];
  v17 = a1[9];
  a1[9] = v16;
  swift_retain(v16);
  swift_release(v17);
  v18 = a2[10];
  if (a1[10])
  {
    if (v18)
    {
      v19 = a2[11];
      v20 = a1[11];
      a1[10] = v18;
      a1[11] = v19;
      swift_retain(v19);
      swift_release(v20);
      goto LABEL_8;
    }
    swift_release(a1[11]);
  }
  else if (v18)
  {
    v21 = a2[11];
    a1[10] = v18;
    a1[11] = v21;
    swift_retain(v21);
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
LABEL_8:
  v22 = *(int *)(a3 + 40);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      v30 = type metadata accessor for URL(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v23, v24, v30);
      v23[*(int *)(v25 + 20)] = v24[*(int *)(v25 + 20)];
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v29)
  {
    sub_10000891C((uint64_t)v23);
LABEL_13:
    v31 = sub_1000057A0(&qword_10001DE58);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    goto LABEL_14;
  }
  v40 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v40 - 8) + 24))(v23, v24, v40);
  v23[*(int *)(v25 + 20)] = v24[*(int *)(v25 + 20)];
LABEL_14:
  v32 = *(int *)(a3 + 44);
  v33 = (char *)a1 + v32;
  v34 = (char *)a2 + v32;
  v35 = v27((_BYTE *)a1 + v32, 1, v25);
  v36 = v27(v34, 1, v25);
  if (!v35)
  {
    if (!v36)
    {
      v41 = type metadata accessor for URL(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v41 - 8) + 24))(v33, v34, v41);
      v33[*(int *)(v25 + 20)] = v34[*(int *)(v25 + 20)];
      return a1;
    }
    sub_10000891C((uint64_t)v33);
    goto LABEL_19;
  }
  if (v36)
  {
LABEL_19:
    v38 = sub_1000057A0(&qword_10001DE58);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    return a1;
  }
  v37 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v33, v34, v37);
  v33[*(int *)(v25 + 20)] = v34[*(int *)(v25 + 20)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v33, 0, 1, v25);
  return a1;
}

uint64_t sub_10000891C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(const void *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 80);
  if (v8)
  {
    v9 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 80) = v8;
    *(_QWORD *)(a1 + 88) = v9;
  }
  else
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  }
  v10 = *(int *)(a3 + 40);
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  v13 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    v16 = sub_1000057A0(&qword_10001DE58);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v17 = type metadata accessor for URL(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v11, v12, v17);
    *((_BYTE *)v11 + *(int *)(v13 + 20)) = *((_BYTE *)v12 + *(int *)(v13 + 20));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  v18 = *(int *)(a3 + 44);
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v15(v20, 1, v13))
  {
    v21 = sub_1000057A0(&qword_10001DE58);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v22 = type metadata accessor for URL(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
    *((_BYTE *)v19 + *(int *)(v13 + 20)) = *((_BYTE *)v20 + *(int *)(v13 + 20));
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v19, 0, 1, v13);
  }
  return a1;
}

uint64_t *sub_100008AF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
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
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_BYTE *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  v7 = a1[1];
  a1[1] = a2[1];
  swift_release(v7);
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  v8 = a1[3];
  a1[3] = a2[3];
  swift_release(v8);
  *((_BYTE *)a1 + 32) = *((_BYTE *)a2 + 32);
  v9 = a1[5];
  a1[5] = a2[5];
  swift_release(v9);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  v10 = a1[7];
  a1[7] = a2[7];
  swift_release(v10);
  v11 = a2[9];
  v12 = a1[9];
  a1[8] = a2[8];
  a1[9] = v11;
  swift_release(v12);
  v13 = a2[10];
  if (a1[10])
  {
    if (v13)
    {
      v14 = a2[11];
      v15 = a1[11];
      a1[10] = v13;
      a1[11] = v14;
      swift_release(v15);
      goto LABEL_8;
    }
    swift_release(a1[11]);
  }
  else if (v13)
  {
    v16 = a2[11];
    a1[10] = v13;
    a1[11] = v16;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
LABEL_8:
  v17 = *(int *)(a3 + 40);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      v25 = type metadata accessor for URL(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v18, v19, v25);
      v18[*(int *)(v20 + 20)] = v19[*(int *)(v20 + 20)];
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v24)
  {
    sub_10000891C((uint64_t)v18);
LABEL_13:
    v26 = sub_1000057A0(&qword_10001DE58);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_14;
  }
  v35 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v18, v19, v35);
  v18[*(int *)(v20 + 20)] = v19[*(int *)(v20 + 20)];
LABEL_14:
  v27 = *(int *)(a3 + 44);
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  v30 = v22((_BYTE *)a1 + v27, 1, v20);
  v31 = v22(v29, 1, v20);
  if (!v30)
  {
    if (!v31)
    {
      v36 = type metadata accessor for URL(0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v36 - 8) + 40))(v28, v29, v36);
      v28[*(int *)(v20 + 20)] = v29[*(int *)(v20 + 20)];
      return a1;
    }
    sub_10000891C((uint64_t)v28);
    goto LABEL_19;
  }
  if (v31)
  {
LABEL_19:
    v33 = sub_1000057A0(&qword_10001DE58);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    return a1;
  }
  v32 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v28, v29, v32);
  v28[*(int *)(v20 + 20)] = v29[*(int *)(v20 + 20)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v28, 0, 1, v20);
  return a1;
}

uint64_t sub_100008DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008DDC);
}

uint64_t sub_100008DDC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1000057A0(&qword_10001DE58);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 40)], a2, v8);
  }
}

uint64_t sub_100008E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008E68);
}

char *sub_100008E68(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_1000057A0(&qword_10001DE58);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 40)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ShieldIntervention(uint64_t a1)
{
  return sub_100008EF4(a1, (uint64_t *)&unk_10001DEB8, (uint64_t)&nominal type descriptor for ShieldIntervention);
}

uint64_t sub_100008EF4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

void sub_100008F28(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t v6;

  v4[0] = &unk_1000110D8;
  v4[1] = &unk_100011108;
  v4[2] = &unk_100011108;
  v4[3] = &unk_100011108;
  v4[4] = &unk_1000110D8;
  v4[5] = &unk_100011108;
  sub_100008FAC(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(v2 - 8) + 64;
    v6 = v5;
    swift_initStructMetadata(a1, 256, 8, v4, a1 + 16);
  }
}

void sub_100008FAC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10001DEC8)
  {
    v2 = type metadata accessor for VideoPlayerUIViewWrapper(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10001DEC8);
  }
}

_QWORD *sub_100009000(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v8);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_100009088(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_1000090BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100009118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100009174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1000091D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000922C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009238);
}

uint64_t sub_100009238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_1000092C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000092D0);
}

uint64_t sub_1000092D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_100009348(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100011140;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

void *sub_1000093B8()
{
  return &protocol witness table for Never;
}

uint64_t sub_1000093C4()
{
  return sub_10000D958(&qword_10001DFA0, type metadata accessor for VideoPlayerUIViewWrapper, (uint64_t)&unk_100011158);
}

uint64_t sub_1000093F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000139BC, 1);
}

uint64_t sub_100009400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t KeyPath;

  v10 = sub_1000057A0(&qword_10001E1B0);
  __chkstk_darwin(v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Font.TextStyle(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000114D8);
  v24 = swift_getKeyPath(&unk_100011508);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, enum case for Font.TextStyle.largeTitle(_:), v13);
  v17 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  a3 &= 1u;
  sub_10000DDD4(a1, a2, a3);
  swift_bridgeObjectRetain(a4);
  v18 = static Font.system(_:design:weight:)(v16, v12, 0, 1);
  sub_10000EDD8((uint64_t)v12, &qword_10001E1B0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v19 = Font.bold()(v18);
  swift_release(v18);
  v20 = swift_getKeyPath(&unk_100011468);
  v21 = static Color.primary.getter();
  result = swift_getKeyPath(&unk_100011408);
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3;
  v23 = KeyPath;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = v23;
  *(_QWORD *)(a5 + 40) = 0;
  *(_BYTE *)(a5 + 48) = 1;
  *(_QWORD *)(a5 + 56) = v24;
  *(_BYTE *)(a5 + 64) = 1;
  *(_QWORD *)(a5 + 72) = v20;
  *(_QWORD *)(a5 + 80) = v19;
  *(_QWORD *)(a5 + 88) = result;
  *(_QWORD *)(a5 + 96) = v21;
  *(_QWORD *)(a5 + 104) = 0x4000000000000000;
  return result;
}

uint64_t sub_1000095E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;

  v10 = sub_1000057A0(&qword_10001E1B0);
  __chkstk_darwin(v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Font.TextStyle(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000114D8);
  v23 = swift_getKeyPath(&unk_100011508);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, enum case for Font.TextStyle.body(_:), v13);
  v17 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  a3 &= 1u;
  sub_10000DDD4(a1, a2, a3);
  swift_bridgeObjectRetain(a4);
  v18 = static Font.system(_:design:weight:)(v16, v12, 0, 1);
  sub_10000EDD8((uint64_t)v12, &qword_10001E1B0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v19 = swift_getKeyPath(&unk_100011468);
  v20 = static Color.primary.getter();
  result = swift_getKeyPath(&unk_100011408);
  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(_BYTE *)(a5 + 16) = a3;
  v22 = KeyPath;
  *(_QWORD *)(a5 + 24) = a4;
  *(_QWORD *)(a5 + 32) = v22;
  *(_QWORD *)(a5 + 40) = 0;
  *(_BYTE *)(a5 + 48) = 1;
  *(_QWORD *)(a5 + 56) = v23;
  *(_BYTE *)(a5 + 64) = 1;
  *(_QWORD *)(a5 + 72) = v19;
  *(_QWORD *)(a5 + 80) = v18;
  *(_QWORD *)(a5 + 88) = result;
  *(_QWORD *)(a5 + 96) = v20;
  *(_QWORD *)(a5 + 104) = 0x4000000000000000;
  return result;
}

uint64_t sub_1000097BC@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  _BYTE *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v71[24];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[7];
  _OWORD v89[3];

  v80 = a1;
  v87 = a2;
  v86 = type metadata accessor for ButtonBorderShape(0);
  v85 = *(_QWORD *)(v86 - 8);
  __chkstk_darwin(v86);
  v84 = &v71[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v83 = type metadata accessor for BorderedProminentButtonStyle(0);
  v82 = *(_QWORD *)(v83 - 8);
  __chkstk_darwin(v83);
  v81 = &v71[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1000057A0(&qword_10001E118);
  __chkstk_darwin(v10);
  v12 = &v71[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v72 = sub_1000057A0(&qword_10001E120);
  __chkstk_darwin(v72);
  v14 = &v71[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v74 = sub_1000057A0(&qword_10001E128);
  __chkstk_darwin(v74);
  v16 = &v71[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v75 = sub_1000057A0(&qword_10001E130);
  __chkstk_darwin(v75);
  v18 = &v71[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v77 = sub_1000057A0(&qword_10001E138);
  __chkstk_darwin(v77);
  v20 = &v71[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v79 = sub_1000057A0(&qword_10001E140);
  v78 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v22 = &v71[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v76 = sub_1000057A0(&qword_10001E148);
  v23 = __chkstk_darwin(v76);
  v25 = &v71[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = static Alignment.center.getter(v23);
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v88, *(_QWORD *)&a3, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, v26, v27);
  v28 = sub_1000057A0(&qword_10001E028);
  v29 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v12, v73, v28);
  v30 = &v12[*(int *)(v10 + 36)];
  v31 = v88[5];
  v30[4] = v88[4];
  v30[5] = v31;
  v30[6] = v88[6];
  v32 = v88[1];
  *v30 = v88[0];
  v30[1] = v32;
  v33 = v88[3];
  v30[2] = v88[2];
  v30[3] = v33;
  v34 = static Alignment.center.getter(v29);
  _FrameLayout.init(width:height:alignment:)(v89, 0, 1, *(_QWORD *)&a4, 0, v34, v35);
  sub_10000ECA0((uint64_t)v12, (uint64_t)v14, &qword_10001E118);
  v36 = &v14[*(int *)(v72 + 36)];
  v37 = v89[1];
  *v36 = v89[0];
  v36[1] = v37;
  v36[2] = v89[2];
  sub_10000EDD8((uint64_t)v12, &qword_10001E118);
  KeyPath = swift_getKeyPath(&unk_1000113A8);
  v39 = swift_allocObject(&unk_100019130, 17, 7);
  LOBYTE(v26) = v80;
  *(_BYTE *)(v39 + 16) = v80 & 1;
  sub_10000ECA0((uint64_t)v14, (uint64_t)v16, &qword_10001E120);
  v40 = (uint64_t *)&v16[*(int *)(v74 + 36)];
  *v40 = KeyPath;
  v40[1] = (uint64_t)sub_10000E638;
  v40[2] = v39;
  v41 = sub_10000EDD8((uint64_t)v14, &qword_10001E120);
  v42 = static Color.blue.getter(v41);
  v43 = swift_getKeyPath(&unk_1000113D8);
  sub_10000ECA0((uint64_t)v16, (uint64_t)v18, &qword_10001E128);
  v44 = (uint64_t *)&v18[*(int *)(v75 + 36)];
  *v44 = v43;
  v44[1] = v42;
  v45 = sub_10000EDD8((uint64_t)v16, &qword_10001E128);
  if ((v26 & 1) != 0)
    v46 = static Color.gray.getter(v45);
  else
    v46 = static Color.white.getter(v45);
  v47 = v46;
  v48 = swift_getKeyPath(&unk_100011408);
  sub_10000ECA0((uint64_t)v18, (uint64_t)v20, &qword_10001E130);
  v49 = v77;
  v50 = (uint64_t *)&v20[*(int *)(v77 + 36)];
  *v50 = v48;
  v50[1] = v47;
  v51 = sub_10000EDD8((uint64_t)v18, &qword_10001E130);
  v52 = v81;
  BorderedProminentButtonStyle.init()(v51);
  v53 = sub_10000E6F0();
  v54 = sub_10000D958(&qword_10001E1A0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v55 = v83;
  View.buttonStyle<A>(_:)(v52, v49, v83, v53, v54);
  (*(void (**)(_BYTE *, uint64_t))(v82 + 8))(v52, v55);
  v56 = sub_10000EDD8((uint64_t)v20, &qword_10001E138);
  v57 = v84;
  static ButtonBorderShape.capsule.getter(v56);
  v58 = swift_getKeyPath(&unk_100011438);
  v59 = (uint64_t *)&v25[*(int *)(v76 + 36)];
  v60 = sub_1000057A0(&qword_10001E1A8);
  v61 = v85;
  v62 = v86;
  (*(void (**)(char *, _BYTE *, uint64_t))(v85 + 16))((char *)v59 + *(int *)(v60 + 28), v57, v86);
  *v59 = v58;
  v63 = v78;
  v64 = v79;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v78 + 16))(v25, v22, v79);
  (*(void (**)(_BYTE *, uint64_t))(v61 + 8))(v57, v62);
  v65 = (*(uint64_t (**)(_BYTE *, uint64_t))(v63 + 8))(v22, v64);
  v66 = static AnyTransition.opacity.getter(v65);
  v67 = static Animation.easeInOut(duration:)(a5);
  v68 = AnyTransition.animation(_:)(v67, v66);
  swift_release(v66);
  swift_release(v67);
  v69 = v87;
  sub_10000ECA0((uint64_t)v25, v87, &qword_10001E148);
  *(_QWORD *)(v69 + *(int *)(sub_1000057A0(&qword_10001E030) + 36)) = v68;
  return sub_10000EDD8((uint64_t)v25, &qword_10001E148);
}

uint64_t sub_100009EDC@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  _BYTE *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v71[24];
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[7];
  _OWORD v89[3];

  v80 = a1;
  v87 = a2;
  v86 = type metadata accessor for ButtonBorderShape(0);
  v85 = *(_QWORD *)(v86 - 8);
  __chkstk_darwin(v86);
  v84 = &v71[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v83 = type metadata accessor for BorderedProminentButtonStyle(0);
  v82 = *(_QWORD *)(v83 - 8);
  __chkstk_darwin(v83);
  v81 = &v71[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1000057A0(&qword_10001E1B8);
  __chkstk_darwin(v10);
  v12 = &v71[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v72 = sub_1000057A0(&qword_10001E1C0);
  __chkstk_darwin(v72);
  v14 = &v71[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v74 = sub_1000057A0(&qword_10001E1C8);
  __chkstk_darwin(v74);
  v16 = &v71[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v75 = sub_1000057A0(&qword_10001E1D0);
  __chkstk_darwin(v75);
  v18 = &v71[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v77 = sub_1000057A0(&qword_10001E1D8);
  __chkstk_darwin(v77);
  v20 = &v71[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v79 = sub_1000057A0(&qword_10001E1E0);
  v78 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v22 = &v71[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v76 = sub_1000057A0(&qword_10001E1E8);
  v23 = __chkstk_darwin(v76);
  v25 = &v71[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = static Alignment.center.getter(v23);
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v88, *(_QWORD *)&a3, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, v26, v27);
  v28 = sub_1000057A0(&qword_10001E000);
  v29 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v12, v73, v28);
  v30 = &v12[*(int *)(v10 + 36)];
  v31 = v88[5];
  v30[4] = v88[4];
  v30[5] = v31;
  v30[6] = v88[6];
  v32 = v88[1];
  *v30 = v88[0];
  v30[1] = v32;
  v33 = v88[3];
  v30[2] = v88[2];
  v30[3] = v33;
  v34 = static Alignment.center.getter(v29);
  _FrameLayout.init(width:height:alignment:)(v89, 0, 1, *(_QWORD *)&a4, 0, v34, v35);
  sub_10000ECA0((uint64_t)v12, (uint64_t)v14, &qword_10001E1B8);
  v36 = &v14[*(int *)(v72 + 36)];
  v37 = v89[1];
  *v36 = v89[0];
  v36[1] = v37;
  v36[2] = v89[2];
  sub_10000EDD8((uint64_t)v12, &qword_10001E1B8);
  KeyPath = swift_getKeyPath(&unk_1000113A8);
  v39 = swift_allocObject(&unk_100019158, 17, 7);
  LOBYTE(v26) = v80;
  *(_BYTE *)(v39 + 16) = v80 & 1;
  sub_10000ECA0((uint64_t)v14, (uint64_t)v16, &qword_10001E1C0);
  v40 = (uint64_t *)&v16[*(int *)(v74 + 36)];
  *v40 = KeyPath;
  v40[1] = (uint64_t)sub_10000F0D8;
  v40[2] = v39;
  v41 = sub_10000EDD8((uint64_t)v14, &qword_10001E1C0);
  v42 = static Color.blue.getter(v41);
  v43 = swift_getKeyPath(&unk_1000113D8);
  sub_10000ECA0((uint64_t)v16, (uint64_t)v18, &qword_10001E1C8);
  v44 = (uint64_t *)&v18[*(int *)(v75 + 36)];
  *v44 = v43;
  v44[1] = v42;
  v45 = sub_10000EDD8((uint64_t)v16, &qword_10001E1C8);
  if ((v26 & 1) != 0)
    v46 = static Color.gray.getter(v45);
  else
    v46 = static Color.white.getter(v45);
  v47 = v46;
  v48 = swift_getKeyPath(&unk_100011408);
  sub_10000ECA0((uint64_t)v18, (uint64_t)v20, &qword_10001E1D0);
  v49 = v77;
  v50 = (uint64_t *)&v20[*(int *)(v77 + 36)];
  *v50 = v48;
  v50[1] = v47;
  v51 = sub_10000EDD8((uint64_t)v18, &qword_10001E1D0);
  v52 = v81;
  BorderedProminentButtonStyle.init()(v51);
  v53 = sub_10000EA08();
  v54 = sub_10000D958(&qword_10001E1A0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v55 = v83;
  View.buttonStyle<A>(_:)(v52, v49, v83, v53, v54);
  (*(void (**)(_BYTE *, uint64_t))(v82 + 8))(v52, v55);
  v56 = sub_10000EDD8((uint64_t)v20, &qword_10001E1D8);
  v57 = v84;
  static ButtonBorderShape.capsule.getter(v56);
  v58 = swift_getKeyPath(&unk_100011438);
  v59 = (uint64_t *)&v25[*(int *)(v76 + 36)];
  v60 = sub_1000057A0(&qword_10001E1A8);
  v61 = v85;
  v62 = v86;
  (*(void (**)(char *, _BYTE *, uint64_t))(v85 + 16))((char *)v59 + *(int *)(v60 + 28), v57, v86);
  *v59 = v58;
  v63 = v78;
  v64 = v79;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v78 + 16))(v25, v22, v79);
  (*(void (**)(_BYTE *, uint64_t))(v61 + 8))(v57, v62);
  v65 = (*(uint64_t (**)(_BYTE *, uint64_t))(v63 + 8))(v22, v64);
  v66 = static AnyTransition.opacity.getter(v65);
  v67 = static Animation.easeInOut(duration:)(a5);
  v68 = AnyTransition.animation(_:)(v67, v66);
  swift_release(v66);
  swift_release(v67);
  v69 = v87;
  sub_10000ECA0((uint64_t)v25, v87, &qword_10001E1E8);
  *(_QWORD *)(v69 + *(int *)(sub_1000057A0(&qword_10001E008) + 36)) = v68;
  return sub_10000EDD8((uint64_t)v25, &qword_10001E1E8);
}

uint64_t sub_10000A5FC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  double v36;
  double v37;
  double v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned int v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _OWORD v52[7];

  v20 = a19;
  v21 = a18;
  v22 = a17;
  v24 = a14;
  v23 = a15;
  v25 = a12;
  v26 = a10;
  v27 = a2 & 1;
  v28 = a1;
  if ((_DWORD)v27)
    v28 = -INFINITY;
  v29 = a4 & 1;
  v30 = a3;
  if ((_DWORD)v29)
    v30 = v28;
  v31 = a6 & 1;
  v32 = a8 & 1;
  v33 = a13 & 1;
  v34 = a5;
  if ((a6 & 1) != 0)
    v34 = v30;
  if (v28 > v30 || v30 > v34)
    goto LABEL_22;
  v36 = a7;
  if ((a8 & 1) != 0)
    v36 = -INFINITY;
  v37 = a10;
  if ((a11 & 1) != 0)
    v37 = v36;
  v38 = a12;
  if ((a13 & 1) != 0)
    v38 = v37;
  if (v36 > v37 || v37 > v38)
  {
LABEL_22:
    v50 = a7;
    v51 = a5;
    v48 = a1;
    v49 = a3;
    v47 = v27;
    v46 = v29;
    v40 = static os_log_type_t.fault.getter();
    v41 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v33 = a13 & 1;
    v29 = v46;
    v24 = a14;
    v23 = a15;
    v27 = v47;
    v26 = a10;
    v25 = a12;
    a1 = v48;
    a3 = v49;
    a7 = v50;
    a5 = v51;
    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v52, *(_QWORD *)&a1, v27, *(_QWORD *)&a3, v29, *(_QWORD *)&a5, v31, *(_QWORD *)&a7, v32, *(_QWORD *)&v26, a11 & 1, *(_QWORD *)&v25, v33, v24, v23);
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  v42 = v52[5];
  *(_OWORD *)(a9 + 96) = v52[4];
  *(_OWORD *)(a9 + 112) = v42;
  *(_OWORD *)(a9 + 128) = v52[6];
  v43 = v52[1];
  *(_OWORD *)(a9 + 32) = v52[0];
  *(_OWORD *)(a9 + 48) = v43;
  v44 = v52[3];
  *(_OWORD *)(a9 + 64) = v52[2];
  *(_OWORD *)(a9 + 80) = v44;
  sub_10000DDD4(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain(v20);
}

id sub_10000A7DC()
{
  return objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "init");
}

id sub_10000A800(void *a1)
{
  _QWORD *v1;

  return objc_msgSend(a1, "setEffect:", *v1);
}

uint64_t sub_10000A810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000F084();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000A860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000F084();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000A8B0()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000A8C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F084();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

void sub_10000A8EC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v4 = sub_1000057A0(&qword_10001DFC8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v15 - v8;
  v10 = objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 9);
  v11 = static Edge.Set.all.getter();
  *(_QWORD *)v9 = static VerticalAlignment.center.getter();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v12 = sub_1000057A0(&qword_10001DFD0);
  sub_10000AA38(a1, (uint64_t)&v9[*(int *)(v12 + 44)]);
  sub_10000ECA0((uint64_t)v9, (uint64_t)v7, &qword_10001DFC8);
  *(_QWORD *)a2 = v10;
  *(_BYTE *)(a2 + 8) = v11;
  v13 = sub_1000057A0(&qword_10001DFD8);
  sub_10000ECA0((uint64_t)v7, a2 + *(int *)(v13 + 48), &qword_10001DFC8);
  v14 = v10;
  sub_10000EDD8((uint64_t)v9, &qword_10001DFC8);
  sub_10000EDD8((uint64_t)v7, &qword_10001DFC8);

}

uint64_t sub_10000AA38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v4 = sub_1000057A0(&qword_10001DFE0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v15 - v9;
  *(_QWORD *)v10 = static HorizontalAlignment.center.getter(v8);
  *((_QWORD *)v10 + 1) = 0x4032000000000000;
  v10[16] = 0;
  v11 = sub_1000057A0(&qword_10001DFE8);
  sub_10000AB58(a1, (uint64_t)&v10[*(int *)(v11 + 44)]);
  sub_10000ECA0((uint64_t)v10, (uint64_t)v7, &qword_10001DFE0);
  *(_QWORD *)a2 = 0x4040000000000000;
  *(_BYTE *)(a2 + 8) = 0;
  v12 = sub_1000057A0(&qword_10001DFF0);
  sub_10000ECA0((uint64_t)v7, a2 + *(int *)(v12 + 48), &qword_10001DFE0);
  v13 = a2 + *(int *)(v12 + 64);
  *(_QWORD *)v13 = 0x4040000000000000;
  *(_BYTE *)(v13 + 8) = 0;
  sub_10000EDD8((uint64_t)v10, &qword_10001DFE0);
  return sub_10000EDD8((uint64_t)v7, &qword_10001DFE0);
}

uint64_t sub_10000AB58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t KeyPath;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _OWORD *v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  char v121;
  char v122;
  char v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  double v127;
  _QWORD *v128;
  double v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD *v133;
  char v134;
  char v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  uint64_t v147;
  uint64_t v148;
  __int128 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  char v157;
  uint64_t v158;
  char v159;
  unsigned __int8 v160;
  uint64_t v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  double v165;
  uint64_t v166;
  _QWORD *v167;
  char v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t v182;
  int *v183;
  uint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _OWORD *v197;
  uint64_t v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _OWORD *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  _OWORD *v224;
  __int128 v225;
  uint64_t v226;
  __int128 v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  __int128 v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char v238;
  char v239;
  char v240;
  char v241;
  uint64_t v242;
  char v243;
  uint64_t v244;
  uint64_t v245;
  double v246;
  _QWORD *v247;
  double v248;
  double v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  char v253;
  char v254;
  char v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  __int128 v261;
  uint64_t v262;
  uint64_t v263;
  __int128 v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  char v271;
  char v272;
  uint64_t v273;
  uint64_t v274;
  char v275;
  uint64_t v276;
  char v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  double v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  unint64_t v287;
  char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  int *v293;
  uint64_t v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  uint64_t v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v329;
  id v330;
  id v331;
  char *v332;
  char *v333;
  char *v334;
  id v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  char *v346;
  __int128 v347;
  uint64_t v348;
  char *v349;
  uint64_t v350;
  __int128 v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  __int128 v357;
  uint64_t v358;
  uint64_t v359;
  __int128 v360;
  uint64_t v361;
  uint64_t v362;
  __int128 v363;
  uint64_t v364;
  uint64_t v365;
  unint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  __int128 v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  char *v378;
  uint64_t v379;
  uint64_t v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  unsigned __int8 v403;
  char v404;
  __int128 v405;
  _OWORD v406[2];
  __int128 v407;
  _OWORD v408[2];
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  _OWORD v457[2];
  __int128 v458;
  _OWORD v459[2];
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  uint64_t v467;
  uint64_t v468;
  char v469;
  __int128 v470;
  uint64_t v471;
  unsigned __int8 v472;
  uint64_t v473;
  unsigned __int8 v474;
  __int128 v475;
  unint64_t v476;
  uint64_t v477;
  uint64_t v478;
  char v479;
  char v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;

  v379 = a2;
  v380 = a1;
  v372 = sub_1000057A0(&qword_10001DFF8);
  __chkstk_darwin(v372);
  *(_QWORD *)&v357 = (char *)&v329 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v348 = sub_1000057A0(&qword_10001E000);
  *(_QWORD *)&v347 = *(_QWORD *)(v348 - 8);
  __chkstk_darwin(v348);
  v346 = (char *)&v329 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000057A0(&qword_10001E008);
  v5 = __chkstk_darwin(v4);
  v353 = (uint64_t)&v329 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v356 = (uint64_t)&v329 - v7;
  v8 = sub_1000057A0(&qword_10001E010);
  v9 = __chkstk_darwin(v8);
  v354 = (uint64_t)&v329 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v375 = (uint64_t)&v329 - v11;
  v369 = sub_1000057A0(&qword_10001E018);
  __chkstk_darwin(v369);
  v371 = (uint64_t)&v329 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v370 = sub_1000057A0(&qword_10001E020);
  __chkstk_darwin(v370);
  v359 = (uint64_t)&v329 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000057A0(&qword_10001E028);
  v350 = *(_QWORD *)(v14 - 8);
  *(_QWORD *)&v351 = v14;
  __chkstk_darwin(v14);
  v349 = (char *)&v329 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000057A0(&qword_10001E030);
  v17 = __chkstk_darwin(v16);
  v355 = (uint64_t)&v329 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v358 = (uint64_t)&v329 - v19;
  *(_QWORD *)&v373 = type metadata accessor for ShieldIntervention(0);
  v367 = *(_QWORD *)(v373 - 8);
  __chkstk_darwin(v373);
  v368 = v20;
  v376 = (uint64_t)&v329 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v363 = sub_1000057A0(&qword_10001E038);
  v345 = *(_QWORD *)(v363 - 8);
  __chkstk_darwin(v363);
  v361 = (uint64_t)&v329 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v337 = sub_1000057A0(&qword_10001E040);
  __chkstk_darwin(v337);
  v339 = (uint64_t)&v329 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v338 = sub_1000057A0(&qword_10001E048);
  __chkstk_darwin(v338);
  v342 = (uint64_t)&v329 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v374 = sub_1000057A0(&qword_10001E050);
  v362 = *(_QWORD *)(v374 - 8);
  v24 = __chkstk_darwin(v374);
  v341 = (uint64_t)&v329 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v340 = (uint64_t)&v329 - v26;
  v27 = sub_1000057A0(&qword_10001DE58);
  v28 = __chkstk_darwin(v27);
  v343 = (uint64_t)&v329 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v344 = (uint64_t)&v329 - v30;
  v31 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v365 = *(uint64_t *)(v31 - 8);
  v366 = v31;
  v32 = __chkstk_darwin(v31);
  v336 = (uint64_t)&v329 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  *(_QWORD *)&v360 = (char *)&v329 - v34;
  v35 = sub_1000057A0(&qword_10001E058);
  v36 = __chkstk_darwin(v35);
  v352 = (uint64_t)&v329 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  v377 = (uint64_t)&v329 - v38;
  v39 = sub_1000057A0(&qword_10001E060);
  v40 = __chkstk_darwin(v39);
  v42 = (char *)&v329 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  v44 = (char *)&v329 - v43;
  v45 = sub_1000057A0(&qword_10001E068);
  v46 = __chkstk_darwin(v45);
  v378 = (char *)&v329 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v46);
  v49 = (char *)&v329 - v48;
  v50 = (void *)objc_opt_self(UIDevice);
  v51 = objc_msgSend(v50, "currentDevice");
  v335 = objc_msgSend(v51, "userInterfaceIdiom");

  v52 = objc_msgSend(v50, "currentDevice");
  v53 = objc_msgSend(v52, "userInterfaceIdiom");

  v54 = objc_msgSend(v50, "currentDevice");
  v55 = objc_msgSend(v54, "userInterfaceIdiom");

  v56 = objc_msgSend(v50, "currentDevice");
  v57 = objc_msgSend(v56, "userInterfaceIdiom");

  v58 = v380;
  v59 = *(_QWORD *)(v380 + 24);
  LOBYTE(v456) = *(_BYTE *)(v380 + 16);
  *((_QWORD *)&v456 + 1) = v59;
  v60 = sub_1000057A0(&qword_10001DFC0);
  State.wrappedValue.getter(&v443, v60);
  if (v443 == 1)
  {
    v330 = v57;
    v331 = v53;
    v61 = v373;
    v364 = v60;
    v62 = v377;
    v332 = v44;
    v333 = v42;
    v334 = v49;
    v63 = v58;
    v64 = *(_QWORD *)(v58 + 72);
    KeyPath = swift_getKeyPath(&unk_1000112C0);
    v66 = swift_getKeyPath(&unk_1000112E8);
    v67 = swift_retain(v64);
    static Published.subscript.getter(&v456, v67, KeyPath, v66);
    swift_release(v64);
    swift_release(KeyPath);
    swift_release(v66);
    if (v456 == 1)
    {
      v68 = v344;
      sub_10000ECA0(v63 + *(int *)(v61 + 40), v344, &qword_10001DE58);
      v69 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v365 + 48))(v68, 1, v366);
      v70 = v62;
      v71 = v374;
      v72 = v362;
      if (v69 == 1)
      {
        sub_10000EDD8(v68, &qword_10001DE58);
        v73 = 1;
        v74 = v364;
      }
      else
      {
        v84 = v360;
        v85 = sub_10000E010(v68, v360, type metadata accessor for VideoPlayerUIViewWrapper);
        if (v331 == (id)1)
          v86 = 0x405E500000000000;
        else
          v86 = 0x4058400000000000;
        if (v335 == (id)1)
          v87 = 0x405E500000000000;
        else
          v87 = 0x4058400000000000;
        v88 = static Alignment.center.getter(v85);
        _FrameLayout.init(width:height:alignment:)(&v481, v86, 0, v87, 0, v88, v89);
        v90 = v361;
        v91 = sub_10000E054(v84, v361, type metadata accessor for VideoPlayerUIViewWrapper);
        v92 = (_OWORD *)(v90 + *(int *)(v363 + 36));
        v93 = v482;
        *v92 = v481;
        v92[1] = v93;
        v92[2] = v483;
        v94 = static AnyTransition.opacity.getter(v91);
        v95 = static Animation.easeOut(duration:)(0.4);
        v96 = AnyTransition.animation(_:)(v95, v94);
        swift_release(v94);
        swift_release(v95);
        v97 = v339;
        sub_10000ECA0(v90, v339, &qword_10001E038);
        *(_QWORD *)(v97 + *(int *)(v337 + 36)) = v96;
        sub_10000EDD8(v90, &qword_10001E038);
        v98 = *(_QWORD *)(v63 + 40);
        LOBYTE(v456) = *(_BYTE *)(v63 + 32);
        *((_QWORD *)&v456 + 1) = v98;
        v74 = v364;
        State.wrappedValue.getter(&v443, v364);
        if ((_BYTE)v443)
          v99 = 1.0;
        else
          v99 = 0.1;
        v100 = v342;
        sub_10000ECA0(v97, v342, &qword_10001E040);
        *(double *)(v100 + *(int *)(v338 + 36)) = v99;
        sub_10000EDD8(v97, &qword_10001E040);
        v101 = static Animation.spring(response:dampingFraction:blendDuration:)(1.1, 0.8, 0.0);
        v102 = *(_QWORD *)(v63 + 40);
        LOBYTE(v456) = *(_BYTE *)(v63 + 32);
        *((_QWORD *)&v456 + 1) = v102;
        State.wrappedValue.getter(&v443, v74);
        v103 = v443;
        v104 = v341;
        sub_10000ECA0(v100, v341, &qword_10001E048);
        v105 = v104 + *(int *)(v374 + 36);
        *(_QWORD *)v105 = v101;
        *(_BYTE *)(v105 + 8) = v103;
        v106 = v100;
        v72 = v362;
        sub_10000EDD8(v106, &qword_10001E048);
        sub_10000891C(v360);
        v107 = v340;
        sub_10000E594(v104, v340, &qword_10001E050);
        v71 = v374;
        sub_10000E594(v107, v70, &qword_10001E050);
        v73 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56))(v70, v73, 1, v71);
      v108 = *(_QWORD *)(v63 + 8);
      *(_QWORD *)&v443 = *(_QWORD *)v63;
      *((_QWORD *)&v443 + 1) = v108;
      v375 = sub_1000057A0(&qword_10001E080);
      State.projectedValue.getter(&v456);
      v109 = v456;
      v110 = *(_QWORD *)&v457[0];
      v111 = v63;
      v112 = swift_getKeyPath(&unk_100011358);
      v443 = v109;
      *(_QWORD *)&v444 = v110;
      v374 = sub_1000057A0(&qword_10001E088);
      Binding.subscript.getter(&v456, v112, v374);
      swift_release(v110);
      swift_release(*((_QWORD *)&v109 + 1));
      swift_release(v112);
      swift_release(v109);
      v113 = v456;
      v114 = *((_QWORD *)&v457[0] + 1);
      v443 = v456;
      v444 = v457[0];
      *(_QWORD *)&v373 = sub_1000057A0(&qword_10001E090);
      Binding.wrappedValue.getter(&v412);
      swift_bridgeObjectRelease(v114);
      swift_release(*((_QWORD *)&v113 + 1));
      swift_release(v113);
      v443 = v412;
      v366 = sub_10000DAD4();
      v115 = Text.init<A>(_:)(&v443, &type metadata for String, v366);
      v117 = v116;
      v119 = v118;
      v121 = v120 & 1;
      sub_100009400(v115, v116, v120 & 1, v118, (uint64_t)&v456);
      sub_10000DB18(v115, v117, v121);
      swift_bridgeObjectRelease(v119);
      v348 = *((_QWORD *)&v456 + 1);
      v122 = v457[0];
      v123 = v458;
      v361 = *((_QWORD *)&v458 + 1);
      v362 = *((_QWORD *)&v457[1] + 1);
      LODWORD(v360) = LOBYTE(v459[0]);
      v357 = *(_OWORD *)((char *)v459 + 8);
      v356 = *((_QWORD *)&v459[1] + 1);
      v353 = v456;
      v124 = *((_QWORD *)&v460 + 1);
      v354 = v460;
      v125 = *(_BYTE *)(v111 + 32);
      v126 = *(_QWORD *)(v111 + 40);
      LOBYTE(v443) = v125;
      *((_QWORD *)&v443 + 1) = v126;
      State.wrappedValue.getter(&v412, v74);
      *(double *)&v365 = 0.1;
      if ((_BYTE)v412)
        v127 = 1.0;
      else
        v127 = 0.1;
      v347 = *(_OWORD *)((char *)v457 + 8);
      LOBYTE(v456) = v125;
      *((_QWORD *)&v456 + 1) = v126;
      v128 = State.wrappedValue.getter(&v443, v74);
      if ((_BYTE)v443)
        v129 = 1.0;
      else
        v129 = 0.8;
      v130 = static UnitPoint.center.getter(v128);
      v132 = v131;
      v480 = v122;
      v479 = v123;
      v346 = (char *)static Animation.spring(response:dampingFraction:blendDuration:)(1.1, 0.8, 0.0);
      LOBYTE(v456) = v125;
      *((_QWORD *)&v456 + 1) = v126;
      v133 = State.wrappedValue.getter(&v443, v74);
      v134 = v443;
      v135 = v480;
      v136 = v479;
      v137 = static AnyTransition.opacity.getter(v133);
      v138 = static Animation.easeOut(duration:)(0.4);
      v139 = AnyTransition.animation(_:)(v138, v137);
      swift_release(v137);
      swift_release(v138);
      v140 = v376;
      sub_10000E054(v111, v376, type metadata accessor for ShieldIntervention);
      v141 = *(unsigned __int8 *)(v367 + 80);
      v367 = (v141 + 16) & ~v141;
      v368 += v367;
      v142 = v367;
      *(_QWORD *)&v363 = v141 | 7;
      v143 = swift_allocObject(&unk_1000190E0, v368, v141 | 7);
      sub_10000E010(v140, v143 + v142, type metadata accessor for ShieldIntervention);
      *(_QWORD *)&v456 = v353;
      *((_QWORD *)&v456 + 1) = v348;
      LOBYTE(v457[0]) = v135;
      *(_OWORD *)((char *)v457 + 8) = v347;
      *((_QWORD *)&v457[1] + 1) = v362;
      LOBYTE(v458) = v136;
      *((_QWORD *)&v458 + 1) = v361;
      LOBYTE(v459[0]) = v360;
      *(_OWORD *)((char *)v459 + 8) = v357;
      *((_QWORD *)&v459[1] + 1) = v356;
      *(_QWORD *)&v460 = v354;
      *((_QWORD *)&v460 + 1) = v124;
      *(double *)&v461 = v127;
      *((double *)&v461 + 1) = v129;
      *(double *)&v462 = v129;
      *((double *)&v462 + 1) = v130;
      *(_QWORD *)&v463 = v132;
      *((_QWORD *)&v463 + 1) = v346;
      LOBYTE(v464) = v134;
      *((_QWORD *)&v464 + 1) = v139;
      *(_QWORD *)&v465 = sub_10000E0E4;
      *((_QWORD *)&v465 + 1) = v143;
      v466 = 0uLL;
      v144 = *(_QWORD *)(v111 + 8);
      v145 = v111;
      *(_QWORD *)&v412 = *(_QWORD *)v111;
      *((_QWORD *)&v412 + 1) = v144;
      State.projectedValue.getter(&v443);
      v146 = v443;
      v147 = v444;
      v148 = swift_getKeyPath(&unk_100011380);
      v412 = v146;
      *(_QWORD *)&v413 = v147;
      Binding.subscript.getter(&v443, v148, v374);
      swift_release(v147);
      swift_release(*((_QWORD *)&v146 + 1));
      swift_release(v148);
      swift_release(v146);
      v149 = v443;
      v150 = *((_QWORD *)&v444 + 1);
      v412 = v443;
      v413 = v444;
      Binding.wrappedValue.getter(&v390);
      swift_bridgeObjectRelease(v150);
      swift_release(*((_QWORD *)&v149 + 1));
      swift_release(v149);
      v412 = v390;
      v151 = Text.init<A>(_:)(&v412, &type metadata for String, v366);
      v153 = v152;
      v155 = v154;
      v157 = v156 & 1;
      sub_1000095E8(v151, v152, v156 & 1, v154, (uint64_t)&v467);
      sub_10000DB18(v151, v153, v157);
      swift_bridgeObjectRelease(v155);
      *(_QWORD *)&v360 = v467;
      v158 = v468;
      v159 = v469;
      v160 = v472;
      v375 = v473;
      LODWORD(v374) = v474;
      v373 = v475;
      v366 = v476;
      v361 = v471;
      v362 = v477;
      v161 = v478;
      v162 = *(_BYTE *)(v145 + 32);
      v163 = *(_QWORD *)(v145 + 40);
      LOBYTE(v443) = v162;
      *((_QWORD *)&v443 + 1) = v163;
      v164 = v364;
      State.wrappedValue.getter(&v412, v364);
      if ((_BYTE)v412)
        v165 = 1.0;
      else
        v165 = *(double *)&v365;
      v166 = static Animation.spring(response:dampingFraction:blendDuration:)(1.1, 0.8, 0.0);
      LOBYTE(v443) = v162;
      *((_QWORD *)&v443 + 1) = v163;
      v167 = State.wrappedValue.getter(&v412, v164);
      v168 = v412;
      v404 = v159;
      v403 = v160;
      v169 = static AnyTransition.opacity.getter(v167);
      v170 = static Animation.easeOut(duration:)(0.4);
      v171 = AnyTransition.animation(_:)(v170, v169);
      swift_release(v169);
      swift_release(v170);
      *(_QWORD *)&v405 = v360;
      *((_QWORD *)&v405 + 1) = v158;
      LOBYTE(v406[0]) = v404;
      *(_OWORD *)((char *)v406 + 8) = v470;
      *((_QWORD *)&v406[1] + 1) = v361;
      LOBYTE(v407) = v403;
      v172 = v376;
      *((_QWORD *)&v407 + 1) = v375;
      LOBYTE(v408[0]) = v374;
      *(_OWORD *)((char *)v408 + 8) = v373;
      *((_QWORD *)&v408[1] + 1) = v366;
      *(_QWORD *)&v409 = v362;
      *((_QWORD *)&v409 + 1) = v161;
      *(double *)&v410 = v165;
      *((_QWORD *)&v410 + 1) = v166;
      LOBYTE(v411) = v168;
      *((_QWORD *)&v411 + 1) = v171;
      sub_10000E054(v145, v376, type metadata accessor for ShieldIntervention);
      v173 = swift_allocObject(&unk_100019108, v368, v363);
      v174 = sub_10000E010(v172, v173 + v367, type metadata accessor for ShieldIntervention);
      __chkstk_darwin(v174);
      *(&v329 - 4) = v145;
      *(_OWORD *)(&v329 - 3) = xmmword_100011070;
      v175 = sub_1000057A0(&qword_10001E0F0);
      v176 = sub_10000E18C();
      v177 = v349;
      Button.init(action:label:)(sub_10000DC08, v173, sub_10000E180, &v329 - 6, v175, v176);
      v178 = v355;
      sub_1000097BC(1, v355, 135.0, 50.0, 0.4);
      (*(void (**)(char *, _QWORD))(v350 + 8))(v177, v351);
      v179 = v358;
      sub_10000E594(v178, v358, &qword_10001E030);
      v180 = &qword_10001E058;
      v181 = v352;
      sub_10000ECA0(v377, v352, &qword_10001E058);
      v400 = v464;
      v401 = v465;
      v402 = v466;
      v396 = v460;
      v397 = v461;
      v398 = v462;
      v399 = v463;
      v392 = v457[1];
      v393 = v458;
      v394 = v459[0];
      v395 = v459[1];
      v390 = v456;
      v391 = v457[0];
      v387 = v409;
      v388 = v410;
      v389 = v411;
      v383 = v406[1];
      v384 = v407;
      v385 = v408[0];
      v386 = v408[1];
      v381 = v405;
      v382 = v406[0];
      sub_10000ECA0(v179, v178, &qword_10001E030);
      v182 = v359;
      sub_10000ECA0(v181, v359, &qword_10001E058);
      v183 = (int *)sub_1000057A0(&qword_10001E110);
      v184 = v183[12];
      v186 = v400;
      v185 = v401;
      v422 = v400;
      v423 = v401;
      v187 = v402;
      v424 = v402;
      v189 = v396;
      v188 = v397;
      v418 = v396;
      v419 = v397;
      v190 = v398;
      v191 = v399;
      v421 = v399;
      v420 = v398;
      v192 = v394;
      v193 = v395;
      v417 = v395;
      v416 = v394;
      v194 = v393;
      v415 = v393;
      v414 = v392;
      v196 = v390;
      v195 = v391;
      v412 = v390;
      v413 = v391;
      v197 = (_OWORD *)(v182 + v184);
      v197[2] = v392;
      v197[3] = v194;
      v197[6] = v189;
      v197[7] = v188;
      v197[4] = v192;
      v197[5] = v193;
      v197[11] = v185;
      v197[12] = v187;
      v197[9] = v191;
      v197[10] = v186;
      v197[8] = v190;
      *v197 = v196;
      v197[1] = v195;
      v198 = v183[16];
      v199 = v388;
      v431 = v387;
      v432 = v388;
      v200 = v389;
      v433 = v389;
      v201 = v383;
      v202 = v384;
      v427 = v383;
      v428 = v384;
      v204 = v385;
      v203 = v386;
      v430 = v386;
      v429 = v385;
      v205 = (_OWORD *)(v182 + v198);
      v205[6] = v387;
      v205[7] = v199;
      v205[8] = v200;
      v205[2] = v201;
      v205[3] = v202;
      v207 = v381;
      v206 = v382;
      v209 = v381;
      v208 = v382;
      v205[4] = v204;
      v205[5] = v203;
      *v205 = v209;
      v205[1] = v208;
      v210 = v182 + v183[20];
      *(_QWORD *)v210 = 0;
      *(_BYTE *)(v210 + 8) = 1;
      *(_QWORD *)(v210 + 16) = 0x3FF0000000000000;
      v211 = v182 + v183[24];
      v426 = v206;
      v425 = v207;
      sub_10000ECA0(v178, v211, &qword_10001E030);
      sub_10000E27C((uint64_t)&v412);
      sub_10000E358((uint64_t)&v425);
      sub_10000E27C((uint64_t)&v456);
      sub_10000E358((uint64_t)&v405);
      sub_10000EDD8(v178, &qword_10001E030);
      v440 = v387;
      v441 = v388;
      v442 = v389;
      v436 = v383;
      v437 = v384;
      v439 = v386;
      v438 = v385;
      v435 = v382;
      v434 = v381;
      sub_10000E408((uint64_t)&v434);
      v453 = v400;
      v454 = v401;
      v455 = v402;
      v449 = v396;
      v450 = v397;
      v452 = v399;
      v451 = v398;
      v445 = v392;
      v446 = v393;
      v448 = v395;
      v447 = v394;
      v444 = v391;
      v443 = v390;
      sub_10000E4B8((uint64_t)&v443);
      sub_10000EDD8(v181, &qword_10001E058);
      v212 = v371;
      sub_10000ECA0(v182, v371, &qword_10001E020);
      swift_storeEnumTagMultiPayload(v212, v369, 0);
      v213 = sub_10000EFFC(&qword_10001E0D8, &qword_10001E020, (uint64_t)&protocol conformance descriptor for TupleView<A>);
      v214 = sub_10000EFFC(&qword_10001E0E0, &qword_10001DFF8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
      v215 = (uint64_t)v332;
      _ConditionalContent<>.init(storage:)(v212, v370, v372, v213, v214);
      sub_10000EDD8(v182, &qword_10001E020);
      sub_10000EDD8(v179, &qword_10001E030);
      sub_10000E408((uint64_t)&v405);
      sub_10000E4B8((uint64_t)&v456);
      v216 = v377;
    }
    else
    {
      v78 = v343;
      sub_10000ECA0(v63 + *(int *)(v61 + 44), v343, &qword_10001DE58);
      v79 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v365 + 48))(v78, 1, v366);
      v80 = v375;
      v81 = v363;
      v82 = v345;
      if (v79 == 1)
      {
        sub_10000EDD8(v78, &qword_10001DE58);
        v83 = 1;
      }
      else
      {
        v217 = v336;
        v218 = sub_10000E010(v78, v336, type metadata accessor for VideoPlayerUIViewWrapper);
        if (v330 == (id)1)
          v219 = 0x405AACCCCCCCCCCDLL;
        else
          v219 = 0x4058400000000000;
        if (v55 == (id)1)
          v220 = 0x405AACCCCCCCCCCDLL;
        else
          v220 = 0x4058400000000000;
        v221 = static Alignment.center.getter(v218);
        _FrameLayout.init(width:height:alignment:)(&v481, v219, 0, v220, 0, v221, v222);
        v223 = v361;
        sub_10000E054(v217, v361, type metadata accessor for VideoPlayerUIViewWrapper);
        v224 = (_OWORD *)(v223 + *(int *)(v81 + 36));
        v225 = v482;
        *v224 = v481;
        v224[1] = v225;
        v224[2] = v483;
        sub_10000891C(v217);
        sub_10000E594(v223, v80, &qword_10001E038);
        v83 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56))(v80, v83, 1, v81);
      v226 = *(_QWORD *)(v63 + 8);
      *(_QWORD *)&v443 = *(_QWORD *)v63;
      *((_QWORD *)&v443 + 1) = v226;
      v377 = sub_1000057A0(&qword_10001E080);
      State.projectedValue.getter(&v456);
      v227 = v456;
      v228 = *(_QWORD *)&v457[0];
      v229 = v63;
      v230 = swift_getKeyPath(&unk_100011308);
      v443 = v227;
      *(_QWORD *)&v444 = v228;
      v374 = sub_1000057A0(&qword_10001E088);
      Binding.subscript.getter(&v456, v230, v374);
      swift_release(v228);
      swift_release(*((_QWORD *)&v227 + 1));
      swift_release(v230);
      swift_release(v227);
      v231 = v456;
      v232 = *((_QWORD *)&v457[0] + 1);
      v443 = v456;
      v444 = v457[0];
      *(_QWORD *)&v373 = sub_1000057A0(&qword_10001E090);
      Binding.wrappedValue.getter(&v412);
      swift_bridgeObjectRelease(v232);
      swift_release(*((_QWORD *)&v231 + 1));
      swift_release(v231);
      v443 = v412;
      v366 = sub_10000DAD4();
      v233 = Text.init<A>(_:)(&v443, &type metadata for String, v366);
      v235 = v234;
      v237 = v236;
      v239 = v238 & 1;
      sub_100009400(v233, v234, v238 & 1, v236, (uint64_t)&v456);
      sub_10000DB18(v233, v235, v239);
      swift_bridgeObjectRelease(v237);
      v352 = *((_QWORD *)&v456 + 1);
      v355 = v456;
      v240 = v457[0];
      v241 = v458;
      v362 = *((_QWORD *)&v458 + 1);
      *(_QWORD *)&v363 = *((_QWORD *)&v457[1] + 1);
      LODWORD(v361) = LOBYTE(v459[0]);
      v360 = *(_OWORD *)((char *)v459 + 8);
      v358 = v460;
      v359 = *((_QWORD *)&v459[1] + 1);
      v242 = *((_QWORD *)&v460 + 1);
      v243 = *(_BYTE *)(v229 + 48);
      v244 = *(_QWORD *)(v229 + 56);
      LOBYTE(v443) = v243;
      *((_QWORD *)&v443 + 1) = v244;
      v245 = v364;
      State.wrappedValue.getter(&v412, v364);
      v351 = *(_OWORD *)((char *)v457 + 8);
      if ((_BYTE)v412)
        v246 = 1.0;
      else
        v246 = 0.0;
      LOBYTE(v456) = v243;
      *((_QWORD *)&v456 + 1) = v244;
      v247 = State.wrappedValue.getter(&v443, v245);
      if ((_BYTE)v443)
        v248 = 1.0;
      else
        v248 = 0.8;
      v249 = static UnitPoint.center.getter(v247);
      v251 = v250;
      v480 = v240;
      v479 = v241;
      v252 = static Animation.spring(response:dampingFraction:blendDuration:)(0.5, 0.8, 0.0);
      LOBYTE(v456) = v243;
      *((_QWORD *)&v456 + 1) = v244;
      State.wrappedValue.getter(&v443, v245);
      v253 = v443;
      v254 = v480;
      v255 = v479;
      v256 = v376;
      sub_10000E054(v229, v376, type metadata accessor for ShieldIntervention);
      v257 = *(unsigned __int8 *)(v367 + 80);
      v367 = (v257 + 16) & ~v257;
      v368 += v367;
      v258 = v367;
      v365 = v257 | 7;
      v259 = swift_allocObject(&unk_100019090, v368, v257 | 7);
      sub_10000E010(v256, v259 + v258, type metadata accessor for ShieldIntervention);
      *(_QWORD *)&v456 = v355;
      *((_QWORD *)&v456 + 1) = v352;
      LOBYTE(v457[0]) = v254;
      *(_OWORD *)((char *)v457 + 8) = v351;
      *((_QWORD *)&v457[1] + 1) = v363;
      LOBYTE(v458) = v255;
      *((_QWORD *)&v458 + 1) = v362;
      LOBYTE(v459[0]) = v361;
      *(_OWORD *)((char *)v459 + 8) = v360;
      *((_QWORD *)&v459[1] + 1) = v359;
      *(_QWORD *)&v460 = v358;
      *((_QWORD *)&v460 + 1) = v242;
      *(double *)&v461 = v246;
      *((double *)&v461 + 1) = v248;
      *(double *)&v462 = v248;
      *((double *)&v462 + 1) = v249;
      *(_QWORD *)&v463 = v251;
      *((_QWORD *)&v463 + 1) = v252;
      LOBYTE(v464) = v253;
      *((_QWORD *)&v464 + 1) = sub_10000DB2C;
      v465 = (unint64_t)v259;
      *(_QWORD *)&v466 = 0;
      v260 = *(_QWORD *)(v229 + 8);
      *(_QWORD *)&v412 = *(_QWORD *)v229;
      *((_QWORD *)&v412 + 1) = v260;
      State.projectedValue.getter(&v443);
      v261 = v443;
      v262 = v444;
      v263 = swift_getKeyPath(&unk_100011330);
      v412 = v261;
      *(_QWORD *)&v413 = v262;
      Binding.subscript.getter(&v443, v263, v374);
      swift_release(v262);
      swift_release(*((_QWORD *)&v261 + 1));
      swift_release(v263);
      swift_release(v261);
      v264 = v443;
      v265 = *((_QWORD *)&v444 + 1);
      v412 = v443;
      v413 = v444;
      Binding.wrappedValue.getter(&v390);
      swift_bridgeObjectRelease(v265);
      swift_release(*((_QWORD *)&v264 + 1));
      swift_release(v264);
      v412 = v390;
      v266 = Text.init<A>(_:)(&v412, &type metadata for String, v366);
      v268 = v267;
      v270 = v269;
      v272 = v271 & 1;
      sub_1000095E8(v266, v267, v271 & 1, v269, (uint64_t)&v467);
      sub_10000DB18(v266, v268, v272);
      swift_bridgeObjectRelease(v270);
      v273 = v467;
      v274 = v468;
      v275 = v469;
      v377 = v471;
      LODWORD(v374) = v472;
      *(_QWORD *)&v373 = v473;
      LODWORD(v366) = v474;
      v363 = v475;
      v361 = v477;
      v362 = v476;
      v276 = v478;
      v277 = *(_BYTE *)(v229 + 48);
      v278 = *(_QWORD *)(v229 + 56);
      v279 = v229;
      LOBYTE(v443) = v277;
      *((_QWORD *)&v443 + 1) = v278;
      v280 = v364;
      State.wrappedValue.getter(&v412, v364);
      if ((_BYTE)v412)
        v281 = 1.0;
      else
        v281 = 0.0;
      v282 = static Animation.spring(response:dampingFraction:blendDuration:)(0.5, 0.8, 0.0);
      LOBYTE(v443) = v277;
      *((_QWORD *)&v443 + 1) = v278;
      State.wrappedValue.getter(&v412, v280);
      *(_QWORD *)&v405 = v273;
      *((_QWORD *)&v405 + 1) = v274;
      LOBYTE(v406[0]) = v275;
      *(_OWORD *)((char *)v406 + 8) = v470;
      v283 = v376;
      *((_QWORD *)&v406[1] + 1) = v377;
      LOBYTE(v407) = v374;
      *((_QWORD *)&v407 + 1) = v373;
      LOBYTE(v408[0]) = v366;
      *(_OWORD *)((char *)v408 + 8) = v363;
      *((_QWORD *)&v408[1] + 1) = v362;
      *(_QWORD *)&v409 = v361;
      *((_QWORD *)&v409 + 1) = v276;
      *(double *)&v410 = v281;
      *((_QWORD *)&v410 + 1) = v282;
      LOBYTE(v411) = v412;
      sub_10000E054(v279, v376, type metadata accessor for ShieldIntervention);
      v284 = swift_allocObject(&unk_1000190B8, v368, v365);
      v285 = sub_10000E010(v283, v284 + v367, type metadata accessor for ShieldIntervention);
      __chkstk_darwin(v285);
      *(&v329 - 4) = v279;
      *(_OWORD *)(&v329 - 3) = xmmword_100011070;
      v286 = sub_1000057A0(&qword_10001E0A0);
      v287 = sub_10000DC18();
      v288 = v346;
      Button.init(action:label:)(sub_10000DC08, v284, sub_10000DC0C, &v329 - 6, v286, v287);
      v289 = v353;
      sub_100009EDC(0, v353, 135.0, 50.0, 0.4);
      (*(void (**)(char *, uint64_t))(v347 + 8))(v288, v348);
      v290 = v356;
      sub_10000E594(v289, v356, &qword_10001E008);
      v180 = &qword_10001E010;
      v291 = v354;
      sub_10000ECA0(v375, v354, &qword_10001E010);
      v400 = v464;
      v401 = v465;
      *(_QWORD *)&v402 = v466;
      v396 = v460;
      v397 = v461;
      v398 = v462;
      v399 = v463;
      v392 = v457[1];
      v393 = v458;
      v394 = v459[0];
      v395 = v459[1];
      v390 = v456;
      v391 = v457[0];
      v387 = v409;
      v388 = v410;
      LOBYTE(v389) = v411;
      v383 = v406[1];
      v384 = v407;
      v385 = v408[0];
      v386 = v408[1];
      v381 = v405;
      v382 = v406[0];
      sub_10000ECA0(v290, v289, &qword_10001E008);
      v292 = v357;
      sub_10000ECA0(v291, v357, &qword_10001E010);
      v293 = (int *)sub_1000057A0(&qword_10001E0D0);
      v294 = v293[12];
      v296 = v400;
      v295 = v401;
      v422 = v400;
      v423 = v401;
      v298 = v396;
      v297 = v397;
      v418 = v396;
      v419 = v397;
      v299 = v398;
      v300 = v399;
      v421 = v399;
      v420 = v398;
      v301 = v394;
      v302 = v395;
      v417 = v395;
      v416 = v394;
      v303 = v393;
      v415 = v393;
      v414 = v392;
      v305 = v390;
      v304 = v391;
      v412 = v390;
      v413 = v391;
      v306 = v292 + v294;
      *(_OWORD *)(v306 + 32) = v392;
      *(_OWORD *)(v306 + 48) = v303;
      *(_OWORD *)(v306 + 96) = v298;
      *(_OWORD *)(v306 + 112) = v297;
      v307 = v402;
      *(_QWORD *)&v424 = v402;
      *(_OWORD *)(v306 + 64) = v301;
      *(_OWORD *)(v306 + 80) = v302;
      *(_QWORD *)(v306 + 192) = v307;
      *(_OWORD *)(v306 + 160) = v296;
      *(_OWORD *)(v306 + 176) = v295;
      *(_OWORD *)(v306 + 128) = v299;
      *(_OWORD *)(v306 + 144) = v300;
      *(_OWORD *)v306 = v305;
      *(_OWORD *)(v306 + 16) = v304;
      v308 = v293[16];
      v309 = v388;
      v431 = v387;
      v432 = v388;
      v310 = v383;
      v311 = v384;
      v427 = v383;
      v428 = v384;
      v313 = v385;
      v312 = v386;
      v430 = v386;
      v429 = v385;
      v314 = v292 + v308;
      *(_OWORD *)(v314 + 96) = v387;
      *(_OWORD *)(v314 + 112) = v309;
      *(_OWORD *)(v314 + 32) = v310;
      *(_OWORD *)(v314 + 48) = v311;
      v316 = v381;
      v315 = v382;
      v318 = v381;
      v317 = v382;
      *(_OWORD *)(v314 + 64) = v313;
      *(_OWORD *)(v314 + 80) = v312;
      *(_OWORD *)v314 = v318;
      *(_OWORD *)(v314 + 16) = v317;
      LOBYTE(v433) = v389;
      *(_BYTE *)(v314 + 128) = v389;
      v319 = v292 + v293[20];
      *(_QWORD *)v319 = 0;
      *(_BYTE *)(v319 + 8) = 1;
      *(_QWORD *)(v319 + 16) = 0x3FF0000000000000;
      v320 = v292 + v293[24];
      v426 = v315;
      v425 = v316;
      sub_10000ECA0(v289, v320, &qword_10001E008);
      sub_10000DD00((uint64_t)&v412);
      sub_10000DDF4((uint64_t)&v425);
      sub_10000DD00((uint64_t)&v456);
      sub_10000DDF4((uint64_t)&v405);
      sub_10000EDD8(v289, &qword_10001E008);
      v440 = v387;
      v441 = v388;
      LOBYTE(v442) = v389;
      v436 = v383;
      v437 = v384;
      v439 = v386;
      v438 = v385;
      v435 = v382;
      v434 = v381;
      sub_10000DE98((uint64_t)&v434);
      v453 = v400;
      v454 = v401;
      *(_QWORD *)&v455 = v402;
      v449 = v396;
      v450 = v397;
      v452 = v399;
      v451 = v398;
      v445 = v392;
      v446 = v393;
      v448 = v395;
      v447 = v394;
      v444 = v391;
      v443 = v390;
      sub_10000DF3C((uint64_t)&v443);
      sub_10000EDD8(v291, &qword_10001E010);
      v321 = v371;
      sub_10000ECA0(v292, v371, &qword_10001DFF8);
      swift_storeEnumTagMultiPayload(v321, v369, 1);
      v322 = sub_10000EFFC(&qword_10001E0D8, &qword_10001E020, (uint64_t)&protocol conformance descriptor for TupleView<A>);
      v323 = sub_10000EFFC(&qword_10001E0E0, &qword_10001DFF8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
      v215 = (uint64_t)v332;
      _ConditionalContent<>.init(storage:)(v321, v370, v372, v322, v323);
      sub_10000EDD8(v292, &qword_10001DFF8);
      sub_10000EDD8(v290, &qword_10001E008);
      sub_10000DE98((uint64_t)&v405);
      sub_10000DF3C((uint64_t)&v456);
      v216 = v375;
    }
    sub_10000EDD8(v216, v180);
    v77 = (uint64_t)v378;
    v76 = v379;
    v324 = (uint64_t)v333;
    v49 = v334;
    sub_10000ECA0(v215, (uint64_t)v333, &qword_10001E060);
    sub_10000ECA0(v324, v77, &qword_10001E060);
    v325 = v77 + *(int *)(sub_1000057A0(&qword_10001E0E8) + 48);
    *(_QWORD *)v325 = 0;
    *(_BYTE *)(v325 + 8) = 1;
    sub_10000EDD8(v215, &qword_10001E060);
    sub_10000EDD8(v324, &qword_10001E060);
    v326 = sub_1000057A0(&qword_10001E070);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v326 - 8) + 56))(v77, 0, 1, v326);
    sub_10000E594(v77, (uint64_t)v49, &qword_10001E068);
  }
  else
  {
    v75 = sub_1000057A0(&qword_10001E070);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 56))(v49, 1, 1, v75);
    v77 = (uint64_t)v378;
    v76 = v379;
  }
  sub_10000ECA0((uint64_t)v49, v77, &qword_10001E068);
  *(_QWORD *)v76 = 0;
  *(_BYTE *)(v76 + 8) = 1;
  *(_QWORD *)(v76 + 16) = 0x3FF0000000000000;
  v327 = sub_1000057A0(&qword_10001E078);
  sub_10000ECA0(v77, v76 + *(int *)(v327 + 48), &qword_10001E068);
  sub_10000EDD8((uint64_t)v49, &qword_10001E068);
  return sub_10000EDD8(v77, &qword_10001E068);
}

uint64_t sub_10000CC00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[9];
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 40);
  v4[1] = *(_BYTE *)(a1 + 32);
  v5 = v1;
  v4[0] = 1;
  v2 = sub_1000057A0(&qword_10001DFC0);
  return State.wrappedValue.setter(v4, v2);
}

__n128 sub_10000CC54@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
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
  uint64_t KeyPath;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[9];
  __int128 v43;
  __n128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v8 = sub_1000057A0(&qword_10001E1B0);
  __chkstk_darwin(v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Font.TextStyle(0);
  v40 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[1];
  *(_QWORD *)&v43 = *a1;
  *((_QWORD *)&v43 + 1) = v14;
  v15 = sub_1000057A0(&qword_10001E080);
  State.wrappedValue.getter(v42, v15);
  v16 = *(_QWORD *)&v42[0];
  v17 = *(_QWORD *)(*(_QWORD *)&v42[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString);
  v18 = *(_QWORD *)(*(_QWORD *)&v42[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString + 8);
  swift_bridgeObjectRetain(v18);
  swift_release(v16);
  *(_QWORD *)&v43 = v17;
  *((_QWORD *)&v43 + 1) = v18;
  v19 = sub_10000DAD4();
  v20 = Text.init<A>(_:)(&v43, &type metadata for String, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25 & 1;
  v27 = static Alignment.center.getter(v20);
  sub_10000A5FC(a3, 0, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v42, 0.0, 1, a4, 0, v27, v28, v20, v22, v26, v24);
  sub_10000DB18(v20, v22, v26);
  swift_bridgeObjectRelease(v24);
  v49 = v42[6];
  v50 = v42[7];
  v51 = v42[8];
  v45 = v42[2];
  v46 = v42[3];
  v47 = v42[4];
  v48 = v42[5];
  v43 = v42[0];
  v44 = (__n128)v42[1];
  v30 = v40;
  v29 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v13, enum case for Font.TextStyle.body(_:), v41);
  v31 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v10, 1, 1, v31);
  v32 = static Font.system(_:design:weight:)(v13, v10, 0, 1);
  sub_10000EDD8((uint64_t)v10, &qword_10001E1B0);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v29);
  v33 = Font.bold()(v32);
  swift_release(v32);
  KeyPath = swift_getKeyPath(&unk_100011468);
  v35 = v50;
  *(_OWORD *)(a2 + 96) = v49;
  *(_OWORD *)(a2 + 112) = v35;
  *(_OWORD *)(a2 + 128) = v51;
  v36 = v46;
  *(_OWORD *)(a2 + 32) = v45;
  *(_OWORD *)(a2 + 48) = v36;
  v37 = v48;
  *(_OWORD *)(a2 + 64) = v47;
  *(_OWORD *)(a2 + 80) = v37;
  result = v44;
  *(_OWORD *)a2 = v43;
  *(__n128 *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 144) = 0x3FE0000000000000;
  *(_QWORD *)(a2 + 152) = KeyPath;
  *(_QWORD *)(a2 + 160) = v33;
  return result;
}

uint64_t sub_10000CF00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[9];
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 56);
  v4[1] = *(_BYTE *)(a1 + 48);
  v5 = v1;
  v4[0] = 1;
  v2 = sub_1000057A0(&qword_10001DFC0);
  return State.wrappedValue.setter(v4, v2);
}

uint64_t sub_10000CF54@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
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

uint64_t sub_10000CFCC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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

__n128 sub_10000D048@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
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
  uint64_t KeyPath;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[9];
  __int128 v43;
  __n128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v8 = sub_1000057A0(&qword_10001E1B0);
  __chkstk_darwin(v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Font.TextStyle(0);
  v40 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[1];
  *(_QWORD *)&v43 = *a1;
  *((_QWORD *)&v43 + 1) = v14;
  v15 = sub_1000057A0(&qword_10001E080);
  State.wrappedValue.getter(v42, v15);
  v16 = *(_QWORD *)&v42[0];
  v17 = *(_QWORD *)(*(_QWORD *)&v42[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString);
  v18 = *(_QWORD *)(*(_QWORD *)&v42[0] + OBJC_IVAR____TtC11EyeReliefUI19ShieldConfiguration_continueButtonTitleString + 8);
  swift_bridgeObjectRetain(v18);
  swift_release(v16);
  *(_QWORD *)&v43 = v17;
  *((_QWORD *)&v43 + 1) = v18;
  v19 = sub_10000DAD4();
  v20 = Text.init<A>(_:)(&v43, &type metadata for String, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25 & 1;
  v27 = static Alignment.center.getter(v20);
  sub_10000A5FC(a3, 0, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v42, 0.0, 1, a4, 0, v27, v28, v20, v22, v26, v24);
  sub_10000DB18(v20, v22, v26);
  swift_bridgeObjectRelease(v24);
  v49 = v42[6];
  v50 = v42[7];
  v51 = v42[8];
  v45 = v42[2];
  v46 = v42[3];
  v47 = v42[4];
  v48 = v42[5];
  v43 = v42[0];
  v44 = (__n128)v42[1];
  v30 = v40;
  v29 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v13, enum case for Font.TextStyle.body(_:), v41);
  v31 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v10, 1, 1, v31);
  v32 = static Font.system(_:design:weight:)(v13, v10, 0, 1);
  sub_10000EDD8((uint64_t)v10, &qword_10001E1B0);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v29);
  v33 = Font.bold()(v32);
  swift_release(v32);
  KeyPath = swift_getKeyPath(&unk_100011468);
  v35 = v50;
  *(_OWORD *)(a2 + 96) = v49;
  *(_OWORD *)(a2 + 112) = v35;
  *(_OWORD *)(a2 + 128) = v51;
  v36 = v46;
  *(_OWORD *)(a2 + 32) = v45;
  *(_OWORD *)(a2 + 48) = v36;
  v37 = v48;
  *(_OWORD *)(a2 + 64) = v47;
  *(_OWORD *)(a2 + 80) = v37;
  result = v44;
  *(_OWORD *)a2 = v43;
  *(__n128 *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 144) = KeyPath;
  *(_QWORD *)(a2 + 152) = v33;
  return result;
}

uint64_t sub_10000D2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[5];
  uint64_t v44;

  v37 = a3;
  v38 = a4;
  v34 = a2;
  v32 = a1;
  v39 = type metadata accessor for DispatchWorkItemFlags(0);
  v42 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v40 = *(_QWORD *)(v8 - 8);
  v41 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ShieldIntervention(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  v14 = type metadata accessor for DispatchTime(0);
  v15 = *(_QWORD *)(v14 - 8);
  v36 = v14;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v32 - v19;
  sub_10000D7C8();
  v33 = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v18, a5);
  v35 = *(void (**)(char *, uint64_t))(v15 + 8);
  v35(v18, v14);
  sub_10000E054(v32, (uint64_t)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ShieldIntervention);
  v21 = *(unsigned __int8 *)(v12 + 80);
  v22 = (v21 + 16) & ~v21;
  v23 = swift_allocObject(v34, v22 + v13, v21 | 7);
  sub_10000E010((uint64_t)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22, type metadata accessor for ShieldIntervention);
  aBlock[4] = v37;
  v44 = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006BF8;
  aBlock[3] = v38;
  v24 = _Block_copy(aBlock);
  swift_release(v44);
  static DispatchQoS.unspecified.getter(v25);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v26 = sub_10000D958((unint64_t *)&qword_10001DB48, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v27 = sub_1000057A0(&qword_10001DB50);
  v28 = sub_10000EFFC((unint64_t *)&qword_10001DB58, &qword_10001DB50, (uint64_t)&protocol conformance descriptor for [A]);
  v29 = v39;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v39, v26);
  v30 = (void *)v33;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v20, v10, v7, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v29);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v41);
  return ((uint64_t (*)(char *, uint64_t))v35)(v20, v36);
}

uint64_t sub_10000D5E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[9];
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 24);
  v4[1] = *(_BYTE *)(a1 + 16);
  v5 = v1;
  v4[0] = 1;
  v2 = sub_1000057A0(&qword_10001DFC0);
  return State.wrappedValue.setter(v4, v2);
}

uint64_t sub_10000D644@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (**v15)();
  uint64_t v17;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  v6 = sub_1000057A0(&qword_10001DFA8);
  v7 = __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v9 = static Alignment.center.getter(v7);
  v9[1] = v10;
  v11 = sub_1000057A0(&qword_10001DFB0);
  sub_10000A8EC(v2, (uint64_t)v9 + *(int *)(v11 + 44));
  sub_10000E054(v2, (uint64_t)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ShieldIntervention);
  v12 = *(unsigned __int8 *)(v4 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = swift_allocObject(&unk_100019018, v13 + v5, v12 | 7);
  sub_10000E010((uint64_t)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for ShieldIntervention);
  sub_10000ECA0((uint64_t)v9, a2, &qword_10001DFA8);
  v15 = (uint64_t (**)())(a2 + *(int *)(sub_1000057A0(&qword_10001DFB8) + 36));
  *v15 = sub_10000D7A8;
  v15[1] = (uint64_t (*)())v14;
  v15[2] = 0;
  v15[3] = 0;
  return sub_10000EDD8((uint64_t)v9, &qword_10001DFA8);
}

void *sub_10000D798()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000D7A8()
{
  return sub_10000DB54((uint64_t)&unk_100019040, (uint64_t)sub_10000D934, (uint64_t)&unk_100019058, 0.5);
}

unint64_t sub_10000D7C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001DB40;
  if (!qword_10001DB40)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001DB40);
  }
  return result;
}

uint64_t sub_10000D808()
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
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = type metadata accessor for ShieldIntervention(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v0 + v4;
  swift_release(*(_QWORD *)(v0 + v4));
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  swift_release(*(_QWORD *)(v0 + v4 + 24));
  swift_release(*(_QWORD *)(v0 + v4 + 40));
  swift_release(*(_QWORD *)(v0 + v4 + 56));
  swift_release(*(_QWORD *)(v0 + v4 + 72));
  if (*(_QWORD *)(v0 + v4 + 80))
    swift_release(*(_QWORD *)(v6 + 88));
  v7 = v6 + *(int *)(v1 + 40);
  v8 = type metadata accessor for VideoPlayerUIViewWrapper(0);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  if (!v9(v7, 1, v8))
  {
    v10 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v7, v10);
  }
  v11 = v6 + *(int *)(v1 + 44);
  if (!v9(v11, 1, v8))
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10000D934()
{
  return sub_10000ED9C(sub_10000D5E8);
}

uint64_t sub_10000D940(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D950(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000D958(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10000D998@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000112C0);
  v5 = swift_getKeyPath(&unk_1000112E8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000DA14(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000112C0);
  v5 = swift_getKeyPath(&unk_1000112E8);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10000DA8C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10000CF54(a1, (uint64_t)&unk_100011308, (uint64_t)&unk_100011558, a2);
}

uint64_t sub_10000DAB0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CFCC(a1, a2, a3, a4, (uint64_t)&unk_100011308, (uint64_t)&unk_100011558);
}

unint64_t sub_10000DAD4()
{
  unint64_t result;

  result = qword_10001E098;
  if (!qword_10001E098)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001E098);
  }
  return result;
}

uint64_t sub_10000DB18(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000DB2C()
{
  return sub_10000DB54((uint64_t)&unk_100019180, (uint64_t)sub_10000ED90, (uint64_t)&unk_100019198, 0.6);
}

uint64_t sub_10000DB54(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShieldIntervention(0) - 8) + 80);
  return sub_10000D2EC(v4 + ((v9 + 16) & ~v9), a1, a2, a3, a4);
}

uint64_t sub_10000DBBC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10000CF54(a1, (uint64_t)&unk_100011330, (uint64_t)&unk_100011538, a2);
}

uint64_t sub_10000DBE0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CFCC(a1, a2, a3, a4, (uint64_t)&unk_100011330, (uint64_t)&unk_100011538);
}

double sub_10000DC0C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_10000D048((_QWORD *)*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32)).n128_u64[0];
  return result;
}

unint64_t sub_10000DC18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E0A8;
  if (!qword_10001E0A8)
  {
    v1 = sub_10000690C(&qword_10001E0A0);
    sub_10000DC9C();
    sub_10000EFFC(&qword_10001E0C0, &qword_10001E0C8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E0A8);
  }
  return result;
}

unint64_t sub_10000DC9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E0B0;
  if (!qword_10001E0B0)
  {
    v1 = sub_10000690C(&qword_10001E0B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E0B0);
  }
  return result;
}

uint64_t sub_10000DD00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 152);
  v10 = *(_QWORD *)(a1 + 168);
  v14 = *(_QWORD *)(a1 + 184);
  v12 = *(_QWORD *)(a1 + 176);
  v13 = *(_QWORD *)(a1 + 192);
  sub_10000DDD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v9);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  sub_10000DDE4(v10, v12);
  sub_10000DDE4(v14, v13);
  return a1;
}

uint64_t sub_10000DDD4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000DDE4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10000DDF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 120);
  sub_10000DDD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v9);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  return a1;
}

uint64_t sub_10000DE98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 120);
  sub_10000DB18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v7);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v6);
  swift_release(v8);
  swift_release(v9);
  return a1;
}

uint64_t sub_10000DF3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 152);
  v10 = *(_QWORD *)(a1 + 168);
  v14 = *(_QWORD *)(a1 + 184);
  v12 = *(_QWORD *)(a1 + 176);
  v13 = *(_QWORD *)(a1 + 192);
  sub_10000DB18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v7);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v6);
  swift_release(v8);
  swift_release(v9);
  sub_10000661C(v10, v12);
  sub_10000661C(v14, v13);
  return a1;
}

uint64_t sub_10000E010(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E054(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E098@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10000CF54(a1, (uint64_t)&unk_100011358, (uint64_t)&unk_1000114B8, a2);
}

uint64_t sub_10000E0BC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CFCC(a1, a2, a3, a4, (uint64_t)&unk_100011358, (uint64_t)&unk_1000114B8);
}

uint64_t sub_10000E0E4()
{
  return sub_10000ED9C(sub_10000CC00);
}

uint64_t sub_10000E0F0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10000CF54(a1, (uint64_t)&unk_100011380, (uint64_t)&unk_100011498, a2);
}

uint64_t sub_10000E114(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CFCC(a1, a2, a3, a4, (uint64_t)&unk_100011380, (uint64_t)&unk_100011498);
}

uint64_t sub_10000E13C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(void);

  result = type metadata accessor for ShieldIntervention(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v3 = *(uint64_t (**)(void))(v0 + ((v2 + 16) & ~v2) + 80);
  if (v3)
    return v3();
  return result;
}

double sub_10000E180@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_10000CC54((_QWORD *)*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32)).n128_u64[0];
  return result;
}

unint64_t sub_10000E18C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E0F8;
  if (!qword_10001E0F8)
  {
    v1 = sub_10000690C(&qword_10001E0F0);
    sub_10000E210();
    sub_10000EFFC(&qword_10001E0C0, &qword_10001E0C8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E0F8);
  }
  return result;
}

unint64_t sub_10000E210()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E100;
  if (!qword_10001E100)
  {
    v1 = sub_10000690C(&qword_10001E108);
    sub_10000DC9C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E100);
  }
  return result;
}

uint64_t sub_10000E27C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 152);
  v10 = *(_QWORD *)(a1 + 168);
  v12 = *(_QWORD *)(a1 + 184);
  v13 = *(_QWORD *)(a1 + 176);
  v14 = *(_QWORD *)(a1 + 200);
  v15 = *(_QWORD *)(a1 + 192);
  sub_10000DDD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v9);
  swift_retain(v10);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  sub_10000DDE4(v13, v12);
  sub_10000DDE4(v15, v14);
  return a1;
}

uint64_t sub_10000E358(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 136);
  sub_10000DDD4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain(v9);
  swift_retain(v10);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  return a1;
}

uint64_t sub_10000E408(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 136);
  sub_10000DB18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v10);
  swift_release(v7);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v6);
  swift_release(v8);
  swift_release(v9);
  return a1;
}

uint64_t sub_10000E4B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 152);
  v10 = *(_QWORD *)(a1 + 168);
  v12 = *(_QWORD *)(a1 + 184);
  v13 = *(_QWORD *)(a1 + 176);
  v14 = *(_QWORD *)(a1 + 200);
  v15 = *(_QWORD *)(a1 + 192);
  sub_10000DB18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v10);
  swift_release(v7);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v6);
  swift_release(v8);
  swift_release(v9);
  sub_10000661C(v13, v12);
  sub_10000661C(v15, v14);
  return a1;
}

uint64_t sub_10000E594(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000057A0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E5D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000E604(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_10000E628()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_10000E638(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_10000E650@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000E678(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

uint64_t sub_10000E6A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000E6C8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

unint64_t sub_10000E6F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E150;
  if (!qword_10001E150)
  {
    v1 = sub_10000690C(&qword_10001E138);
    sub_10000E774();
    sub_10000EFFC(&qword_10001E190, &qword_10001E198, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E150);
  }
  return result;
}

unint64_t sub_10000E774()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E158;
  if (!qword_10001E158)
  {
    v1 = sub_10000690C(&qword_10001E130);
    sub_10000E7F8();
    sub_10000EFFC(&qword_10001E190, &qword_10001E198, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E158);
  }
  return result;
}

unint64_t sub_10000E7F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E160;
  if (!qword_10001E160)
  {
    v1 = sub_10000690C(&qword_10001E128);
    sub_10000E87C();
    sub_10000EFFC(&qword_10001E180, &qword_10001E188, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E160);
  }
  return result;
}

unint64_t sub_10000E87C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E168;
  if (!qword_10001E168)
  {
    v1 = sub_10000690C(&qword_10001E120);
    sub_10000EC20(&qword_10001E170, &qword_10001E118, &qword_10001E178, &qword_10001E028);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E168);
  }
  return result;
}

uint64_t sub_10000E908()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_10000E928(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ButtonBorderShape(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues._buttonBorderShape.setter(v3);
}

uint64_t sub_10000E9A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000E9D0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10000E9F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

unint64_t sub_10000EA08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E1F0;
  if (!qword_10001E1F0)
  {
    v1 = sub_10000690C(&qword_10001E1D8);
    sub_10000EA8C();
    sub_10000EFFC(&qword_10001E190, &qword_10001E198, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E1F0);
  }
  return result;
}

unint64_t sub_10000EA8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E1F8;
  if (!qword_10001E1F8)
  {
    v1 = sub_10000690C(&qword_10001E1D0);
    sub_10000EB10();
    sub_10000EFFC(&qword_10001E190, &qword_10001E198, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E1F8);
  }
  return result;
}

unint64_t sub_10000EB10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E200;
  if (!qword_10001E200)
  {
    v1 = sub_10000690C(&qword_10001E1C8);
    sub_10000EB94();
    sub_10000EFFC(&qword_10001E180, &qword_10001E188, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E200);
  }
  return result;
}

unint64_t sub_10000EB94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E208;
  if (!qword_10001E208)
  {
    v1 = sub_10000690C(&qword_10001E1C0);
    sub_10000EC20(&qword_10001E210, &qword_10001E1B8, &qword_10001E218, &qword_10001E000);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E208);
  }
  return result;
}

uint64_t sub_10000EC20(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000690C(a2);
    sub_10000EFFC(a3, a4, (uint64_t)&protocol conformance descriptor for Button<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000ECA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000057A0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000ECE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000ED14(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10000ED40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000ED68(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10000ED90()
{
  return sub_10000ED9C(sub_10000CF00);
}

uint64_t sub_10000ED9C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShieldIntervention(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_10000EDD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000057A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void **initializeBufferWithCopyOfBuffer for VisualEffectView(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for VisualEffectView(id *a1)
{

}

void **assignWithCopy for VisualEffectView(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *initializeWithTake for VisualEffectView(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for VisualEffectView(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for VisualEffectView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VisualEffectView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for VisualEffectView()
{
  return &type metadata for VisualEffectView;
}

unint64_t sub_10000EF78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E248;
  if (!qword_10001E248)
  {
    v1 = sub_10000690C(&qword_10001DFB8);
    sub_10000EFFC(&qword_10001E250, &qword_10001DFA8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E248);
  }
  return result;
}

uint64_t sub_10000EFFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000690C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000F040()
{
  unint64_t result;

  result = qword_10001E258;
  if (!qword_10001E258)
  {
    result = swift_getWitnessTable(&unk_100011594, &type metadata for VisualEffectView);
    atomic_store(result, (unint64_t *)&qword_10001E258);
  }
  return result;
}

unint64_t sub_10000F084()
{
  unint64_t result;

  result = qword_10001E260;
  if (!qword_10001E260)
  {
    result = swift_getWitnessTable(&unk_1000115E4, &type metadata for VisualEffectView);
    atomic_store(result, (unint64_t *)&qword_10001E260);
  }
  return result;
}

id sub_10000F120()
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
  return objc_opt_self(_TtC11EyeReliefUI11AppDelegate);
}

void sub_10000F1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  NSString v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void **aBlock;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD *v56;

  v6 = (_QWORD *)v5;
  v48 = a4;
  v49 = a3;
  v50 = a2;
  v42 = a1;
  v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v46 = *(_QWORD *)(v8 - 8);
  v47 = v8;
  __chkstk_darwin(v8);
  v45 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v44);
  v43 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 32) = 0xD00000000000002DLL;
  *(_QWORD *)(v5 + 40) = 0x8000000100012030;
  *(_QWORD *)(v5 + 56) = 0;
  *(_BYTE *)(v5 + 64) = 1;
  *(double *)(v5 + 48) = a5;
  *(_QWORD *)(v5 + 16) = objc_msgSend(objc_allocWithZone((Class)AWAttentionAwarenessClient), "init");
  v14 = objc_msgSend(objc_allocWithZone((Class)AWAttentionAwarenessConfiguration), "init");
  v15 = String._bridgeToObjectiveC()();
  objc_msgSend(v14, "setIdentifier:", v15);

  objc_msgSend(v14, "setContinuousFaceDetectMode:", 1);
  objc_msgSend(v14, "setNotificationMask:", 31);
  objc_msgSend(v14, "setActivateEyeRelief:", 1);
  objc_msgSend(v14, "setActivateAttentionDetection:", 0);
  v16 = *(void **)(v5 + 16);
  objc_msgSend(v16, "setConfiguration:", v14);
  sub_10000D7C8();
  v17 = *(_QWORD *)(v5 + 32);
  v18 = *(_QWORD *)(v5 + 40);
  v19 = swift_bridgeObjectRetain(v18);
  static DispatchQoS.unspecified.getter(v19);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v20 = sub_10000D958(&qword_10001E460, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v21 = sub_1000057A0(&qword_10001E468);
  v22 = sub_10001035C(&qword_10001E470, &qword_10001E468);
  v23 = v43;
  v24 = v20;
  v25 = v48;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v21, v22, v44, v24);
  v26 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v45, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v47);
  v27 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v17, v18, v13, v23, v26, 0);
  v6[3] = v27;
  v6[9] = v49;
  v6[10] = v25;
  if (v16)
  {
    v28 = (_QWORD *)swift_allocObject(&unk_1000193A8, 40, 7);
    v29 = v42;
    v28[2] = v6;
    v28[3] = v29;
    v30 = v50;
    v28[4] = v50;
    v55 = sub_1000103C8;
    v56 = v28;
    aBlock = _NSConcreteStackBlock;
    v52 = 1107296256;
    v53 = sub_10000346C;
    v54 = &unk_1000193C0;
    v31 = _Block_copy(&aBlock);
    v32 = v56;
    swift_retain(v25);
    v33 = v16;
    v34 = v27;
    swift_retain(v6);
    swift_retain(v30);
    objc_msgSend(v33, "setEventStreamerWithQueue:block:", v34, v31, swift_release(v32).n128_f64[0]);
    _Block_release(v31);

    v27 = (void *)v6[3];
    v35 = (void *)v6[2];
    if (!v35)
      goto LABEL_7;
  }
  else
  {
    swift_retain(v25);
    v30 = v50;
    v35 = (void *)v6[2];
    if (!v35)
      goto LABEL_7;
  }
  if (!v27)
  {
    __break(1u);
    return;
  }
  v55 = sub_1000103F0;
  v56 = v6;
  aBlock = _NSConcreteStackBlock;
  v52 = 1107296256;
  v53 = sub_10000F7B0;
  v54 = &unk_1000193E8;
  v36 = _Block_copy(&aBlock);
  v37 = v56;
  swift_retain(v6);
  v38 = v35;
  v39 = v27;
  objc_msgSend(v38, "setNotificationHandlerWithQueue:block:", v39, v36, swift_release(v37).n128_f64[0]);
  _Block_release(v36);

  v27 = (void *)v6[3];
LABEL_7:
  if (v27)
  {
    v40 = v27;
    dispatch_activate(v40);

  }
  swift_release(v30);
  swift_release(v25);
}

void sub_10000F694(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  if (qword_10001DA30 != -1)
    swift_once(&qword_10001DA30, sub_100006B3C);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005814(v4, (uint64_t)qword_10001EA30);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received AA notification for face detect state", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if ((a1 & 5) != 0)
  {
    v9 = *(void (**)(uint64_t))(a2 + 72);
    if (v9)
    {
      v10 = *(_QWORD *)(a2 + 80);
      v11 = swift_retain(v10);
      v9(v11);
      sub_10000661C((uint64_t)v9, v10);
    }
  }
}

uint64_t sub_10000F7B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10000F7EC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v20;
  uint64_t v21;

  v3 = v2;
  v6 = objc_opt_self(AWFaceDetectAttentionEvent);
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(a1, v6, 0, 0, 0), "distance");
  v8 = v7;
  v9 = objc_opt_self(AWFaceDetectAttentionEvent);
  v10 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(a1, v9, 0, 0, 0), "faceState");
  if (qword_10001DA30 != -1)
    swift_once(&qword_10001DA30, sub_100006B3C);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_100005814(v11, (uint64_t)qword_10001EA30);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc(22, -1);
    *(_DWORD *)v15 = 134218240;
    v20 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v15 + 4, v15 + 12);
    *(_WORD *)(v15 + 12) = 2048;
    v20 = *(double *)&v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v15 + 14, v15 + 22);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "ER Distance: %f, ER Face State: %llu", (uint8_t *)v15, 0x16u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = *(double *)(v3 + 56);
  if (*(_BYTE *)(v3 + 64))
    v16 = v8;
  v17 = (v8 + v16) * 0.5;
  *(double *)(v3 + 56) = v8;
  *(_BYTE *)(v3 + 64) = 0;
  if (v17 <= 0.0)
  {
    if (v10 != (id)2)
      goto LABEL_15;
LABEL_14:
    v18 = 2;
    return a2(v18);
  }
  if (v10 == (id)2)
    goto LABEL_14;
  if (v10 != (id)1)
  {
LABEL_15:
    v18 = 0;
    return a2(v18);
  }
  if (v17 >= *(double *)(v3 + 48))
    v18 = 1;
  else
    v18 = 2;
  return a2(v18);
}

void sub_10000FA00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[5];
  uint64_t v29;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(v0 + 24);
  if (v10)
  {
    aBlock[4] = sub_100010354;
    v29 = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006BF8;
    aBlock[3] = &unk_100019370;
    v11 = _Block_copy(aBlock);
    v12 = v10;
    v26 = v3;
    v13 = v12;
    v14 = swift_retain(v1);
    static DispatchQoS.unspecified.getter(v14);
    v27 = &_swiftEmptyArrayStorage;
    v15 = sub_10000D958((unint64_t *)&qword_10001DB48, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v16 = sub_1000057A0(&qword_10001DB50);
    v17 = sub_10001035C((unint64_t *)&qword_10001DB58, &qword_10001DB50);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v27, v16, v17, v2, v15);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v11);
    _Block_release(v11);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_release(v29);
  }
  else
  {
    if (qword_10001DA30 != -1)
      swift_once(&qword_10001DA30, sub_100006B3C);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_100005814(v18, (uint64_t)qword_10001EA30);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error: Streaming queue was nil", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    v23 = *(void (**)(uint64_t))(v1 + 72);
    if (v23)
    {
      v24 = *(_QWORD *)(v1 + 80);
      v25 = swift_retain(v24);
      v23(v25);
      sub_10000661C((uint64_t)v23, v24);
    }
  }
}

void sub_10000FCC8(_QWORD *a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  id v21;

  v2 = (void *)a1[2];
  if (!v2)
    goto LABEL_4;
  v21 = 0;
  v3 = objc_msgSend(v2, "resumeWithError:", &v21);
  v4 = v21;
  if (v3)
  {
    v5 = v21;
LABEL_4:
    if (qword_10001DA30 != -1)
      swift_once(&qword_10001DA30, sub_100006B3C);
    v6 = type metadata accessor for Logger(0);
    v7 = sub_100005814(v6, (uint64_t)qword_10001EA30);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Resumed distance streaming", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    return;
  }
  v11 = v21;
  v12 = _convertNSErrorToError(_:)(v4);

  swift_willThrow();
  if (qword_10001DA30 != -1)
    swift_once(&qword_10001DA30, sub_100006B3C);
  v13 = type metadata accessor for Logger(0);
  v14 = sub_100005814(v13, (uint64_t)qword_10001EA30);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Couldn't resume distance streaming", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  v18 = (void (*)(uint64_t))a1[9];
  if (v18)
  {
    v19 = a1[10];
    v20 = swift_retain(v19);
    v18(v20);
    swift_errorRelease(v12);
    sub_10000661C((uint64_t)v18, v19);
  }
  else
  {
    swift_errorRelease(v12);
  }
}

double sub_10000FF04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  const void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[5];
  uint64_t v21;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(v0 + 24);
  if (v10)
  {
    aBlock[4] = sub_100010334;
    v21 = v0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006BF8;
    aBlock[3] = &unk_100019348;
    v11 = _Block_copy(aBlock);
    v18 = v2;
    v12 = v11;
    v13 = v10;
    v14 = swift_retain(v0);
    static DispatchQoS.unspecified.getter(v14);
    v19 = &_swiftEmptyArrayStorage;
    v15 = sub_10000D958((unint64_t *)&qword_10001DB48, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v16 = sub_1000057A0(&qword_10001DB50);
    v17 = sub_10001035C((unint64_t *)&qword_10001DB58, &qword_10001DB50);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v19, v16, v17, v1, v15);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v4, v12);
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *(_QWORD *)&result = swift_release(v21).n128_u64[0];
  }
  return result;
}

void sub_1000100DC(uint64_t a1)
{
  void *v1;
  unsigned int v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;

  v1 = *(void **)(a1 + 16);
  if (!v1)
    goto LABEL_4;
  v16 = 0;
  v2 = objc_msgSend(v1, "cancelFaceDetectStreamWithError:", &v16);
  v3 = v16;
  if (v2)
  {
    v4 = v16;
LABEL_4:
    if (qword_10001DA30 != -1)
      swift_once(&qword_10001DA30, sub_100006B3C);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_100005814(v5, (uint64_t)qword_10001EA30);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Stopped distance streaming", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }
    goto LABEL_13;
  }
  v10 = v16;
  v11 = _convertNSErrorToError(_:)(v3);

  swift_willThrow();
  if (qword_10001DA30 != -1)
    swift_once(&qword_10001DA30, sub_100006B3C);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_100005814(v12, (uint64_t)qword_10001EA30);
  v7 = Logger.logObject.getter(v13);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v14, "Couldn't stop distance streaming", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }
  swift_errorRelease(v11);
LABEL_13:

}

uint64_t sub_1000102D8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  sub_10000661C(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for DistanceStreaming()
{
  return objc_opt_self(_TtC11EyeReliefUI17DistanceStreaming);
}

void sub_100010334()
{
  uint64_t v0;

  sub_1000100DC(v0);
}

uint64_t sub_10001033C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001034C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100010354()
{
  _QWORD *v0;

  sub_10000FCC8(v0);
}

uint64_t sub_10001035C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000690C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001039C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000103C8(uint64_t a1)
{
  uint64_t v1;

  return sub_10000F7EC(a1, *(uint64_t (**)(uint64_t))(v1 + 24));
}

void sub_1000103F0(char a1)
{
  uint64_t v1;

  sub_10000F694(a1, v1);
}

uint64_t sub_100010410()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC11EyeReliefUIP33_3AE6918D35B90CDF83F74A1C6D657D9719ResourceBundleClass);
}
