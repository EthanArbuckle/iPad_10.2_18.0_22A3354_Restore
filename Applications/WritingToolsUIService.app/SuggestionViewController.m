@implementation SuggestionViewController

- (_TtC21WritingToolsUIService24SuggestionViewController)initWithCoder:(id)a3
{
  _TtC21WritingToolsUIService24SuggestionViewController *result;

  result = (_TtC21WritingToolsUIService24SuggestionViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000AB400, "WritingToolsUIService/SuggestionViewController.swift", 52, 2, 23, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC21WritingToolsUIService24SuggestionViewController *v2;

  v2 = self;
  sub_1000048C0();

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void (*v5)(id);
  _TtC21WritingToolsUIService24SuggestionViewController *v6;

  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC21WritingToolsUIService24SuggestionViewController_preferredContentSizeHandler);
  swift_unknownObjectRetain(a3, a2);
  v6 = self;
  v5(objc_msgSend(a3, "preferredContentSize"));
  swift_unknownObjectRelease(a3);

}

- (_TtC21WritingToolsUIService24SuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC21WritingToolsUIService24SuggestionViewController *result;

  v4 = a4;
  result = (_TtC21WritingToolsUIService24SuggestionViewController *)_swift_stdlib_reportUnimplementedInitializer("WritingToolsUIService.SuggestionViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  swift_release(*(_QWORD *)&self->preferredContentSizeHandler[OBJC_IVAR____TtC21WritingToolsUIService24SuggestionViewController_preferredContentSizeHandler], a2);
  v3 = (char *)self + OBJC_IVAR____TtC21WritingToolsUIService24SuggestionViewController_suggestionView;
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC21WritingToolsUIService24SuggestionViewController_suggestionView);
  v5 = *((_QWORD *)v3 + 1);
  v6 = (void *)*((_QWORD *)v3 + 2);

  swift_release(v4, v7);
  swift_release(v5, v8);
}

@end
