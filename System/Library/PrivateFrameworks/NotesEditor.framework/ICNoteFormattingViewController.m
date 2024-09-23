@implementation ICNoteFormattingViewController

- (ICNoteFormattingViewControllerDelegate)formattingDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ICNoteFormattingViewController_formattingDelegate;
  swift_beginAccess();
  return (ICNoteFormattingViewControllerDelegate *)(id)MEMORY[0x1DF0DF9A8](v2);
}

- (void)setFormattingDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (ICNoteFormattingViewController)init
{
  return (ICNoteFormattingViewController *)NoteFormattingViewController.init()();
}

- (ICNoteFormattingViewController)initWithCoder:(id)a3
{
  return (ICNoteFormattingViewController *)sub_1DD96AE50(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  ICNoteFormattingViewController *v4;

  v4 = self;
  sub_1DD96AEFC(a3);

}

- (void)updateWithDataSource:(id)a3 ignoreTypingAttributes:(BOOL)a4
{
  ICNoteFormattingViewController *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_1DD96B01C(a3, a4);
  swift_unknownObjectRelease();

}

- (ICNoteFormattingViewController)initWithConfiguration:(id)a3
{
  id v3;
  ICNoteFormattingViewController *result;

  v3 = a3;
  result = (ICNoteFormattingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICNoteFormattingViewController_formattingDelegate);
  swift_bridgeObjectRelease();
}

@end
