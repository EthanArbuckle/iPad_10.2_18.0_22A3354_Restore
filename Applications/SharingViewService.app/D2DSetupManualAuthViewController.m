@implementation D2DSetupManualAuthViewController

- (void)didCompleteTextEntry:(id)a3
{
  id v4;
  _TtC18SharingViewService32D2DSetupManualAuthViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100061440(v4);

}

- (_TtC18SharingViewService32D2DSetupManualAuthViewController)initWithContentView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupManualAuthViewController();
  return -[D2DSetupBasePasscodeViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

@end
