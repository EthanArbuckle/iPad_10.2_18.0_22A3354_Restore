@implementation IdentityProofingErrorViewController

- (_TtC9CoreIDVUI35IdentityProofingErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC9CoreIDVUI35IdentityProofingErrorViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_213FF9458();
    v6 = a4;
    v7 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for IdentityProofingErrorViewController();
  v9 = -[IdentityProofingErrorViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC9CoreIDVUI35IdentityProofingErrorViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingErrorViewController();
  return -[IdentityProofingErrorViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
