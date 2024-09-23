@implementation MoreDataSource

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  sub_231AFF928();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9FDB4();
  swift_retain();
  sub_231B24664();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
