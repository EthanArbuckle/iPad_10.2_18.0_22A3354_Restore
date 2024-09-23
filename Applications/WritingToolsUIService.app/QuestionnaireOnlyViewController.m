@implementation QuestionnaireOnlyViewController

- (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController)initWithCoder:(id)a3
{
  _TtC21WritingToolsUIService31QuestionnaireOnlyViewController *result;

  result = (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000AB400, "WritingToolsUIService/QuestionnaireOnlyViewController.swift", 59, 2, 26, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC21WritingToolsUIService31QuestionnaireOnlyViewController *v2;

  v2 = self;
  sub_100034BE8();

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void (*v5)(id);
  _TtC21WritingToolsUIService31QuestionnaireOnlyViewController *v6;

  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC21WritingToolsUIService31QuestionnaireOnlyViewController_preferredContentSizeHandler);
  swift_unknownObjectRetain(a3, a2);
  v6 = self;
  v5(objc_msgSend(a3, "preferredContentSize"));
  swift_unknownObjectRelease(a3);

}

- (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC21WritingToolsUIService31QuestionnaireOnlyViewController *result;

  v4 = a4;
  result = (_TtC21WritingToolsUIService31QuestionnaireOnlyViewController *)_swift_stdlib_reportUnimplementedInitializer("WritingToolsUIService.QuestionnaireOnlyViewController", 53, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_release(*(_QWORD *)&self->preferredContentSizeHandler[OBJC_IVAR____TtC21WritingToolsUIService31QuestionnaireOnlyViewController_preferredContentSizeHandler], a2);
  swift_release(*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC21WritingToolsUIService31QuestionnaireOnlyViewController_questionnaireModel), v3);
}

@end
