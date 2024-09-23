@implementation AirTagAppleIDViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService27AirTagAppleIDViewController *v2;

  v2 = self;
  sub_10005E9C0();

}

- (_TtC18SharingViewService27AirTagAppleIDViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_imageName];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_onDoneURL];
  v8 = type metadata accessor for URL(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_buttonText];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_mainController], 0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[AirTagAppleIDViewController initWithContentView:](&v11, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->imageName[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_imageName]);
  sub_10000E92C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_onDoneURL]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->imageName[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_buttonText]);
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService27AirTagAppleIDViewController_mainController], v3);
}

@end
