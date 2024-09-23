@implementation TVSetupAuthViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16TVSetupUIService25TVSetupAuthViewController *v4;

  v4 = self;
  sub_100007400(a3);

}

- (void)didCompleteTextEntry:(id)a3
{
  id v4;
  _TtC16TVSetupUIService25TVSetupAuthViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100007664(v4);

}

- (_TtC16TVSetupUIService25TVSetupAuthViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_super v7;

  v5 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TVSetupAuthViewController();
  return -[TVSetupAuthViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000692C((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService25TVSetupAuthViewController_delegate]);
}

@end
