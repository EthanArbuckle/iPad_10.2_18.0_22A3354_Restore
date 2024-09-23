@implementation ProgressViewServiceUIViewController

- (void)viewDidLoad
{
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProgressViewServiceUIViewController();
  v2 = (char *)v5.receiver;
  -[ProgressViewServiceUIViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = *(char **)&v2[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler + 8];
    sub_10002839C(*(void **)&v2[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler], v4);
    sub_100020014(v3, v4);

    swift_release(v4);
    v2 = v3;
  }

}

- (_TtC21TDGSharingViewService35ProgressViewServiceUIViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_class *v6;
  objc_super v8;

  v5 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler];
  v6 = (objc_class *)type metadata accessor for ProgressViewServiceUIViewController();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ViewServiceUIViewControllerExtendedHeight initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100028370(*(void **)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler], *(_QWORD *)&self->super.layoutCache[OBJC_IVAR____TtC21TDGSharingViewService35ProgressViewServiceUIViewController_actionHandler]);
}

@end
