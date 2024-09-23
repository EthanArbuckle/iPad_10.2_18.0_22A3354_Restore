@implementation CustodianSetupFlowDelegate

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  id v4;
  _TtC14FamilyCircleUI26CustodianSetupFlowDelegate *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v7 = v6;
  if (qword_2549F5F68 != -1)
  {
    swift_once();
    v6 = v7;
  }
  objc_msgSend(v6, sel_postNotificationName_object_userInfo_deliverImmediately_, qword_2549FB448, 0, 0, 1);

}

- (_TtC14FamilyCircleUI26CustodianSetupFlowDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CustodianSetupFlowDelegate();
  return -[CustodianSetupFlowDelegate init](&v3, sel_init);
}

@end
