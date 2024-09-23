@implementation DataSourceObserver

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;

  sub_1BC358538();
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62BDA4();
  v11 = (void *)MEMORY[0x1BCCF37A4](self->collectionView);
  swift_retain();
  objc_msgSend(v11, sel_reloadData);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
