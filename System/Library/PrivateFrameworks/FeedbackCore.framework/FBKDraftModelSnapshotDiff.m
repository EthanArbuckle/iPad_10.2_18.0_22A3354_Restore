@implementation FBKDraftModelSnapshotDiff

- (FBKDraftModelSnapshotDiff)initWithPreviousSnapshot:(id)a3 newSnapshot:(id)a4
{
  id v7;
  id v8;
  FBKDraftModelSnapshotDiff *v9;
  FBKDraftModelSnapshotDiff *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKDraftModelSnapshotDiff;
  v9 = -[FBKDraftModelSnapshotDiff init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previousSnapshot, a3);
    objc_storeStrong((id *)&v10->_currentSnapshot, a4);
  }

  return v10;
}

- (FBKDraftModelSnapshot)previousSnapshot
{
  return self->_previousSnapshot;
}

- (void)setPreviousSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_previousSnapshot, a3);
}

- (FBKDraftModelSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_previousSnapshot, 0);
}

- (NSArray)removedSections
{
  return (NSArray *)sub_21DAB50F0(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.removedSections.getter, &qword_25539AD40);
}

- (NSArray)addedSections
{
  return (NSArray *)sub_21DAB50F0(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.addedSections.getter, &qword_25539AD40);
}

- (NSArray)addedRows
{
  return (NSArray *)sub_21DAB50F0(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.addedRows.getter, &qword_25539AD38);
}

- (NSArray)removedRows
{
  return (NSArray *)sub_21DAB50F0(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.removedRows.getter, &qword_25539AD38);
}

- (unint64_t)indexOfRowInNewSnapshot:(id)a3
{
  objc_class *v4;
  FBKDraftModelSnapshotDiff *v5;
  Swift::UInt v6;
  FBKDraftModelSnapshotRow v8;

  v4 = (objc_class *)a3;
  v5 = self;
  v8.super.isa = v4;
  v6 = FBKDraftModelSnapshotDiff.indexOfRowInNewSnapshot(_:)(v8);

  return v6;
}

- (BOOL)containsAnyAdditionsOrRemovals
{
  FBKDraftModelSnapshotDiff *v2;
  BOOL v3;

  v2 = self;
  v3 = FBKDraftModelSnapshotDiff.containsAnyAdditionsOrRemovals.getter();

  return v3;
}

- (BOOL)hasRemovedAllDevices
{
  FBKDraftModelSnapshotDiff *v2;
  FBKDraftModelSnapshot *v3;
  unsigned int v4;
  FBKDraftModelSnapshot *v5;
  unsigned __int8 v6;

  v2 = self;
  v3 = -[FBKDraftModelSnapshotDiff previousSnapshot](v2, sel_previousSnapshot);
  v4 = -[FBKDraftModelSnapshot hasAnyDevices](v3, sel_hasAnyDevices);

  if (v4)
  {
    v5 = -[FBKDraftModelSnapshotDiff currentSnapshot](v2, sel_currentSnapshot);
    v6 = -[FBKDraftModelSnapshot hasAnyDevices](v5, sel_hasAnyDevices);

    return v6 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)indexOfSectionInNewSnapshot:(id)a3
{
  objc_class *v4;
  FBKDraftModelSnapshotDiff *v5;
  Swift::UInt v6;
  FBKDraftModelSnapshotSection v8;

  v4 = (objc_class *)a3;
  v5 = self;
  v8.super.isa = v4;
  v6 = FBKDraftModelSnapshotDiff.indexOfSectionInNewSnapshot(_:)(v8);

  return v6;
}

- (NSString)descriptionString
{
  FBKDraftModelSnapshotDiff *v2;
  void *v3;

  v2 = self;
  sub_21DAB625C();

  v3 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)description
{
  FBKDraftModelSnapshotDiff *v2;
  NSString *v3;
  void *v4;

  v2 = self;
  v3 = -[FBKDraftModelSnapshotDiff descriptionString](v2, sel_descriptionString);
  sub_21DAC481C();

  v4 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

@end
