@implementation B389CustomNameViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService28B389CustomNameViewController *v2;

  v2 = self;
  sub_100090CB4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v5.receiver;
  -[B389CustomNameViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC18SharingViewService28B389CustomNameViewController_nameField], "becomeFirstResponder", v5.receiver, v5.super_class);

}

- (void)updateContinueButton
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  _TtC18SharingViewService28B389CustomNameViewController *v11;

  v2 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B389CustomNameViewController_continueAction];
  v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B389CustomNameViewController_nameField];
  v11 = self;
  v4 = objc_msgSend(v3, "text");
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

    v9 = String.count.getter(v6, v8);
    swift_bridgeObjectRelease(v8);
    v10 = v9 > 0;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v2, "setEnabled:", v10);

}

- (_TtC18SharingViewService28B389CustomNameViewController)initWithContentView:(id)a3
{
  id v3;
  _TtC18SharingViewService28B389CustomNameViewController *result;

  v3 = a3;
  result = (_TtC18SharingViewService28B389CustomNameViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.B389CustomNameViewController", 47, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B389CustomNameViewController_mainController], a2);

}

@end
