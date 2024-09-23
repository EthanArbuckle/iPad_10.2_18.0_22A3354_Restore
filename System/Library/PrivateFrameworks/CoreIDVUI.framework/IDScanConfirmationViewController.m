@implementation IDScanConfirmationViewController

- (_TtC9CoreIDVUI32IDScanConfirmationViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  _TtC9CoreIDVUI32IDScanConfirmationViewController *result;

  v5 = OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_eligibilityHelper;
  type metadata accessor for IdentityProofingEligibilityHelper();
  v6 = (objc_class *)swift_allocObject();
  sub_213FF785C();
  swift_allocObject();
  v7 = a3;
  *((_QWORD *)v6 + 2) = sub_213FF7850();
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v6;

  result = (_TtC9CoreIDVUI32IDScanConfirmationViewController *)sub_213FF9878();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI32IDScanConfirmationViewController *v2;

  v2 = self;
  sub_213F8D248();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for IDScanConfirmationViewController();
  v4 = v8.receiver;
  -[IDScanConfirmationViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  v5 = sub_213FF8618();
  v7 = v6;
  sub_213FF83D8();
  sub_213F901B8(v5, v7, 0, 0, v4[OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_scanSide], 0, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9CoreIDVUI32IDScanConfirmationViewController *v4;

  v4 = self;
  sub_213F8D594(a3);

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_docScanConfig));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_configuration);
  swift_release();
  swift_release();
}

@end
