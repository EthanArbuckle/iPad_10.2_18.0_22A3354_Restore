@implementation CRKShareTargetBrowserTransportFactory

- (void)makeStudentdTransportWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKShareTargetBrowserTransportFactory makeStudentdTransportProvider](self, "makeStudentdTransportProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchTransportWithCompletion:", v4);

}

- (id)makeStudentdTransportProvider
{
  void *v2;
  CRKFailIfMacAndUnenrolledStudentdTransportProvider *v3;

  v2 = (void *)objc_opt_new();
  v3 = -[CRKFailIfMacAndUnenrolledStudentdTransportProvider initWithTransportProvider:]([CRKFailIfMacAndUnenrolledStudentdTransportProvider alloc], "initWithTransportProvider:", v2);

  return v3;
}

- (void)makeInstructordTransportWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKShareTargetBrowserTransportFactory makeInstructordTransportProvider](self, "makeInstructordTransportProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchTransportWithCompletion:", v4);

}

- (id)makeInstructordTransportProvider
{
  void *v2;
  CRKFailIfMacWithoutClassroomTransportProvider *v3;
  CRKFailIfSimulatorTransportProvider *v4;
  void *v5;
  CRKFailIfSimulatorTransportProvider *v6;

  v2 = (void *)objc_opt_new();
  v3 = -[CRKFailIfMacWithoutClassroomTransportProvider initWithTransportProvider:]([CRKFailIfMacWithoutClassroomTransportProvider alloc], "initWithTransportProvider:", v2);

  v4 = [CRKFailIfSimulatorTransportProvider alloc];
  CRKErrorWithCodeAndUserInfo(101, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKFailIfSimulatorTransportProvider initWithTransportProvider:failureError:](v4, "initWithTransportProvider:failureError:", v3, v5);

  return v6;
}

@end
