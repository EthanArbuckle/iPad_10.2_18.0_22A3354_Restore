@implementation DetailedConsentNavigationController

- (_TtC11Diagnostics35DetailedConsentNavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10003EEEC();
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DetailedConsentNavigationController();
  v2 = v6.receiver;
  -[DetailedConsentNavigationController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

    sub_10003D220();
    sub_10003DC70();

  }
  else
  {
    __break(1u);
  }
}

- (void)agreeButtonClicked
{
  _TtC11Diagnostics35DetailedConsentNavigationController *v2;

  v2 = self;
  sub_10003E760();

}

- (void)disagreeButtonClicked
{
  _TtC11Diagnostics35DetailedConsentNavigationController *v2;

  v2 = self;
  sub_10003EA0C();

}

- (_TtC11Diagnostics35DetailedConsentNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11Diagnostics35DetailedConsentNavigationController *result;

  v4 = a4;
  result = (_TtC11Diagnostics35DetailedConsentNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.DetailedConsentNavigationController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_agreeBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_disagreeBtn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_consentContent));
  swift_bridgeObjectRelease(*(_QWORD *)&self->fontSizeForLabels[OBJC_IVAR____TtC11Diagnostics35DetailedConsentNavigationController_consentHandle]);
}

@end
