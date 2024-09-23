@implementation IdentityProofingTCViewController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IdentityProofingTCViewController();
  -[IdentityProofingTCViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v7;
  id v8;
  _TtC9CoreIDVUI32IdentityProofingTCViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_213FAA154(a4);

}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  void (*v8)(uint64_t);
  id v9;
  id v10;
  _TtC9CoreIDVUI32IdentityProofingTCViewController *v11;
  uint64_t v12;

  v8 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_onAppearance);
  v9 = a3;
  v10 = a4;
  v11 = self;
  if (v8)
  {
    v12 = sub_213F4D4E0((uint64_t)v8);
    v8(v12);
    sub_213F4BE68((uint64_t)v8);
  }
  sub_213FF8618();
  sub_213FA8328();

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI32IdentityProofingTCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_213FF9458();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC9CoreIDVUI32IdentityProofingTCViewController *)sub_213FA9C68(v5, v7, a4);
}

- (_TtC9CoreIDVUI32IdentityProofingTCViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI32IdentityProofingTCViewController *)sub_213FA9E24(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_activityIndicator));
  swift_weakDestroy();
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_agreeClicked));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_config));
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_onAppearance));
}

@end
