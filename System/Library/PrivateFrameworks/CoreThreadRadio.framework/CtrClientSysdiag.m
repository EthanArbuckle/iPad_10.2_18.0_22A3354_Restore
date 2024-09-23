@implementation CtrClientSysdiag

- (id)init:(const char *)a3
{
  CtrClientSysdiag *v4;
  CtrClient *v5;
  CtrClient *ctrClient;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CtrClientSysdiag;
  v4 = -[CtrClientSysdiag init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CtrClient init:]([CtrClient alloc], "init:", a3);
    ctrClient = v4->ctrClient;
    v4->ctrClient = v5;

  }
  return v4;
}

- (BOOL)generateThreadDiagnosticsMonitorLogs
{
  void *__p;
  char v4;

  -[CtrClient generateThreadDiagnosticsMonitorLogs](self->ctrClient, "generateThreadDiagnosticsMonitorLogs");
  if (v4 < 0)
    operator delete(__p);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ctrClient, 0);
}

@end
