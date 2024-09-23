uint64_t sub_100001CD4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000053FC(v0, qword_10000CAD8);
  sub_100005210(v0, (uint64_t)qword_10000CAD8);
  return Logger.init(subsystem:category:)(0xD000000000000011, 0x8000000100007650, 0x70756B72616DLL, 0xE600000000000000);
}

void sub_100001D44(uint64_t a1)
{
  sub_1000054E4(a1, OBJC_IVAR___AnnotationViewController_doneButton);
}

id sub_100001D50(uint64_t a1, uint64_t a2)
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

void sub_100001DC8(uint64_t a1)
{
  sub_1000054E4(a1, OBJC_IVAR___AnnotationViewController_akStream);
}

void sub_100001DD4(uint64_t a1)
{
  sub_1000054E4(a1, OBJC_IVAR___AnnotationViewController_markupStream);
}

id sub_100001E10()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___AnnotationViewController__navigationItem);
}

id sub_100001E20()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v1, "removeObserver:", v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for AnnotationViewController();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_100001F1C()
{
  char *v0;
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  Class isa;
  id v34;
  id v35;
  id v36;
  char *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;

  v1 = (objc_class *)type metadata accessor for AnnotationViewController();
  v42.receiver = v0;
  v42.super_class = v1;
  objc_msgSendSuper2(&v42, "viewDidLoad");
  v2 = objc_msgSend(v0, "view");
  if (v2)
  {
    v3 = v2;
    v4 = *(void **)&v0[OBJC_IVAR___AnnotationViewController__navigationItem];
    sub_100005090(v0);
    if (v5)
    {
      v6 = v5;
      v7 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "setTitle:", v7);

    *((_QWORD *)&v41 + 1) = v1;
    *(_QWORD *)&v40 = v0;
    v8 = objc_allocWithZone((Class)UIBarButtonItem);
    v9 = v0;
    v10 = sub_1000045C8(0, &v40, (uint64_t)"done:");
    v11 = v10;
    sub_100001D44((uint64_t)v10);
    v40 = 0u;
    v41 = 0u;
    v12 = objc_allocWithZone((Class)UIBarButtonItem);
    v13 = sub_1000045C8(6, &v40, 0);
    objc_msgSend(v13, "setWidth:", 40.0);
    v14 = sub_1000044A4(&qword_10000CC08);
    v15 = sub_1000054FC(v14, 48);
    *(_OWORD *)(v15 + 16) = xmmword_100006910;
    *(_QWORD *)(v15 + 32) = v11;
    *(_QWORD *)(v15 + 40) = v13;
    *(_QWORD *)&v40 = v15;
    specialized Array._endMutation()();
    v16 = v40;
    v39 = v11;
    v38 = v13;
    sub_1000050F0(v16, v4);
    v17 = *(void **)&v9[OBJC_IVAR___AnnotationViewController_markupViewController];
    v18 = objc_msgSend(v17, "view");
    if (v18)
    {
      v19 = v18;
      v20 = (void *)objc_opt_self(UIColor);
      v21 = objc_msgSend(v20, "systemBackgroundColor");
      objc_msgSend(v3, "setBackgroundColor:", v21);

      v22 = objc_msgSend(v20, "systemBackgroundColor");
      objc_msgSend(v17, "setBackgroundColor:", v22);

      objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v9, "addChildViewController:", v17);
      v23 = sub_1000055E0((uint64_t)objc_msgSend(v3, "addSubview:", v19), "topAnchor");
      v36 = sub_1000055E0((uint64_t)v23, "leftAnchor");
      v34 = sub_1000055E0((uint64_t)v36, "bottomAnchor");
      v37 = v9;
      v24 = sub_1000055E0((uint64_t)v34, "rightAnchor");
      v35 = (id)objc_opt_self(NSLayoutConstraint);
      v25 = sub_1000054FC(v14, 64);
      *(_OWORD *)(v25 + 16) = xmmword_100006920;
      v26 = objc_msgSend(sub_100005564(v25, "leftAnchor"), "constraintEqualToAnchor:", v36);
      sub_1000055D8();
      *(_QWORD *)(v25 + 32) = &AnnotationViewController__prots;
      v28 = objc_msgSend(sub_100005564(v27, "topAnchor"), "constraintEqualToAnchor:", v23);
      sub_1000055D8();
      *(_QWORD *)(v25 + 40) = &AnnotationViewController__prots;
      v30 = objc_msgSend(v24, "constraintEqualToAnchor:", sub_100005564(v29, "rightAnchor"));
      sub_1000055D8();
      *(_QWORD *)(v25 + 48) = &AnnotationViewController__prots;
      v32 = objc_msgSend(v34, "constraintEqualToAnchor:", sub_100005564(v31, "bottomAnchor"));
      sub_1000055D8();
      *(_QWORD *)(v25 + 56) = &AnnotationViewController__prots;
      *(_QWORD *)&v40 = v25;
      specialized Array._endMutation()();
      sub_10000543C(0, &qword_10000CC30, NSLayoutConstraint_ptr);
      isa = sub_100005624().super.isa;
      sub_1000056E4();
      objc_msgSend(v35, "activateConstraints:", isa);

      objc_msgSend(v3, "layoutIfNeeded");
      objc_msgSend(v19, "becomeFirstResponder");
      objc_msgSend(v17, "didMoveToParentViewController:", v37);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1000023F8(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSString v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char aBlock[8];
  uint64_t v27;
  uint64_t v28;
  void (*v29)(void *, uint64_t);
  uint64_t v30;

  v2 = v1;
  if (qword_10000CAD0 != -1)
    swift_once(&qword_10000CAD0, sub_100001CD4);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005210(v4, (uint64_t)qword_10000CAD8);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    *(_QWORD *)aBlock = v9;
    *(_DWORD *)v8 = 136446210;
    sub_1000047F8(0xD000000000000013, 0x8000000100007250, (uint64_t *)aBlock);
    sub_1000056BC();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v10, v11, v8 + 4);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    sub_100005668(v9);
    sub_100005668((uint64_t)v8);
  }

  v12 = String._bridgeToObjectiveC()();
  v13 = sub_1000054F0((uint64_t)&unk_100008678);
  *(_QWORD *)(v13 + 16) = v2;
  v29 = sub_100005228;
  v30 = v13;
  v14 = sub_100005604((uint64_t)&unk_100008690, v22, v24, (char)_NSConcreteStackBlock, 1107296256, v27, v28);
  v15 = v30;
  v16 = v2;
  swift_release(v15);
  objc_msgSend(a1, "openStreamForType:identifier:completion:", 2, v12, v14);
  sub_100005674();

  v17 = String._bridgeToObjectiveC()();
  v18 = sub_1000054F0((uint64_t)&unk_1000086C8);
  *(_QWORD *)(v18 + 16) = v16;
  v29 = sub_100005230;
  v30 = v18;
  v19 = sub_100005604((uint64_t)&unk_1000086E0, v23, v25, (char)_NSConcreteStackBlock, 1107296256, v27, v28);
  v20 = v30;
  v21 = v16;
  swift_release(v20);
  objc_msgSend(a1, "openStreamForType:identifier:completion:", 2, v17, v19);
  _Block_release(v19);

}

void sub_100002694(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  NSObject *v27;
  void **aBlock;
  uint64_t v29;
  void *v30;
  void *v31;
  void (*v32)(uint64_t);
  uint64_t v33;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v11 = swift_allocObject(&unk_100008718, 24, 7);
    swift_unknownObjectWeakInit(v11 + 16, a3);
    v32 = sub_100005350;
    v33 = v11;
    aBlock = _NSConcreteStackBlock;
    v29 = 1107296256;
    v30 = sub_100002A00;
    v31 = &unk_1000087F8;
    v12 = _Block_copy(&aBlock);
    v13 = v33;
    v14 = a1;
    swift_release(v13);
    objc_msgSend(v14, "setHandler:", v12);
    _Block_release(v12);
    v15 = swift_allocObject(&unk_100008830, 24, 7);
    *(_QWORD *)(v15 + 16) = a3;
    v32 = sub_100005380;
    v33 = v15;
    aBlock = _NSConcreteStackBlock;
    v29 = 1107296256;
    v30 = sub_100002A94;
    v31 = &unk_100008848;
    v16 = _Block_copy(&aBlock);
    v17 = v33;
    v18 = a3;
    swift_release(v17);
    objc_msgSend(v14, "activateWithCompletion:", v16);
    _Block_release(v16);
    v19 = v14;
    sub_100001DC8((uint64_t)a1);

  }
  else if (a2)
  {
    swift_errorRetain(a2);
    if (qword_10000CAD0 != -1)
      swift_once(&qword_10000CAD0, sub_100001CD4);
    v20 = sub_100005210(v6, (uint64_t)qword_10000CAD8);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v20, v6);
    __chkstk_darwin(v21, v22);
    *(&v26 - 2) = a2;
    sub_1000056EC((uint64_t (*)(void))sub_1000029B8, 0, sub_1000054D0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_errorRelease(a2);
  }
  else
  {
    if (qword_10000CAD0 != -1)
      swift_once(&qword_10000CAD0, sub_100001CD4);
    v23 = sub_100005210(v6, (uint64_t)qword_10000CAD8);
    v27 = Logger.logObject.getter(v23);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v24, "AKSidecarController Stream Failed", v25, 2u);
      swift_slowDealloc(v25, -1, -1);
    }

  }
}

unint64_t sub_1000029B8()
{
  return 0xD000000000000021;
}

uint64_t sub_1000029D4(uint64_t a1)
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

uint64_t sub_100002A00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(__int128 *);
  __int128 v6;
  __int128 v7;

  v4 = *(void (**)(__int128 *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    *((_QWORD *)&v7 + 1) = swift_getObjectType(a2);
    *(_QWORD *)&v6 = a2;
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
  }
  swift_retain(v3);
  swift_unknownObjectRetain(a2);
  v4(&v6);
  swift_release(v3);
  return sub_1000047B8((uint64_t)&v6);
}

unint64_t sub_100002A78()
{
  return 0xD00000000000002CLL;
}

void sub_100002A94(uint64_t a1, void *a2)
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

void sub_100002AE8(uint64_t a1, void *a2, void *a3)
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

void sub_100002B5C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  NSObject *v27;
  void **aBlock;
  uint64_t v29;
  void *v30;
  void *v31;
  void (*v32)(uint64_t);
  uint64_t v33;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v11 = swift_allocObject(&unk_100008718, 24, 7);
    swift_unknownObjectWeakInit(v11 + 16, a3);
    v32 = sub_100005288;
    v33 = v11;
    aBlock = _NSConcreteStackBlock;
    v29 = 1107296256;
    v30 = sub_100002A00;
    v31 = &unk_100008730;
    v12 = _Block_copy(&aBlock);
    v13 = v33;
    v14 = a1;
    swift_release(v13);
    objc_msgSend(v14, "setHandler:", v12);
    _Block_release(v12);
    v15 = swift_allocObject(&unk_100008768, 24, 7);
    *(_QWORD *)(v15 + 16) = a3;
    v32 = sub_1000052B8;
    v33 = v15;
    aBlock = _NSConcreteStackBlock;
    v29 = 1107296256;
    v30 = sub_100002A94;
    v31 = &unk_100008780;
    v16 = _Block_copy(&aBlock);
    v17 = v33;
    v18 = a3;
    swift_release(v17);
    objc_msgSend(v14, "activateWithCompletion:", v16);
    _Block_release(v16);
    v19 = v14;
    sub_100001DD4((uint64_t)a1);

  }
  else if (a2)
  {
    swift_errorRetain(a2);
    if (qword_10000CAD0 != -1)
      swift_once(&qword_10000CAD0, sub_100001CD4);
    v20 = sub_100005210(v6, (uint64_t)qword_10000CAD8);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v20, v6);
    __chkstk_darwin(v21, v22);
    *(&v26 - 2) = a2;
    sub_1000056EC((uint64_t (*)(void))sub_100002E80, 0, sub_10000523C);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_errorRelease(a2);
  }
  else
  {
    if (qword_10000CAD0 != -1)
      swift_once(&qword_10000CAD0, sub_100001CD4);
    v23 = sub_100005210(v6, (uint64_t)qword_10000CAD8);
    v27 = Logger.logObject.getter(v23);
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v24, "MarkupController Stream Failed", v25, 2u);
      swift_slowDealloc(v25, -1, -1);
    }

  }
}

unint64_t sub_100002E80()
{
  return 0xD00000000000001ELL;
}

void sub_100002E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 aBlock;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD v30[2];
  _OWORD v31[2];

  type metadata accessor for DispatchWorkItemFlags(0);
  sub_1000056A8();
  __chkstk_darwin(v12, v13);
  v14 = sub_10000551C();
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  sub_100005504();
  sub_1000052E0(a1, (uint64_t)&aBlock);
  if (v27)
  {
    v17 = sub_1000051A8(&aBlock, v31);
    sub_1000055D0((uint64_t)v17, &qword_10000CBE8, OS_dispatch_queue_ptr);
    v23 = v7;
    v18 = (void *)static OS_dispatch_queue.main.getter();
    sub_10000458C((uint64_t)v31, (uint64_t)v30);
    v19 = sub_1000054FC(a3, 56);
    *(_QWORD *)(v19 + 16) = a2;
    sub_1000051A8(v30, (_OWORD *)(v19 + 24));
    v28 = a4;
    v29 = v19;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v26 = sub_1000029D4;
    v27 = a5;
    v20 = _Block_copy(&aBlock);
    v21 = v29;
    swift_retain(a2);
    v22 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v22);
    *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
    sub_100004464();
    sub_1000044A4(&qword_10000CBF8);
    sub_1000044E4();
    sub_100005688();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v6, v5, v20);
    _Block_release(v20);

    sub_10000563C(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    sub_10000567C(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    sub_10000456C(v31);
  }
  else
  {
    sub_1000047B8((uint64_t)&aBlock);
  }
  sub_100005538();
}

void sub_100003064(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  _BYTE v8[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    a3(a2);

  }
  sub_100005580();
}

void sub_1000030C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  sub_100005504();
  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_10000CAD0 != -1)
      swift_once(&qword_10000CAD0, sub_100001CD4);
    v11 = sub_100005210(v8, (uint64_t)qword_10000CAD8);
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, v11, v8);
    __chkstk_darwin(v12, v13);
    sub_1000056EC(a3, 0, a4);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
    swift_errorRelease(a1);
  }
}

unint64_t sub_1000031D4()
{
  return 0xD000000000000029;
}

void sub_1000031F0()
{
  void *v0;
  void *v1;

  v0 = (void *)sub_100005654(OBJC_IVAR___AnnotationViewController_rootController);
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, "completeRequest:", 2);

  }
  sub_100001DC8(0);
  sub_100001DD4(0);
}

void sub_1000032A4(_QWORD *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;

  v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR___AnnotationViewController_markupViewController), "annotationController"));
  if (v3)
  {
    v9 = v3;
    v4 = sub_1000051DC(v3);
    if (v4)
    {
      v5 = v4;
      v6 = a1[3];
      v7 = sub_100004760(a1, v6);
      v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
      sub_10000561C(v5, "handleIncomingOPACKObject:");

      swift_unknownObjectRelease(v8);
    }
    else
    {

    }
  }
  else
  {
    sub_100005590();
  }
}

void sub_100003368(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *Strong;
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_opt_self(AKSidecarController);
  v3 = a1[3];
  v4 = sub_100004760(a1, v3);
  v5 = _bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  *(_QWORD *)(sub_1000054F0((uint64_t)&unk_100008628) + 16) = v1;
  sub_100005610((uint64_t)sub_1000034EC, (uint64_t)_NSConcreteStackBlock, 1107296256, v12, v13);
  sub_1000056D0();
  v6 = sub_10000569C();
  v7 = sub_1000055B8(v6, "validateInitialMessage:applicationData:");
  sub_100005674();
  swift_unknownObjectRelease(v5);
  if ((_DWORD)v7
    && (v8 = objc_msgSend(*(id *)((char *)a1 + OBJC_IVAR___AnnotationViewController_markupViewController), "annotationController")) != 0&& (v7 = v8, v9 = objc_msgSend(v8, "sidecarController"), v7, v9))
  {
    sub_10000561C(v9, "setDelegate:");

    *((_BYTE *)a1 + OBJC_IVAR___AnnotationViewController_handledSetupMessage) = 1;
  }
  else
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)a1 + OBJC_IVAR___AnnotationViewController_rootController);
    if (Strong)
    {
      v11 = objc_msgSend(Strong, "request");
      sub_1000055C8();
      objc_msgSend(v7, "cancel");

    }
  }
}

uint64_t sub_1000034EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_retain(v2);
  LOBYTE(v3) = v3(v4);
  swift_release(v2);
  swift_bridgeObjectRelease(v4);
  return v3 & 1;
}

void sub_100003564(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28[3];
  uint64_t v29;
  uint64_t (*v30)();
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  uint64_t v34;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v3 = a1;
    else
      v3 = a1 & 0xFFFFFFFFFFFFFF8;
    sub_1000056DC();
    _CocoaArrayWrapper.endIndex.getter(v3);
    sub_1000055F8();
    if (!v3)
      return;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v3)
      return;
  }
  v4 = OBJC_IVAR___AnnotationViewController_handledSetupMessage;
  if (v1[OBJC_IVAR___AnnotationViewController_handledSetupMessage] == 1)
  {
    v5 = objc_msgSend(*(id *)&v1[OBJC_IVAR___AnnotationViewController_markupViewController], "annotationController");
    if (!v5)
      return;
    v6 = v5;
    v7 = objc_msgSend(v5, "sidecarController");

    if (!v7)
      return;
    if (v3 >= 1)
    {
      sub_1000056DC();
      for (i = 0; i != v3; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
          v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        else
          v9 = *(id *)(a1 + 8 * i + 32);
        v10 = v9;
        v11 = objc_msgSend(v9, "objectValue");
        if (v11)
        {
          v12 = v11;
          _bridgeAnyObjectToAny(_:)(&v33, v11);
          swift_unknownObjectRelease(v12);
          sub_1000051A8(&v33, v28);
          v13 = v29;
          v14 = sub_100004760(v28, v29);
          v15 = _bridgeAnythingToObjectiveC<A>(_:)(v14, v13);
          objc_msgSend(v7, "handleIncomingOPACKObject:", v15);

          swift_unknownObjectRelease(v15);
          sub_10000456C(v28);
        }
        else
        {

        }
      }

      swift_bridgeObjectRelease(a1);
      return;
    }
LABEL_40:
    __break(1u);
    return;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1000056DC();
    specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
    sub_1000055F8();
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    v3 = (uint64_t)*(id *)(a1 + 32);
  }
  v16 = objc_msgSend((id)v3, "objectValue");

  if (v16)
  {
    _bridgeAnyObjectToAny(_:)(v32, v16);
    swift_unknownObjectRelease(v16);
  }
  else
  {
    memset(v32, 0, sizeof(v32));
  }
  sub_100005160((uint64_t)v32, (uint64_t)v28);
  if (v29)
  {
    sub_1000051A8(v28, &v33);
    objc_opt_self(AKSidecarController);
    v17 = v34;
    v18 = sub_100004760(&v33, v34);
    v19 = _bridgeAnythingToObjectiveC<A>(_:)(v18, v17);
    v20 = sub_1000054F0((uint64_t)&unk_1000085D8);
    *(_QWORD *)(v20 + 16) = v1;
    v30 = sub_100005474;
    v31 = v20;
    sub_100005610((uint64_t)sub_1000034EC, (uint64_t)_NSConcreteStackBlock, 1107296256, v28[2], v29);
    sub_1000056D0();
    v21 = sub_10000569C();
    v22 = sub_1000055B8(v21, "validateInitialMessage:applicationData:");
    sub_100005674();
    swift_unknownObjectRelease(v19);
    if (v22)
    {
      v23 = objc_msgSend(*(id *)(v17 + OBJC_IVAR___AnnotationViewController_markupViewController), "annotationController");
      if (v23)
      {
        v24 = v23;
        v25 = objc_msgSend(v23, "sidecarController");

        if (v25)
        {
          sub_10000561C(v25, "setDelegate:");

          v1[v4] = 1;
        }
      }
      sub_10000456C(&v33);
      return;
    }
    sub_10000456C(&v33);
  }
  else
  {
    sub_1000047B8((uint64_t)v28);
  }
  v26 = (void *)sub_100005654(OBJC_IVAR___AnnotationViewController_rootController);
  if (v26)
  {
    v27 = objc_msgSend(v26, "request");
    sub_1000055C8();
    objc_msgSend(v1, "cancel");

  }
}

uint64_t sub_100003918()
{
  uint64_t v0;
  Class isa;
  void *v2;
  BOOL v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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
  _QWORD *v35;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  id v51;
  uint64_t v53[2];
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v54 = 0;
  *(_QWORD *)&v59 = 0;
  AKSidecarMarkupGetApplicationFromDictionary(isa, &v54, &v59);

  v2 = v54;
  if (v54)
    v3 = (_QWORD)v59 == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (!v3)
  {
    strcpy((char *)v53, "contentWidth");
    BYTE5(v53[1]) = 0;
    HIWORD(v53[1]) = -5120;
    v5 = (id)v59;
    v6 = v2;
    v7 = v5;
    v13 = sub_100005630((uint64_t)v7, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, v8, v9, v10, v11, v12, v53[0], v53[1], (uint64_t)v54);
    sub_1000055A8((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20, v53[0], v53[1], (char)v54, v55, v56, v57, v58, v59);
    v21 = sub_100004784((uint64_t)&v54);
    if (v60)
    {
      v28 = sub_10000556C(v21, v22, v23, (uint64_t)&type metadata for CGFloat, v24, v25, v26, v27, v53[0], v53[1], (uint64_t)v54, v55, v56, v57, v58, v59);
      if ((v28 & 1) == 0)
      {
LABEL_14:
        objc_msgSend(*(id *)(v0 + OBJC_IVAR___AnnotationViewController_markupViewController), "setData:withArchivedModelData:", v6, 0);
        sub_1000055E8();
        v51 = v7;
        sub_1000055E8();

        return v4;
      }
      v34 = v53[0];
      v35 = sub_100005630(v28, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String, v29, v30, v31, v32, v33, 0x48746E65746E6F63, 0xED00007468676965, (uint64_t)v54);
      sub_1000055A8((uint64_t)v35, v36, v37, v38, v39, v40, v41, v42, v53[0], v53[1], (char)v54, v55, v56, v57, v58, v59);
      v43 = sub_100004784((uint64_t)&v54);
      if (v60)
      {
        if ((sub_10000556C(v43, v44, v45, (uint64_t)&type metadata for CGFloat, v46, v47, v48, v49, v53[0], v53[1], (uint64_t)v54, v55, v56, v57, v58, v59) & 1) != 0)
        {
          v50 = (uint64_t *)(*(_QWORD *)(v0 + OBJC_IVAR___AnnotationViewController_markupViewController)
                          + OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize);
          *v50 = v34;
          v50[1] = v53[0];
        }
        goto LABEL_14;
      }
    }
    sub_1000047B8((uint64_t)&v59);
    goto LABEL_14;
  }
  return v4;
}

double sub_100003B30@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_100004F60(a1), (v6 & 1) != 0))
  {
    sub_10000458C(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_100003B80(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  NSString v12;
  id v13;
  objc_super v15;

  sub_100005648(OBJC_IVAR___AnnotationViewController_rootController);
  v6 = OBJC_IVAR___AnnotationViewController_markupViewController;
  v7 = type metadata accessor for _MarkupViewController();
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7));
  v9 = v3;
  v10 = sub_100005564((uint64_t)v9, "init");
  *(_QWORD *)&v3[v6] = v10;
  *(_QWORD *)&v9[OBJC_IVAR___AnnotationViewController_doneButton] = 0;
  v9[OBJC_IVAR___AnnotationViewController_handledSetupMessage] = 0;
  v11 = OBJC_IVAR___AnnotationViewController__navigationItem;
  sub_1000055D0((uint64_t)v10, &qword_10000CC28, UINavigationItem_ptr);
  *(_QWORD *)&v9[v11] = sub_100005550();
  *(_QWORD *)&v9[OBJC_IVAR___AnnotationViewController_akStream] = 0;
  *(_QWORD *)&v9[OBJC_IVAR___AnnotationViewController_markupStream] = 0;

  if (a2)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for AnnotationViewController();
  v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

char *sub_100003CB8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  sub_100005648(OBJC_IVAR___AnnotationViewController_rootController);
  v1 = OBJC_IVAR___AnnotationViewController_markupViewController;
  v2 = type metadata accessor for _MarkupViewController();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v4 = v0;
  v5 = objc_msgSend(v3, "init");
  *(_QWORD *)&v0[v1] = v5;
  *(_QWORD *)&v4[OBJC_IVAR___AnnotationViewController_doneButton] = 0;
  v4[OBJC_IVAR___AnnotationViewController_handledSetupMessage] = 0;
  v6 = OBJC_IVAR___AnnotationViewController__navigationItem;
  sub_1000055D0((uint64_t)v5, &qword_10000CC28, UINavigationItem_ptr);
  *(_QWORD *)&v4[v6] = sub_100005550();
  *(_QWORD *)&v4[OBJC_IVAR___AnnotationViewController_akStream] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___AnnotationViewController_markupStream] = 0;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for AnnotationViewController();
  sub_10000565C((uint64_t)v14.super_class, "initWithCoder:", v7, v8, v9, v10, v11, v12, v14);
  sub_1000055C8();
  return v0;
}

uint64_t type metadata accessor for AnnotationViewController()
{
  return objc_opt_self(AnnotationViewController);
}

void sub_100003DE4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  Class isa;
  _QWORD v11[4];

  v3 = (void *)sub_100005654(OBJC_IVAR___AnnotationViewController_rootController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "request");

    if (v5)
    {
      v6 = sub_1000044A4(&qword_10000CC08);
      v7 = sub_1000054FC(v6, 40);
      *(_OWORD *)(v7 + 16) = xmmword_100006930;
      sub_10000458C(a2, (uint64_t)v11);
      v8 = objc_allocWithZone((Class)SidecarItem);
      v9 = sub_1000046C8(v11, 0, 0xE000000000000000);
      *(_QWORD *)(v7 + 32) = v9;
      v11[0] = v7;
      specialized Array._endMutation()(v9);
      sub_10000543C(0, &qword_10000CC10, SidecarItem_ptr);
      isa = sub_100005624().super.isa;
      sub_1000056E4();
      objc_msgSend(v5, "sendItems:complete:", isa, 0);

    }
  }
  sub_100005580();
}

void sub_100003F54()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD aBlock[5];
  uint64_t v18;

  v4 = v0;
  type metadata accessor for DispatchWorkItemFlags(0);
  sub_1000056A8();
  __chkstk_darwin(v5, v6);
  v7 = sub_10000551C();
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  sub_100005504();
  sub_1000055D0(v10, &qword_10000CBE8, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = sub_1000054F0((uint64_t)&unk_100008588);
  *(_QWORD *)(v12 + 16) = v0;
  aBlock[4] = sub_100004444;
  v18 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000029D4;
  aBlock[3] = &unk_1000085A0;
  v13 = _Block_copy(aBlock);
  v14 = v18;
  v15 = v4;
  v16 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100004464();
  sub_1000044A4(&qword_10000CBF8);
  sub_1000044E4();
  sub_100005688();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v2, v1, v13);
  _Block_release(v13);

  sub_10000563C(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_10000567C(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_100005538();
}

void sub_1000040BC(uint64_t a1)
{
  void *Strong;
  void *v2;
  id v3;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(a1 + OBJC_IVAR___AnnotationViewController_rootController);
  if (Strong)
  {
    v2 = Strong;
    v3 = objc_msgSend(Strong, "request");

    objc_msgSend(v3, "cancel");
  }
}

double sub_1000041B4()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize);
}

void sub_1000041C8(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v5;
  NSString v7;
  objc_super v8;

  v5 = &v3[OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for _MarkupViewController();
  objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v7, a3);

  sub_100005590();
}

uint64_t sub_100004254(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, void *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a4;
  return a5(v7, v9, a4);
}

void sub_1000042C0()
{
  char *v0;
  char *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v1 = &v0[OBJC_IVAR____TtC16ContinuityMarkup21_MarkupViewController_hostImageSize];
  v2 = (objc_class *)type metadata accessor for _MarkupViewController();
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v9.receiver = v0;
  v9.super_class = v2;
  sub_10000565C((uint64_t)v2, "initWithCoder:", v3, v4, v5, v6, v7, v8, v9);
  sub_1000055C8();
  sub_100005590();
}

id sub_100004330()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _MarkupViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for _MarkupViewController()
{
  return objc_opt_self(_TtC16ContinuityMarkup21_MarkupViewController);
}

__n128 sub_100004380(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004390(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000043B0(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10000CBE0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100008560);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000CBE0);
  }
}

uint64_t sub_100004420()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100004444()
{
  uint64_t v0;

  sub_1000040BC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000444C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000445C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100004464()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CBF0;
  if (!qword_10000CBF0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10000CBF0);
  }
  return result;
}

uint64_t sub_1000044A4(uint64_t *a1)
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

unint64_t sub_1000044E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CC00;
  if (!qword_10000CC00)
  {
    v1 = sub_100004528(&qword_10000CBF8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000CC00);
  }
  return result;
}

uint64_t sub_100004528(uint64_t *a1)
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

uint64_t sub_10000456C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000458C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_1000045C8(uint64_t a1, _QWORD *a2, uint64_t a3)
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
    v8 = sub_100004760(a2, a2[3]);
    v9 = *(_QWORD *)(v6 - 8);
    __chkstk_darwin(v8, v8);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = _bridgeAnythingToObjectiveC<A>(_:)(v11, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    sub_10000456C(a2);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", a1, v12, a3);
  swift_unknownObjectRelease(v12);
  return v13;
}

id sub_1000046C8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSString v9;
  id v10;

  v6 = a1[3];
  v7 = sub_100004760(a1, v6);
  v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  v10 = objc_msgSend(v3, "initWithObject:type:", v8, v9);
  swift_unknownObjectRelease(v8);

  sub_10000456C(a1);
  return v10;
}

_QWORD *sub_100004760(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004784(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_1000047B8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000044A4(&qword_10000CC18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000047F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_1000048C8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000458C((uint64_t)v12, *a3);
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
      sub_10000458C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000456C(v12);
  return v7;
}

_QWORD *sub_1000048C8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100004A1C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100004AE0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

void *sub_100004A1C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100004AE0(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_100004B74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100004D48(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_100004D48((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_100004B74(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_100004CE4(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_100004CE4(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000044A4(&qword_10000CC20);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100004D48(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  if (v9)
  {
    v10 = sub_1000044A4(&qword_10000CC20);
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
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100004EE0(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100004E1C(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100004E1C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_100004EE0(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_100004F60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100004F90(a1, v4);
}

unint64_t sub_100004F90(uint64_t a1, uint64_t a2)
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
      sub_100005054(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100004784((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100005054(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100005090(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "title");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

void sub_1000050F0(uint64_t a1, void *a2)
{
  Class isa;

  sub_10000543C(0, &qword_10000CC38, UIBarButtonItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  objc_msgSend(a2, "setRightBarButtonItems:", isa);

}

uint64_t sub_100005160(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000044A4(&qword_10000CC18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000051A8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000051B8()
{
  return sub_100003918() & 1;
}

id sub_1000051DC(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "sidecarController"));

  return v2;
}

uint64_t sub_100005210(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_100005228(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100002694(a1, a2, *(void **)(v2 + 16));
}

void sub_100005230(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100002B5C(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10000523C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_errorRetain(v1);
  return v1;
}

uint64_t sub_100005264()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100005288(uint64_t a1)
{
  uint64_t v1;

  sub_100002E9C(a1, v1, (uint64_t)&unk_1000087B8, (uint64_t)sub_10000532C, (uint64_t)&unk_1000087D0);
}

void sub_1000052B8(uint64_t a1)
{
  uint64_t v1;

  sub_1000030C0(a1, *(_QWORD *)(v1 + 16), (uint64_t (*)(void))sub_1000031D4, sub_1000054D0);
}

uint64_t sub_1000052E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000044A4(&qword_10000CC18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10000532C()
{
  uint64_t v0;

  sub_100003064(*(_QWORD *)(v0 + 16), v0 + 24, (void (*)(uint64_t))sub_100003368);
}

void sub_100005350(uint64_t a1)
{
  uint64_t v1;

  sub_100002E9C(a1, v1, (uint64_t)&unk_100008880, (uint64_t)sub_1000053D8, (uint64_t)&unk_100008898);
}

void sub_100005380(uint64_t a1)
{
  uint64_t v1;

  sub_1000030C0(a1, *(_QWORD *)(v1 + 16), (uint64_t (*)(void))sub_100002A78, sub_1000054D0);
}

uint64_t sub_1000053AC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  sub_10000456C((_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 56, 7);
}

void sub_1000053D8()
{
  uint64_t v0;

  sub_100003064(*(_QWORD *)(v0 + 16), v0 + 24, (void (*)(uint64_t))sub_1000032A4);
}

uint64_t *sub_1000053FC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000543C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_1000054E4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

uint64_t sub_1000054F0(uint64_t a1)
{
  return swift_allocObject(a1, 24, 7);
}

uint64_t sub_1000054FC(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

uint64_t sub_10000551C()
{
  return type metadata accessor for DispatchQoS(0);
}

id sub_100005550()
{
  return sub_100001D50(1953719636, 0xE400000000000000);
}

id sub_100005564(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_10000556C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  uint64_t v16;

  return swift_dynamicCast(&a9, &a16, v16 + 8, a4, 6);
}

void sub_1000055A0(uint64_t a1@<X8>)
{
  uint64_t v1;

}

double sub_1000055A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16)
{
  uint64_t v16;

  return sub_100003B30((uint64_t)&a11, v16, &a16);
}

id sub_1000055B8(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v2, a2, v3, v4);
}

void sub_1000055C8()
{
  void *v0;

}

uint64_t sub_1000055D0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_10000543C(0, a2, a3);
}

void sub_1000055D8()
{
  void *v0;

}

id sub_1000055E0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_1000055E8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, *(SEL *)(v2 + 1648), v1);
}

uint64_t sub_1000055F8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

void *sub_100005604@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char aBlock, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  a6 = v7;
  a7 = a1;
  return _Block_copy(&aBlock);
}

void *sub_100005610@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

id sub_10000561C(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

NSArray sub_100005624()
{
  return Array._bridgeToObjectiveC()();
}

_QWORD *sub_100005630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return AnyHashable.init<A>(_:)(&a11, &a9);
}

uint64_t sub_10000563C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_100005648@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_unknownObjectWeakInit(v1 + a1, 0);
}

uint64_t sub_100005654@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_unknownObjectWeakLoadStrong(v1 + a1);
}

id sub_10000565C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v9;

  return objc_msgSendSuper2(&a9, a2, v9);
}

uint64_t sub_100005668(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

void sub_100005674()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_10000567C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_10000569C()
{
  uint64_t v0;

  return swift_release(v0);
}

id sub_1000056D0()
{
  void *v0;

  return v0;
}

uint64_t sub_1000056DC()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000056E4()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

void sub_1000056EC(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  id v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  os_log_type_t v74;
  uint64_t v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  id v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  uint64_t v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  unint64_t v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  uint64_t v201;
  uint64_t v202;

  v4 = a3();
  v5 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease(v4);
  v6 = objc_msgSend(v5, "localizedDescription");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  v10 = a1();
  if (v11)
  {
    v12 = v10;
    v13 = v11;
    v185 = v5;
    swift_bridgeObjectRetain(v13);
    v14 = sub_1000056DC();
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (sub_100005B44(v16))
    {
      v17 = sub_100005B34(42);
      v170 = sub_100005B34(96);
      v202 = v170;
      *(_DWORD *)v17 = 136446979;
      swift_bridgeObjectRetain(v13);
      v201 = sub_1000047F8(v12, v13, &v202);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v201, &v202, v17 + 4);
      v18 = sub_100005B64(v13);
      *(_WORD *)(v17 + 12) = 2082;
      v25 = sub_100005B3C(v18, "domain", v19, v20, v21, v22, v23, v24, v170, v185);
      v26 = v7;
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v29 = v28;

      v201 = sub_1000047F8(v27, v29, &v202);
      v30 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v201, &v202, v17 + 14);
      sub_100005B1C(v30, v31, v32, v33, v34, v35, v36, v37, v171, v186);
      sub_100005B1C(v38, v39, v40, v41, v42, v43, v44, v45, v172, v187);
      v46 = swift_bridgeObjectRelease(v29);
      *(_WORD *)(v17 + 22) = 2048;
      v53 = sub_100005B3C(v46, "code", v47, v48, v49, v50, v51, v52, v173, v188);
      sub_100005B1C((int)v53, v54, v55, v56, v57, v58, v59, v60, v174, v189);
      v201 = (uint64_t)v53;
      v63 = sub_100005B54(v61, v62);
      sub_100005B1C(v63, v64, v65, v66, v67, v68, v69, v70, v175, v190);
      *(_WORD *)(v17 + 32) = 2081;
      sub_1000056DC();
      v201 = sub_1000047F8(v26, v9, &v202);
      sub_100005B54(v201, v71);
      sub_100005B64(v9);
      _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v5, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v17, 0x2Au);
      swift_arrayDestroy(v176, 3, (char *)&type metadata for Any + 8);
      v72 = v176;
LABEL_6:
      sub_100005668(v72);
      sub_100005668(v17);

      sub_100005B1C(v128, v129, v130, v131, v132, v133, v134, v135, v176, v191);
      return;
    }
    swift_bridgeObjectRelease_n(v9, 2);
    v136 = v13;
  }
  else
  {
    v185 = v5;
    v73 = sub_1000056DC();
    v15 = Logger.logObject.getter(v73);
    v74 = static os_log_type_t.error.getter();
    if (sub_100005B44(v74))
    {
      v17 = sub_100005B34(32);
      v75 = sub_100005B34(64);
      v202 = v75;
      *(_DWORD *)v17 = 136446723;
      v82 = sub_100005B3C(v75, "domain", v76, v77, v78, v79, v80, v81, v169, v185);
      v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v82);
      v85 = v84;

      v201 = sub_1000047F8(v83, v85, &v202);
      v87 = sub_100005B24(v201, v86);
      sub_100005B1C(v87, v88, v89, v90, v91, v92, v93, v94, v177, v192);
      sub_100005B1C(v95, v96, v97, v98, v99, v100, v101, v102, v178, v193);
      v103 = swift_bridgeObjectRelease(v85);
      *(_WORD *)(v17 + 12) = 2048;
      LODWORD(v83) = sub_100005B3C(v103, "code", v104, v105, v106, v107, v108, v109, v179, v194);
      sub_100005B1C(v83, v110, v111, v112, v113, v114, v115, v116, v180, v195);
      v119 = sub_100005B24(v117, v118);
      sub_100005B1C(v119, v120, v121, v122, v123, v124, v125, v126, v181, v196);
      *(_WORD *)(v17 + 22) = 2081;
      sub_1000056DC();
      v201 = sub_1000047F8(v7, v9, &v202);
      sub_100005B24(v201, v127);
      sub_100005B64(v9);
      _os_log_impl((void *)&_mh_execute_header, v15, (os_log_type_t)v5, "%{public}s (%ld) %{private}s", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy(v75, 2, (char *)&type metadata for Any + 8);
      v72 = v75;
      goto LABEL_6;
    }
    v136 = v9;
  }
  swift_bridgeObjectRelease_n(v136, 2);

  sub_100005B1C(v137, v138, v139, v140, v141, v142, v143, v144, v169, v185);
  sub_100005B1C(v145, v146, v147, v148, v149, v150, v151, v152, v182, v197);
  sub_100005B1C(v153, v154, v155, v156, v157, v158, v159, v160, v183, v198);
  sub_100005B1C(v161, v162, v163, v164, v165, v166, v167, v168, v184, v199);

}

void sub_100005B1C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t sub_100005B24(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v3, v2);
}

uint64_t sub_100005B34(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

id sub_100005B3C(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  return objc_msgSend(a10, a2);
}

BOOL sub_100005B44(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100005B54(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v3, v2);
}

uint64_t sub_100005B64(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 3);
}

void sub_100005B74()
{
  char *v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  Class isa;
  uint64_t v28;
  objc_super v29;

  v2 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for AnnotationRootController();
  objc_msgSendSuper2(&v29, "viewDidLoad");
  v3 = objc_msgSend(v0, "view");
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)&v0[OBJC_IVAR___AnnotationRootController__navigationController];
    v6 = objc_msgSend(v5, "view");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v0, "addChildViewController:", v5);
      objc_msgSend(v4, "addSubview:", v7);
      v8 = (void *)objc_opt_self(NSLayoutConstraint);
      v9 = sub_1000044A4(&qword_10000CC08);
      v10 = swift_allocObject(v9, 64, 7);
      *(_OWORD *)(v10 + 16) = xmmword_100006920;
      v11 = sub_1000062D4(v10, "leftAnchor");
      v12 = sub_1000062CC((uint64_t)v11, "leftAnchor");
      v13 = sub_1000062A8();
      sub_1000062DC();

      *(_QWORD *)(v10 + 32) = v1;
      v15 = sub_1000062D4(v14, "rightAnchor");
      v16 = sub_1000062CC((uint64_t)v15, "rightAnchor");
      v17 = sub_1000062A8();
      sub_1000062DC();

      *(_QWORD *)(v10 + 40) = v1;
      v19 = sub_1000062D4(v18, "topAnchor");
      v20 = sub_1000062CC((uint64_t)v19, "topAnchor");
      v21 = sub_1000062A8();
      sub_1000062DC();

      *(_QWORD *)(v10 + 48) = v1;
      v23 = sub_1000062D4(v22, "bottomAnchor");
      v24 = sub_1000062CC((uint64_t)v23, "bottomAnchor");
      v25 = sub_1000062A8();
      sub_1000062DC();

      *(_QWORD *)(v10 + 56) = v1;
      specialized Array._endMutation()(v26);
      sub_10000543C(0, &qword_10000CC30, NSLayoutConstraint_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v10);
      objc_msgSend(v8, "activateConstraints:", isa);

      objc_msgSend(v5, "didMoveToParentViewController:", v2);
      v28 = *(_QWORD *)&v2[OBJC_IVAR___AnnotationRootController_markupController];
      swift_unknownObjectWeakAssign(v28 + OBJC_IVAR___AnnotationViewController_rootController, v2);
      objc_msgSend(v5, "pushViewController:animated:", v28, 0);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100005E8C(void *a1)
{
  sub_1000023F8(a1);
}

void sub_100005F08(uint64_t a1)
{
  sub_100003564(a1);
}

id sub_100005F98(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;
  objc_super v15;

  v7 = OBJC_IVAR___AnnotationRootController__navigationController;
  v8 = objc_allocWithZone((Class)UINavigationController);
  v9 = v3;
  *(_QWORD *)&v3[v7] = sub_1000062B8();
  v10 = OBJC_IVAR___AnnotationRootController_markupController;
  v11 = type metadata accessor for AnnotationViewController();
  *(_QWORD *)&v4[v10] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v11)), "init");

  if (a2)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for AnnotationRootController();
  v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

id sub_1000060E0(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v4 = OBJC_IVAR___AnnotationRootController__navigationController;
  v5 = objc_allocWithZone((Class)UINavigationController);
  v6 = v1;
  *(_QWORD *)&v1[v4] = sub_1000062B8();
  v7 = OBJC_IVAR___AnnotationRootController_markupController;
  v8 = type metadata accessor for AnnotationViewController();
  *(_QWORD *)&v2[v7] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8)), "init");

  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for AnnotationRootController();
  v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  return v9;
}

id sub_1000061B4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnnotationRootController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnnotationRootController()
{
  return objc_opt_self(AnnotationRootController);
}

id sub_10000623C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_1000062A8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, *(SEL *)(v0 + 1848), v2);
}

id sub_1000062B8()
{
  return sub_10000623C(0, 0, 0);
}

id sub_1000062CC(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_1000062D4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void sub_1000062DC()
{
  void *v0;

}

id objc_msgSend_sidecarController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sidecarController");
}
