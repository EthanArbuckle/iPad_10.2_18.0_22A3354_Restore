@implementation ANFIssueTableOfContentsViewController

- (_TtC12NewsArticles37ANFIssueTableOfContentsViewController)initWithCoder:(id)a3
{
  _TtC12NewsArticles37ANFIssueTableOfContentsViewController *result;

  result = (_TtC12NewsArticles37ANFIssueTableOfContentsViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12NewsArticles37ANFIssueTableOfContentsViewController *v2;

  v2 = self;
  sub_1B9EC0000();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[ANFIssueTableOfContentsViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (_TtC12NewsArticles37ANFIssueTableOfContentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles37ANFIssueTableOfContentsViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles37ANFIssueTableOfContentsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles37ANFIssueTableOfContentsViewController_viewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles37ANFIssueTableOfContentsViewController_issue));
}

- (unint64_t)viewingLocation
{
  return 3;
}

@end
