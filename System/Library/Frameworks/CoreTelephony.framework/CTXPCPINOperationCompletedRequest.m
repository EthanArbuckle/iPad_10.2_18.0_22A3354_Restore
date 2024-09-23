@implementation CTXPCPINOperationCompletedRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend(v6, "SIMUnlockProcedureDidComplete");
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (int)requiredEntitlement
{
  return 3;
}

@end
