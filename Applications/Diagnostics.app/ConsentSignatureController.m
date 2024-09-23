@implementation ConsentSignatureController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ConsentSignatureController();
  v2 = v6.receiver;
  -[ConsentSignatureController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

    sub_1000DB1C0();
    sub_1000DC5AC();

  }
  else
  {
    __break(1u);
  }
}

- (void)clearSignature
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView);
  if (v2)
    objc_msgSend(v2, "clear");
  else
    __break(1u);
}

- (BOOL)validateRequiredFields
{
  _TtC11Diagnostics26ConsentSignatureController *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1000DE250();
  v4 = v3;

  return v4 & 1;
}

- (void)cancelConsent
{
  _TtC11Diagnostics26ConsentSignatureController *v2;

  v2 = self;
  sub_1000DE720();

}

- (void)generateConsentDocument
{
  _TtC11Diagnostics26ConsentSignatureController *v2;

  v2 = self;
  sub_1000DEA40();

}

- (_TtC11Diagnostics26ConsentSignatureController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  DARootViewController *v6;
  DARootViewController *v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11Diagnostics26ConsentSignatureController *)sub_1000DF6F0(v5, v7, a4);
}

- (_TtC11Diagnostics26ConsentSignatureController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics26ConsentSignatureController *)sub_1000DF940(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_firstNameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_lastNameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_submitBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_cancelBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_signatureView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_clearSignBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26ConsentSignatureController_documentHelper));
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  _TtC11Diagnostics26ConsentSignatureController *v5;

  v4 = a3;
  v5 = self;
  sub_1000DFC60(v4);

  return 1;
}

- (void)handleTapOutside:(id)a3
{
  id v4;
  _TtC11Diagnostics26ConsentSignatureController *v5;

  v4 = a3;
  v5 = self;
  sub_1000DFDB4(v4);

}

@end
