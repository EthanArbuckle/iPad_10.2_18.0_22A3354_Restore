@implementation FBAFilterPickerController

- (_TtC18Feedback_Assistant16FBAFilterManager)filterManager
{
  return (_TtC18Feedback_Assistant16FBAFilterManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                               + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager));
}

- (void)setFilterManager:(id)a3
{
  void *v4;
  id v5;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = (Class)a3;
  v5 = a3;
  v6 = self;

  v7 = -[FBAFilterPickerController tableView](v6, "tableView");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "reloadData");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant25FBAFilterPickerController *v2;

  v2 = self;
  sub_100055DD8();

}

- (void)dismissSelf
{
  -[FBAFilterPickerController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v9;
  int64_t v10;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC18Feedback_Assistant16FBAFilterManager_filterGroups);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v7;
  unint64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_10005677C(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10005610C(v11, (unint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100056884((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_1000569A0(a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAFilterPickerController();
  return -[FBAFilterPickerController initWithStyle:](&v5, "initWithStyle:", a3);
}

- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18Feedback_Assistant25FBAFilterPickerController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FBAFilterPickerController();
  v11 = -[FBAFilterPickerController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18Feedback_Assistant25FBAFilterPickerController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAFilterPickerController();
  return -[FBAFilterPickerController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant25FBAFilterPickerController_filterManager));
}

@end
