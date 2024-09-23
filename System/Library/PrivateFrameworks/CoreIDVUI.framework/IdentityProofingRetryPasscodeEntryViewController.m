@implementation IdentityProofingRetryPasscodeEntryViewController

- (_TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController)initWithCoder:(id)a3
{
  _TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController *result;

  result = (_TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController *)sub_213FF9878();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingRetryPasscodeEntryViewController();
  v4 = v6.receiver;
  -[IdentityProofingRetryPasscodeEntryViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setLeftBarButtonItem_, 0);

}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController *v2;

  v2 = self;
  sub_213FBF6EC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController_config));
  swift_release();
}

@end
