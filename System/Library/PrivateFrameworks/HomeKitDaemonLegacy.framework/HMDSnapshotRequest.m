@implementation HMDSnapshotRequest

- (HMDSnapshotRequest)initWithCompletion:(id)a3
{
  id v4;
  HMDSnapshotRequest *v5;
  void *v6;
  id completion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSnapshotRequest;
  v5 = -[HMDSnapshotRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    completion = v5->_completion;
    v5->_completion = v6;

  }
  return v5;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
