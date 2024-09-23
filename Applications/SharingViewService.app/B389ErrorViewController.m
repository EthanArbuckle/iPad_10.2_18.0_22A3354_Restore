@implementation B389ErrorViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService23B389ErrorViewController *v2;

  v2 = self;
  sub_10009C64C();

}

- (_TtC18SharingViewService23B389ErrorViewController)initWithContentView:(id)a3
{
  id v3;
  _TtC18SharingViewService23B389ErrorViewController *result;

  v3 = a3;
  result = (_TtC18SharingViewService23B389ErrorViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.B389ErrorViewController", 42, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService23B389ErrorViewController_mainController], a2);
  swift_errorRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService23B389ErrorViewController_error]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService23B389ErrorViewController_buttons]);
}

@end
