@implementation TVSetupStartViewController

- (void)viewDidLoad
{
  _TtC16TVSetupUIService26TVSetupStartViewController *v2;

  v2 = self;
  sub_100005040();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16TVSetupUIService26TVSetupStartViewController *v4;

  v4 = self;
  sub_10000592C(a3);

}

- (_TtC16TVSetupUIService26TVSetupStartViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  objc_super v8;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_WORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceModelCode] = 256;
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_isStarted] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVSetupStartViewController();
  return -[TVSetupStartViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000692C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_delegate]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16TVSetupUIService26TVSetupStartViewController_deviceIdentifier]);
}

@end
