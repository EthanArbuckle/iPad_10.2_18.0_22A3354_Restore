@implementation TVSetupDoneViewController

- (void)viewDidLoad
{
  _TtC16TVSetupUIService25TVSetupDoneViewController *v2;

  v2 = self;
  sub_10000D680();

}

- (_TtC16TVSetupUIService25TVSetupDoneViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  objc_super v8;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_error] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVSetupDoneViewController();
  return -[TVSetupDoneViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000692C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_delegate]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16TVSetupUIService25TVSetupDoneViewController_deviceIdentifier]);

}

@end
