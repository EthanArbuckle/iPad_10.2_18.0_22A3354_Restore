@implementation DebugFormatUploadMainViewController

- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithCoder:(id)a3
{
  _TtC8NewsFeed35DebugFormatUploadMainViewController *result;

  result = (_TtC8NewsFeed35DebugFormatUploadMainViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[DebugFormatUploadMainViewController viewDidLoad](&v3, sel_viewDidLoad);
  swift_retain();
  sub_1BB86E4AC();
  swift_release();
  sub_1BB86E4B8();

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[DebugFormatUploadMainViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  objc_msgSend(*(id *)(*(_QWORD *)&v4[OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_editor]+ OBJC_IVAR____TtC8NewsFeed17DebugFormatEditor_uploaderOperationQueue), sel_cancelAllOperations, v5.receiver, v5.super_class);

}

- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed35DebugFormatUploadMainViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed35DebugFormatUploadMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed35DebugFormatUploadMainViewController)initWithStyle:(int64_t)a3
{
  _TtC8NewsFeed35DebugFormatUploadMainViewController *result;

  result = (_TtC8NewsFeed35DebugFormatUploadMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_uploadNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_uploadDiffNavigationController));
  swift_release();
}

- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadMainViewController_uploadDiffNavigationController));
}

- (id)primaryViewControllerForExpandingSplitViewController:(id)a3
{
  id v4;
  _TtC8NewsFeed35DebugFormatUploadMainViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BA969C0C();

  return v6;
}

@end
