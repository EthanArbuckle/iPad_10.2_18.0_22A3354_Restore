@implementation DebugFormatMainViewController

- (void)dealloc
{
  _TtC8NewsFeed29DebugFormatMainViewController *v2;

  v2 = self;
  sub_1BB217044();
}

- (void).cxx_destruct
{
  _BYTE v3[336];

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_socketServer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_inventoryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_inventoryContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_editorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_editorContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_layoutViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_bindingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_compilerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_testViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_containerSegmentedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_logViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_debuggerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_consoleViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_fileViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_sourceViewController));
  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_packages, sizeof(v3));
  sub_1BAF8FB4C((uint64_t)v3);
}

- (_TtC8NewsFeed29DebugFormatMainViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _TtC8NewsFeed29DebugFormatMainViewController *result;
  _BYTE __dst[336];

  v4 = OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_packages;
  v5 = qword_1EF2A7490;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  memcpy(__dst, &byte_1EF3D09C0, sizeof(__dst));
  memmove((char *)self + v4, &byte_1EF3D09C0, 0x150uLL);
  sub_1BAF8EA94((uint64_t)__dst);

  result = (_TtC8NewsFeed29DebugFormatMainViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed29DebugFormatMainViewController *v2;

  v2 = self;
  sub_1BB2176F4();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[DebugFormatMainViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  objc_msgSend(*(id *)(*(_QWORD *)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_socketServer]+ OBJC_IVAR____TtC8NewsFeed23DebugFormatSocketServer_reloadOperationQueue), sel_setSuspended_, 0, v3.receiver, v3.super_class);

}

- (_TtC8NewsFeed29DebugFormatMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed29DebugFormatMainViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed29DebugFormatMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed29DebugFormatMainViewController)initWithStyle:(int64_t)a3
{
  _TtC8NewsFeed29DebugFormatMainViewController *result;

  result = (_TtC8NewsFeed29DebugFormatMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)primaryViewControllerForCollapsingSplitViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_consoleViewController));
}

- (id)primaryViewControllerForExpandingSplitViewController:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatMainViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1BB219D50();

  return v6;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC8NewsFeed29DebugFormatMainViewController_consoleViewController));
}

@end
