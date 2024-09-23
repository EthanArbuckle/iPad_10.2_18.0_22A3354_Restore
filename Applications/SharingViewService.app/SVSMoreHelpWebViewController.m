@implementation SVSMoreHelpWebViewController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *Strong;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  v4 = (char *)v7.receiver;
  -[SVSMoreHelpWebViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate]);
  if (Strong)
  {
    v6 = Strong;
    objc_msgSend(Strong, "didRejectForInterventionViewController:", 0, v7.receiver, v7.super_class);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)init
{
  objc_super v4;

  swift_unknownObjectWeakInit(&self->SCUIMoreHelpWebViewController_opaque[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate], 0);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  return -[SVSMoreHelpWebViewController init](&v4, "init");
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v8;

  swift_unknownObjectWeakInit(&self->SCUIMoreHelpWebViewController_opaque[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate], 0);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  return -[SVSMoreHelpWebViewController initWithNavigationBarClass:toolbarClass:](&v8, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithRootViewController:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit(&self->SCUIMoreHelpWebViewController_opaque[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate], 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  return -[SVSMoreHelpWebViewController initWithRootViewController:](&v6, "initWithRootViewController:", a3);
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18SharingViewService28SVSMoreHelpWebViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    swift_unknownObjectWeakInit(&self->SCUIMoreHelpWebViewController_opaque[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate], 0);
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectWeakInit(&self->SCUIMoreHelpWebViewController_opaque[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate], 0);
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  v11 = -[SVSMoreHelpWebViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService28SVSMoreHelpWebViewController *)sub_10009B5A8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithType:(int64_t)a3
{
  return (_TtC18SharingViewService28SVSMoreHelpWebViewController *)sub_10009B5A8((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_initWithType_);
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_100006A6C(&qword_1001A3618);
  __chkstk_darwin(v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC18SharingViewService28SVSMoreHelpWebViewController *)sub_10009B608((uint64_t)v6);
}

- (void).cxx_destruct
{
  sub_100013338((uint64_t)&self->SCUIMoreHelpWebViewController_opaque[OBJC_IVAR____TtC18SharingViewService28SVSMoreHelpWebViewController_interventionDelegate], (uint64_t)a2);
}

@end
