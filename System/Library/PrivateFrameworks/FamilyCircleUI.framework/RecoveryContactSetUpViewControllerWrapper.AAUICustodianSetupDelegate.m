@implementation RecoveryContactSetUpViewControllerWrapper.AAUICustodianSetupDelegate

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  id v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  _TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate *v7;

  v4 = a3;
  v7 = self;
  objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v5 = *(void (**)(uint64_t))((char *)&v7->super.isa
                                      + OBJC_IVAR____TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate_onChange);
  if (v5)
  {
    v6 = swift_retain();
    v5(v6);
    sub_20DEDDAB4((uint64_t)v5);
  }

}

- (_TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate)init
{
  _TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate *result;

  result = (_TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20DEDDAB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV14FamilyCircleUI41RecoveryContactSetUpViewControllerWrapper26AAUICustodianSetupDelegate_onChange));
}

@end
