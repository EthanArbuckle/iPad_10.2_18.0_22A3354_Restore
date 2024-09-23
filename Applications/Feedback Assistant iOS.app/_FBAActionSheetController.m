@implementation _FBAActionSheetController

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC18Feedback_Assistant25_FBAActionSheetController *)sub_100071514((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100071270);
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant25_FBAActionSheetController *v2;

  v2 = self;
  sub_1000715C4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant25_FBAActionSheetController *v5;

  v4 = a3;
  v5 = self;
  sub_100072A8C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18Feedback_Assistant25_FBAActionSheetController *v4;

  v4 = self;
  sub_100071774(a3);

}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  sub_100071C40(self, (int)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1000E98B0, (uint64_t)sub_10006FB04, sub_100071B24);
}

- (void)addAction:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant25_FBAActionSheetController *v5;

  v4 = a3;
  v5 = self;
  sub_100071CFC(v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v9;
  id v10;
  _TtC18Feedback_Assistant25_FBAActionSheetController *v11;
  _BYTE v12[24];

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions, v12, 0, 0);
  v6 = *v5;
  if (!((unint64_t)v6 >> 62))
    return *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v6 < 0)
    v9 = v6;
  else
    v9 = v6 & 0xFFFFFFFFFFFFFF8;
  v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain(v6);
  v7 = _CocoaArrayWrapper.endIndex.getter(v9);

  swift_bridgeObjectRelease(v6);
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 5.0;
  if (!a4)
    return 15.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 5.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant25_FBAActionSheetController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100072BC4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant25_FBAActionSheetController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100072048(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)dismissSelf
{
  -[_FBAActionSheetController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithStyle:(int64_t)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions) = (Class)_swiftEmptyArrayStorage;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerTitle);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerSubtitle);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _FBAActionSheetController();
  return -[_FBAActionSheetController initWithStyle:](&v7, "initWithStyle:", a3);
}

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18Feedback_Assistant25_FBAActionSheetController *)sub_100072458(v5, v7, a4);
}

- (_TtC18Feedback_Assistant25_FBAActionSheetController)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions) = (Class)_swiftEmptyArrayStorage;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerTitle);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerSubtitle);
  *v5 = 0;
  v5[1] = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _FBAActionSheetController();
  return -[_FBAActionSheetController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10007261C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_actions, &OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerTitle, &OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_headerSubtitle);
}

@end
