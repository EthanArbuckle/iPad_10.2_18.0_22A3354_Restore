@implementation FBKActionSheetController

- (BOOL)dismissesOnAction
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController);
  if (v2)
    LOBYTE(self) = *(_BYTE *)(v2 + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_dismissesOnAction);
  else
    __break(1u);
  return (char)self;
}

- (void)setDismissesOnAction:(BOOL)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController);
  if (v3)
    *(_BYTE *)(v3 + OBJC_IVAR____TtC12FeedbackCore25_FBKActionSheetController_dismissesOnAction) = a3;
  else
    __break(1u);
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithTitle:(id)a3 subtitle:(id)a4 actions:(id)a5
{
  return (_TtC12FeedbackCore24FBKActionSheetController *)sub_21DA621EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21DA61634);
}

- (void)viewDidLoad
{
  _TtC12FeedbackCore24FBKActionSheetController *v2;

  v2 = self;
  sub_21DA61738();

}

- (void)addActionWithTitle:(id)a3 image:(id)a4 actionHandler:(id)a5
{
  sub_21DA62918(self, (int)a2, (int)a3, a4, a5, (uint64_t)&unk_24E15CA50, (uint64_t)sub_21DA637D4, sub_21DA61824);
}

- (void)addAction:(id)a3
{
  void *v3;
  id v5;
  _TtC12FeedbackCore24FBKActionSheetController *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    sub_21DA629D4(v5);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBKActionSheetController();
  return -[FBKActionSheetController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithRootViewController:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKActionSheetController();
  return -[FBKActionSheetController initWithRootViewController:](&v5, sel_initWithRootViewController_, a3);
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC12FeedbackCore24FBKActionSheetController *v9;
  objc_super v11;

  if (a3)
  {
    sub_21DAC481C();
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
    v6 = a4;
    v7 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKActionSheetController();
  v9 = -[FBKActionSheetController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC12FeedbackCore24FBKActionSheetController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBKActionSheetController();
  return -[FBKActionSheetController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore24FBKActionSheetController_actionSheetController));
}

@end
