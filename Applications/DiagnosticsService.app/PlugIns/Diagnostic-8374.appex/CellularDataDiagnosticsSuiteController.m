@implementation CellularDataDiagnosticsSuiteController

- (void)start
{
  void *v3;
  SpeedTestConfig *v4;
  SpeedTestConfig *cellularTestStartRef;
  SpeedTestConfig *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CellularDataDiagnosticsSuiteController result](self, "result"));
  objc_msgSend(v3, "setStatusCode:", &off_1000042D8);

  v4 = objc_alloc_init(SpeedTestConfig);
  cellularTestStartRef = self->cellularTestStartRef;
  self->cellularTestStartRef = v4;

  v6 = self->cellularTestStartRef;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002F30;
  v7[3] = &unk_1000041D8;
  v7[4] = self;
  -[SpeedTestConfig startDownloadTest:](v6, "startDownloadTest:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cellularTestStartRef, 0);
}

@end
