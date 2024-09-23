id sub_100004B70(uint64_t a1, uint64_t a2)
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

void sub_100004BE0(uint64_t a1)
{
  sub_100006300(a1, OBJC_IVAR___SketchViewController_cancelButton);
}

void sub_100004BEC(uint64_t a1)
{
  sub_100006300(a1, OBJC_IVAR___SketchViewController_doneButton);
}

void sub_100004BF8(uint64_t a1)
{
  sub_100006300(a1, OBJC_IVAR___SketchViewController_picker);
}

id sub_100004C3C()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___SketchViewController__navigationItem);
}

uint64_t sub_100004C4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR___SketchViewController_observer);
  *(_QWORD *)(v1 + OBJC_IVAR___SketchViewController_observer) = a1;
  return swift_release(v2);
}

void sub_100004C64()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  Class isa;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;

  v1 = type metadata accessor for NSNotificationCenter.Publisher(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SketchViewController();
  v57.receiver = v0;
  v57.super_class = v6;
  v7 = objc_msgSendSuper2(&v57, "viewDidLoad");
  v8 = sub_100006324((uint64_t)v7, "view");
  if (v8)
  {
    v9 = v8;
    v10 = sub_100006150(v0);
    v53 = v2;
    v54 = v1;
    if (v11)
    {
      v12 = v11;
      v13 = String._bridgeToObjectiveC()();
      v10 = swift_bridgeObjectRelease(v12);
    }
    else
    {
      v13 = 0;
    }
    sub_100006388(v10, "setTitle:");

    *((_QWORD *)&v56 + 1) = v6;
    *(_QWORD *)&v55 = v0;
    sub_100006374();
    v14 = v0;
    v15 = sub_100005F1C(1, &v55, (uint64_t)"cancel:");
    v16 = v15;
    sub_100004BE0((uint64_t)v15);
    *((_QWORD *)&v56 + 1) = v6;
    *(_QWORD *)&v55 = v14;
    sub_100006374();
    v17 = (char *)v14;
    v18 = sub_100005F1C(0, &v55, (uint64_t)"done:");
    v19 = v18;
    sub_100004BEC((uint64_t)v18);
    v55 = 0u;
    v56 = 0u;
    sub_100006374();
    v52 = sub_100005F1C(6, &v55, 0);
    objc_msgSend(v52, "setWidth:", 40.0);
    v20 = sub_100006110(&qword_10000CD08);
    v21 = sub_100006340(v20, 40);
    v50 = xmmword_100006F20;
    *(_OWORD *)(v21 + 16) = xmmword_100006F20;
    *(_QWORD *)(v21 + 32) = v16;
    *(_QWORD *)&v55 = v21;
    sub_10000636C();
    v51 = v16;
    sub_100006360((uint64_t)v51, v22, (SEL *)&selRef_setLeftBarButtonItems_);
    v23 = sub_100006340(v20, 40);
    *(_OWORD *)(v23 + 16) = v50;
    *(_QWORD *)(v23 + 32) = v19;
    *(_QWORD *)&v55 = v23;
    sub_10000636C();
    *(_QWORD *)&v50 = v19;
    sub_100006360(v50, v24, (SEL *)&selRef_setRightBarButtonItems_);
    v25 = *(void **)&v17[OBJC_IVAR___SketchViewController_canvas];
    objc_msgSend(v25, "setDelegate:", v17);
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v25);
    objc_opt_self(NSLayoutConstraint);
    v26 = sub_100006340(v20, 64);
    *(_OWORD *)(v26 + 16) = xmmword_100006F30;
    v27 = sub_100006324(v26, "leftAnchor");
    v28 = sub_100006348((uint64_t)v27, "leftAnchor");
    v29 = objc_msgSend(v27, "constraintEqualToAnchor:", v28);

    *(_QWORD *)(v26 + 32) = v29;
    v31 = sub_100006324(v30, "topAnchor");
    v32 = sub_100006348((uint64_t)v31, "topAnchor");
    v33 = sub_10000632C((uint64_t)v32);

    *(_QWORD *)(v26 + 40) = v33;
    v35 = sub_100006348(v34, "rightAnchor");
    v36 = sub_100006324((uint64_t)v35, "rightAnchor");
    v37 = sub_10000632C((uint64_t)v36);

    *(_QWORD *)(v26 + 48) = v37;
    v39 = sub_100006348(v38, "bottomAnchor");
    v40 = sub_100006324((uint64_t)v39, "bottomAnchor");
    v41 = objc_msgSend(v39, "constraintEqualToAnchor:", v40);

    *(_QWORD *)(v26 + 56) = v41;
    *(_QWORD *)&v55 = v26;
    sub_10000636C();
    v42 = v55;
    sub_100006284(0, (unint64_t *)&qword_10000CD10, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    v44 = swift_bridgeObjectRelease(v42);
    sub_100006388(v44, "activateConstraints:");

    v45 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    NSNotificationCenter.publisher(for:object:)(UITextEffectsWindowIsHostedNotification, 0);

    v46 = sub_100006340((uint64_t)&unk_100008440, 24);
    swift_unknownObjectWeakInit(v46 + 16, v17);
    v47 = sub_100006244();
    v48 = v54;
    v49 = Publisher<>.sink(receiveValue:)(sub_10000623C, v46, v54, v47);
    swift_release(v46);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v5, v48);
    sub_100004C4C(v49);
    objc_msgSend(v9, "layoutIfNeeded");

  }
  else
  {
    __break(1u);
  }
}

void sub_10000518C(uint64_t a1, uint64_t a2)
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
    sub_100005210();

  }
}

void sub_100005210()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (!*(_QWORD *)(v0 + OBJC_IVAR___SketchViewController_picker))
  {
    v1 = v0;
    v2 = objc_msgSend(objc_allocWithZone((Class)PKToolPicker), "init");
    v3 = *(void **)(v1 + OBJC_IVAR___SketchViewController_canvas);
    objc_msgSend(v2, "addObserver:", v3);
    objc_msgSend(v2, "setVisible:forFirstResponder:", 1, v3);
    v5 = v2;
    sub_100004BF8((uint64_t)v2);
    objc_msgSend(v3, "becomeFirstResponder");
    v4 = *(_QWORD *)(v1 + OBJC_IVAR___SketchViewController_observer);
    if (v4)
    {
      swift_retain(*(_QWORD *)(v1 + OBJC_IVAR___SketchViewController_observer));
      AnyCancellable.cancel()();
      swift_release(v4);
    }
    sub_100004C4C(0);
    sub_100006314(v5);
  }
}

void sub_100005330()
{
  uint64_t v0;
  void *Strong;
  id v2;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR___SketchViewController_rootController);
  if (Strong)
  {
    v2 = Strong;
    objc_msgSend(Strong, "completeRequest:", 1);

  }
}

void sub_10000538C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *Strong;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double x;
  double y;
  double width;
  double height;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  Class isa;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD aBlock[5];
  _QWORD *v31;
  CGRect v32;

  v1 = type metadata accessor for PKDrawing(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v0 + OBJC_IVAR___SketchViewController_rootController;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR___SketchViewController_rootController);
  if (Strong)
  {
    v8 = Strong;
    v9 = objc_msgSend(Strong, "request");
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(v0 + OBJC_IVAR___SketchViewController_canvas);
      v12 = sub_100005D5C(v11);
      static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

      v32.origin.x = sub_100005D90(v11);
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      if (CGRectIsEmpty(v32))
      {
        objc_msgSend(v10, "cancel");

      }
      else
      {
        v18 = sub_100005DF8(v11);
        v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v21 = v20;

        v29 = objc_msgSend(objc_allocWithZone((Class)PKImageRenderer), "initWithSize:scale:", width, height, 1.0);
        isa = PKDrawing._bridgeToObjectiveC()().super.isa;
        v23 = (_QWORD *)sub_100006340((uint64_t)&unk_1000083F0, 40);
        v23[2] = v19;
        v23[3] = v21;
        v23[4] = v10;
        aBlock[4] = sub_100005EB4;
        v31 = v23;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000058B4;
        aBlock[3] = &unk_100008408;
        v24 = _Block_copy(aBlock);
        v25 = v31;
        sub_100005ED8(v19, v21);
        v26 = v10;
        swift_release(v25);
        v27 = v29;
        objc_msgSend(v29, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", isa, v24, x, y, width, height, 1.0);
        _Block_release(v24);

        sub_100005E70(v19, v21);
      }
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      return;
    }

  }
  v17 = (void *)swift_unknownObjectWeakLoadStrong(v6);
  if (v17)
  {
    v29 = v17;
    objc_msgSend(v17, "completeRequest:", 0);

  }
}

void sub_10000563C(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  UIImage *v13;
  NSData *v14;
  NSData *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  Class isa;
  void *v38;
  unint64_t v39;

  v8 = type metadata accessor for UTType(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a1)
  {
    v13 = a1;
    v14 = UIImagePNGRepresentation(v13);
    if (v14)
    {
      v15 = v14;
      v38 = a4;
      v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v18 = v17;

      v19 = sub_100005ED8(v16, v18);
      v20 = static UTType.png.getter(v19);
      v21 = UTType.identifier.getter(v20);
      v23 = v22;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      v24 = objc_allocWithZone((Class)SidecarItem);
      v25 = sub_10000601C(v16, v18, v21, v23);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v27 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v26 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v27 >= v26 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
      v28 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v25);
      specialized Array._endMutation()(v28);

      sub_100005E70(v16, v18);
      a4 = v38;
    }
    else
    {

    }
  }
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(PKAppleDrawingTypeIdentifier);
  v31 = v30;
  objc_allocWithZone((Class)SidecarItem);
  sub_100005ED8(a2, a3);
  v32 = sub_10000601C(a2, a3, v29, v31);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v34 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v33 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v34 >= v33 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
  v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v32);
  specialized Array._endMutation()(v35);
  v36 = v39;
  sub_100006284(0, &qword_10000CCF0, SidecarItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v36);
  objc_msgSend(a4, "sendItems:", isa);

}

void sub_1000058B4(uint64_t a1, void *a2)
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

uint64_t sub_100005914(void *a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  id v7;
  uint64_t v8;
  id v9;
  _OWORD v11[2];

  if (a3)
  {
    v7 = a1;
    v8 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v8);
    v9 = (id)swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v9 = a1;
  }
  a4(v9);

  return sub_1000060D0((uint64_t)v11);
}

id sub_100005988(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;
  objc_super v15;

  sub_10000637C(OBJC_IVAR___SketchViewController_rootController);
  v6 = OBJC_IVAR___SketchViewController__undoManager;
  v7 = objc_allocWithZone((Class)NSUndoManager);
  v8 = v3;
  v9 = objc_msgSend(v7, "init");
  *(_QWORD *)&v3[v6] = v9;
  v10 = OBJC_IVAR___SketchViewController__navigationItem;
  sub_100006394((uint64_t)v9, &qword_10000CCF8, UINavigationItem_ptr);
  *(_QWORD *)&v8[v10] = sub_100006350();
  *(_QWORD *)&v8[OBJC_IVAR___SketchViewController_cancelButton] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___SketchViewController_doneButton] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___SketchViewController_fixedSpace] = 0;
  v11 = OBJC_IVAR___SketchViewController_canvas;
  *(_QWORD *)&v8[v11] = objc_msgSend(objc_allocWithZone((Class)PKCanvasView), "init");
  *(_QWORD *)&v8[OBJC_IVAR___SketchViewController_picker] = 0;
  *(_QWORD *)&v8[OBJC_IVAR___SketchViewController_observer] = 0;

  if (a2)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for SketchViewController();
  v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

id sub_100005B40(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  sub_10000637C(OBJC_IVAR___SketchViewController_rootController);
  v3 = OBJC_IVAR___SketchViewController__undoManager;
  v4 = objc_allocWithZone((Class)NSUndoManager);
  v5 = v1;
  v6 = sub_100006348((uint64_t)v5, "init");
  *(_QWORD *)&v1[v3] = v6;
  v7 = OBJC_IVAR___SketchViewController__navigationItem;
  sub_100006394((uint64_t)v6, &qword_10000CCF8, UINavigationItem_ptr);
  *(_QWORD *)&v5[v7] = sub_100006350();
  *(_QWORD *)&v5[OBJC_IVAR___SketchViewController_cancelButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___SketchViewController_doneButton] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___SketchViewController_fixedSpace] = 0;
  v8 = OBJC_IVAR___SketchViewController_canvas;
  *(_QWORD *)&v5[v8] = objc_msgSend(objc_allocWithZone((Class)PKCanvasView), "init");
  *(_QWORD *)&v5[OBJC_IVAR___SketchViewController_picker] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___SketchViewController_observer] = 0;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for SketchViewController();
  v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  return v9;
}

id sub_100005C80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SketchViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SketchViewController()
{
  return objc_opt_self(SketchViewController);
}

id sub_100005D5C(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "drawing"));

  return v2;
}

double sub_100005D90(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "drawing"));
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

id sub_100005DF8(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "drawing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataRepresentation"));

  return v3;
}

uint64_t sub_100005E44()
{
  uint64_t v0;

  sub_100005E70(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005E70(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_100005EB4(void *a1)
{
  uint64_t v1;

  sub_10000563C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100005EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005ED0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100005ED8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

id sub_100005F1C(uint64_t a1, _QWORD *a2, uint64_t a3)
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
    v8 = sub_1000062BC(a2, a2[3]);
    v9 = *(_QWORD *)(v6 - 8);
    __chkstk_darwin(v8, v8);
    v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = _bridgeAnythingToObjectiveC<A>(_:)(v11, v6);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    sub_1000062E0(a2);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", a1, v12, a3);
  swift_unknownObjectRelease(v12);
  return v13;
}

id sub_10000601C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  Class isa;
  NSString v9;
  id v10;

  if (a2 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000060BC(a1, a2);
  }
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v10 = objc_msgSend(v4, "initWithData:type:", isa, v9);

  return v10;
}

uint64_t sub_1000060BC(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100005E70(result, a2);
  return result;
}

uint64_t sub_1000060D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006110(&qword_10000CD00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006110(uint64_t *a1)
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

uint64_t sub_100006150(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "title");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

void sub_1000061B0(uint64_t a1, void *a2, SEL *a3)
{
  Class isa;

  sub_100006394(a1, (unint64_t *)&unk_10000CD20, UIBarButtonItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  objc_msgSend(a2, *a3, isa);
  sub_100006314(isa);
}

uint64_t sub_100006218()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000623C(uint64_t a1)
{
  uint64_t v1;

  sub_10000518C(a1, v1);
}

unint64_t sub_100006244()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CD18;
  if (!qword_10000CD18)
  {
    v1 = type metadata accessor for NSNotificationCenter.Publisher(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSNotificationCenter.Publisher, v1);
    atomic_store(result, (unint64_t *)&qword_10000CD18);
  }
  return result;
}

uint64_t sub_100006284(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

_QWORD *sub_1000062BC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000062E0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_100006300(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

void sub_10000630C(uint64_t a1@<X8>)
{
  uint64_t v1;

}

void sub_100006314(id a1)
{

}

id sub_100006324(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_10000632C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  return objc_msgSend(v2, *(SEL *)(v1 + 2264), a1);
}

uint64_t sub_100006340(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

id sub_100006348(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100006350()
{
  return sub_100004B70(0, 0xE000000000000000);
}

void sub_100006360(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v4;

  sub_1000061B0(v3, v4, a3);
}

uint64_t sub_10000636C()
{
  return specialized Array._endMutation()();
}

id sub_100006374()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 280));
}

uint64_t sub_10000637C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_unknownObjectWeakInit(v1 + a1, 0);
}

id sub_100006388(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_100006394(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_100006284(0, a2, a3);
}

void sub_1000063A4()
{
  char *v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  Class isa;
  uint64_t v29;
  objc_super v30;

  v2 = v0;
  v30.receiver = v0;
  v30.super_class = (Class)type metadata accessor for SketchRootController();
  objc_msgSendSuper2(&v30, "viewDidLoad");
  v3 = objc_msgSend(v0, "view");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

    v6 = *(void **)&v2[OBJC_IVAR___SketchRootController__navigationController];
    v7 = objc_msgSend(v6, "view");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v2, "addChildViewController:", v6);
      objc_msgSend(v4, "addSubview:", v8);
      v9 = (void *)objc_opt_self(NSLayoutConstraint);
      v10 = sub_100006110(&qword_10000CD08);
      v11 = swift_allocObject(v10, 64, 7);
      *(_OWORD *)(v11 + 16) = xmmword_100006F30;
      v12 = sub_100006A5C(v11, "leftAnchor");
      v13 = sub_100006A6C((uint64_t)v12, "leftAnchor");
      v14 = sub_100006A38();
      sub_100006A64();

      *(_QWORD *)(v11 + 32) = v1;
      v16 = sub_100006A5C(v15, "rightAnchor");
      v17 = sub_100006A6C((uint64_t)v16, "rightAnchor");
      v18 = sub_100006A38();
      sub_100006A64();

      *(_QWORD *)(v11 + 40) = v1;
      v20 = sub_100006A5C(v19, "topAnchor");
      v21 = sub_100006A6C((uint64_t)v20, "topAnchor");
      v22 = sub_100006A38();
      sub_100006A64();

      *(_QWORD *)(v11 + 48) = v1;
      v24 = sub_100006A5C(v23, "bottomAnchor");
      v25 = sub_100006A6C((uint64_t)v24, "bottomAnchor");
      v26 = sub_100006A38();
      sub_100006A64();

      *(_QWORD *)(v11 + 56) = v1;
      specialized Array._endMutation()(v27);
      sub_1000069FC();
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v11);
      objc_msgSend(v9, "activateConstraints:", isa);

      v29 = *(_QWORD *)&v2[OBJC_IVAR___SketchRootController_sketchController];
      swift_unknownObjectWeakAssign(v29 + OBJC_IVAR___SketchViewController_rootController, v2);
      objc_msgSend(v6, "pushViewController:animated:", v29, 0);
      objc_msgSend(v6, "didMoveToParentViewController:", v2);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_1000066EC(uint64_t a1, uint64_t a2, void *a3)
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

  v7 = OBJC_IVAR___SketchRootController__navigationController;
  v8 = objc_allocWithZone((Class)UINavigationController);
  v9 = v3;
  *(_QWORD *)&v3[v7] = sub_100006A48();
  v10 = OBJC_IVAR___SketchRootController_sketchController;
  v11 = type metadata accessor for SketchViewController();
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
  v15.super_class = (Class)type metadata accessor for SketchRootController();
  v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

id sub_100006834(void *a1)
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

  v4 = OBJC_IVAR___SketchRootController__navigationController;
  v5 = objc_allocWithZone((Class)UINavigationController);
  v6 = v1;
  *(_QWORD *)&v1[v4] = sub_100006A48();
  v7 = OBJC_IVAR___SketchRootController_sketchController;
  v8 = type metadata accessor for SketchViewController();
  *(_QWORD *)&v2[v7] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8)), "init");

  v11.receiver = v2;
  v11.super_class = (Class)type metadata accessor for SketchRootController();
  v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  return v9;
}

id sub_100006908()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SketchRootController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SketchRootController()
{
  return objc_opt_self(SketchRootController);
}

id sub_100006990(uint64_t a1, uint64_t a2, void *a3)
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

unint64_t sub_1000069FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CD10;
  if (!qword_10000CD10)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CD10);
  }
  return result;
}

id sub_100006A38()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, *(SEL *)(v2 + 2264), v1);
}

id sub_100006A48()
{
  return sub_100006990(0, 0, 0);
}

id sub_100006A5C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void sub_100006A64()
{
  void *v0;

}

id sub_100006A6C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataRepresentation");
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawing");
}
