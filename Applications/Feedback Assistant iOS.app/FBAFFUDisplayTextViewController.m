@implementation FBAFFUDisplayTextViewController

- (UITextView)textView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_textView, a2);
}

- (void)setTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_textView, a3);
}

- (void)viewDidLoad
{
  _TtC18Feedback_Assistant31FBAFFUDisplayTextViewController *v2;

  v2 = self;
  sub_1000739E0();

}

- (void)didTapDone
{
  -[FBAFFUDisplayTextViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC18Feedback_Assistant31FBAFFUDisplayTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSString v10;
  _QWORD *v11;
  id v12;
  _TtC18Feedback_Assistant31FBAFFUDisplayTextViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_textView, 0);
    v8 = (Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText);
    *v8 = 0;
    v8[1] = 0xE000000000000000;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_textView, 0);
    v11 = (Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText);
    *v11 = 0;
    v11[1] = 0xE000000000000000;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for FBAFFUDisplayTextViewController();
  v13 = -[FBAFFUDisplayTextViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC18Feedback_Assistant31FBAFFUDisplayTextViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_super v7;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_textView, 0);
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FBAFFUDisplayTextViewController();
  return -[FBAFFUDisplayTextViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_textView);
  swift_bridgeObjectRelease(*(_QWORD *)&self->textView[OBJC_IVAR____TtC18Feedback_Assistant31FBAFFUDisplayTextViewController_displayText]);
}

@end
