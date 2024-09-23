@implementation SizeClassResponsiveDataSource

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  sub_1A96185BC();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A94174();
  swift_beginAccess();
  v12 = *(void **)self->changeObservers;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = self;
  *(_BYTE *)(v13 + 24) = a5;
  aBlock[4] = sub_1A9A2F3A0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A973E1D0;
  aBlock[3] = &block_descriptor_29_0;
  v14 = _Block_copy(aBlock);
  swift_retain_n();
  v15 = v12;
  swift_release();
  objc_msgSend(v15, sel_notifyObservers_, v14);
  _Block_release(v14);
  swift_release();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end
