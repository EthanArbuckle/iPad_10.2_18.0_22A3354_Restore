@implementation TVSetupCaptiveNetworkWarningViewController

- (void)viewDidLoad
{
  _TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController *v2;

  v2 = self;
  sub_100010AC0();

}

- (_TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_super v7;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_didTapContinue] = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TVSetupCaptiveNetworkWarningViewController();
  return -[TVSetupCaptiveNetworkWarningViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000692C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService42TVSetupCaptiveNetworkWarningViewController_delegate]);
}

@end
