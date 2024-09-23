@implementation HFSnapshotInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSnapshots, 0);
  objc_storeStrong((id *)&self->_baseSnapshot, 0);
}

- (NSDiffableDataSourceSnapshot)baseSnapshot
{
  return self->_baseSnapshot;
}

- (void)setSectionSnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_sectionSnapshots, a3);
}

- (HFSnapshotInfo)initWithSnapshot:(id)a3
{
  id v5;
  HFSnapshotInfo *v6;
  HFSnapshotInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFSnapshotInfo;
  v6 = -[HFSnapshotInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseSnapshot, a3);

  return v7;
}

- (NSMutableDictionary)sectionSnapshots
{
  return self->_sectionSnapshots;
}

- (void)setBaseSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_baseSnapshot, a3);
}

@end
