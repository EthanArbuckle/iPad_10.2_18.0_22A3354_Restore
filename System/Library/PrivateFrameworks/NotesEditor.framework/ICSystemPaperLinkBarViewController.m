@implementation ICSystemPaperLinkBarViewController

- (ICSystemPaperLinkBarViewController)initWithNoteEditorViewController:(id)a3 textView:(id)a4
{
  return (ICSystemPaperLinkBarViewController *)SystemPaperLinkBarViewController.init(noteEditorViewController:textView:)(a3, a4);
}

- (ICSystemPaperLinkBarViewController)initWithCoder:(id)a3
{
  sub_1DD98FD4C(a3);
}

- (void)updateLinkBarLayers
{
  ICSystemPaperLinkBarViewController *v2;

  v2 = self;
  sub_1DD98FE64();

}

- (void)viewDidLoad
{
  ICSystemPaperLinkBarViewController *v2;

  v2 = self;
  sub_1DD990178();

}

- (void)viewDidLayoutSubviews
{
  ICSystemPaperLinkBarViewController *v2;

  v2 = self;
  sub_1DD991474();

}

- (void)didTapAddLinkButtonWithButton:(id)a3
{
  id v4;
  ICSystemPaperLinkBarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD9915B8(v4);

}

- (void)refresh
{
  ICSystemPaperLinkBarViewController *v2;

  v2 = self;
  sub_1DD993300();

}

- (ICSystemPaperLinkBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICSystemPaperLinkBarViewController *result;

  v4 = a4;
  result = (ICSystemPaperLinkBarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_linkController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_addLinkClient));
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_linkDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperLinkBarViewController_addLinkButton));
  swift_bridgeObjectRelease();
}

@end
