@implementation HMDSnapshotCompletionTimer

- (HMDSnapshotCompletionTimer)initWithSnapshotSession:(id)a3 timer:(double)a4
{
  id v6;
  HMDSnapshotCompletionTimer *v7;
  HMDSnapshotCompletionTimer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDSnapshotCompletionTimer;
  v7 = -[HMFTimer initWithTimeInterval:options:](&v10, sel_initWithTimeInterval_options_, 0, a4);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_snapshotSession, v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotSession);
}

- (HMDSnapshotSession)snapshotSession
{
  return (HMDSnapshotSession *)objc_loadWeakRetained((id *)&self->_snapshotSession);
}

@end
