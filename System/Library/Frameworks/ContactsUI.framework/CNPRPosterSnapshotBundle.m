@implementation CNPRPosterSnapshotBundle

- (CNPRPosterSnapshotBundle)initWithWrappedBundle:(id)a3
{
  id v5;
  CNPRPosterSnapshotBundle *v6;
  CNPRPosterSnapshotBundle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRPosterSnapshotBundle;
  v6 = -[CNPRPosterSnapshotBundle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedSnapshotBundle, a3);

  return v7;
}

- (id)snapshotForLevelSet:(id)a3
{
  PRPosterSnapshotBundle *wrappedSnapshotBundle;
  void *v4;
  void *v5;

  wrappedSnapshotBundle = self->_wrappedSnapshotBundle;
  objc_msgSend(a3, "wrappedLevelSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterSnapshotBundle snapshotForLevelSet:](wrappedSnapshotBundle, "snapshotForLevelSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PRPosterSnapshotBundle)wrappedSnapshotBundle
{
  return self->_wrappedSnapshotBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedSnapshotBundle, 0);
}

@end
