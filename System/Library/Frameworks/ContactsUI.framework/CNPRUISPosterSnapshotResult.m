@implementation CNPRUISPosterSnapshotResult

- (CNPRUISPosterSnapshotResult)initWithWrappedResult:(id)a3
{
  id v5;
  CNPRUISPosterSnapshotResult *v6;
  CNPRUISPosterSnapshotResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISPosterSnapshotResult;
  v6 = -[CNPRUISPosterSnapshotResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedResult, a3);

  return v7;
}

- (id)snapshotBundle
{
  void *v2;
  CNPRPosterSnapshotBundle *v3;

  -[PRUISPosterSnapshotResult snapshotBundle](self->_wrappedResult, "snapshotBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[CNPRPosterSnapshotBundle initWithWrappedBundle:]([CNPRPosterSnapshotBundle alloc], "initWithWrappedBundle:", v2);
  else
    v3 = 0;

  return v3;
}

- (PRUISPosterSnapshotResult)wrappedResult
{
  return self->_wrappedResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedResult, 0);
}

@end
