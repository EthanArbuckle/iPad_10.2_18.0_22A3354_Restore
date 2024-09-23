@implementation FBAActionSheetController

- (BOOL)dismissesOnAction
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController);
  if (v2)
    LOBYTE(self) = *(_BYTE *)(v2 + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction);
  else
    __break(1u);
  return (char)self;
}

- (void)setDismissesOnAction:(BOOL)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController);
  if (v3)
    *(_BYTE *)(v3 + OBJC_IVAR____TtC18Feedback_Assistant25_FBAActionSheetController_dismissesOnAction) = a3;
  else
    __break(1u);
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC18Feedback_Assistant24FBAActionSheetController *)sub_100071514((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100070CF4);
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant24FBAActionSheetController *v2;

  v2 = self;
  sub_100070DF8();

}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  sub_100071C40(self, (int)a2, (uint64_t)a3, a4, a5, (uint64_t)&unk_1000E98D8, (uint64_t)sub_100072DC8, sub_100070EC4);
}

- (void)addAction:(id)a3
{
  void *v3;
  id v5;
  _TtC18Feedback_Assistant24FBAActionSheetController *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    sub_100071CFC(v5);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAActionSheetController();
  return -[FBAActionSheetController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithRootViewController:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAActionSheetController();
  return -[FBAActionSheetController initWithRootViewController:](&v5, "initWithRootViewController:", a3);
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18Feedback_Assistant24FBAActionSheetController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FBAActionSheetController();
  v11 = -[FBAActionSheetController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18Feedback_Assistant24FBAActionSheetController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBAActionSheetController();
  return -[FBAActionSheetController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant24FBAActionSheetController_actionSheetController));
}

@end
