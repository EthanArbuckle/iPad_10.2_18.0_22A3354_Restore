@implementation DiffableCollectionViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  sub_1A96B89A0(0, (unint64_t *)&qword_1ED276250, MEMORY[0x1E0DEA978], (uint64_t (*)(_QWORD, _QWORD *))MEMORY[0x1E0DC24D8]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v11 - v9;
  sub_1A9A94174();
  swift_retain();
  sub_1A9760DEC((uint64_t)v10, a5);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
