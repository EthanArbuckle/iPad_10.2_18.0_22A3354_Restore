@implementation HierarchicalDiffableCollectionViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a5;
  sub_1A96185BC();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A94174();
  v12 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DiffableCollectionViewAdaptor_loaded;
  swift_beginAccess();
  *v12 = 1;
  v13 = *(_QWORD *)&self->super.backingDataSource[OBJC_IVAR____TtC18HealthExperienceUI29DiffableCollectionViewAdaptor_backingDataSource];
  ObjectType = swift_getObjectType();
  swift_retain();
  v15 = swift_unknownObjectRetain();
  v16 = sub_1A98489E8(v15, ObjectType, v13);
  swift_unknownObjectRelease();
  sub_1A9848560(v16, v5, 0, 0);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end
