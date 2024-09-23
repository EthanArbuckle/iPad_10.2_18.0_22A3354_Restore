@implementation SFTabSnapshotPool

- (SFTabSnapshotPool)init
{
  return (SFTabSnapshotPool *)sub_18BAB4A38();
}

- (id)contentProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSnapshotPool_contentProvider, (uint64_t)sub_18B890C24, (uint64_t)&block_descriptor_18_3);
}

- (void)setContentProvider:(id)a3
{
  sub_18BAB511C(self, (int)a2, a3, (uint64_t)&unk_1E21FCEB0, (uint64_t)sub_18B892940, (void (*)(uint64_t, uint64_t))sub_18BAB56A4);
}

- (NSArray)sortedSnapshotIdentifiers
{
  void *v2;

  swift_beginAccess();
  sub_18BAC0088();
  sub_18BABFD34();
  v2 = (void *)sub_18BAC0F1C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (id)sortedSnapshotIdentifiersDidChangeHandler
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotPool_wrapped);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 56);
  v4 = *(_QWORD *)(v2 + 64);
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18BA5AA30;
  aBlock[3] = &block_descriptor_9_4;
  v5 = _Block_copy(aBlock);
  sub_18BABFBB4();
  swift_release();
  return v5;
}

- (void)setSortedSnapshotIdentifiersDidChangeHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabSnapshotPool_wrapped);
  swift_beginAccess();
  *(_QWORD *)(v6 + 56) = sub_18B92A118;
  *(_QWORD *)(v6 + 64) = v5;
  swift_release();
}

- (void)contentDidChangeForSnapshotsWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SFTabSnapshotPool *v8;
  uint64_t v9;

  v4 = sub_18BAC0088();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC0070();
  v8 = self;
  sub_18BABFBB4();
  sub_18B97C9FC((uint64_t)v7);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)discardRegistration:(id)a3
{
  id v4;
  SFTabSnapshotPool *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  sub_18BABFBB4();
  v6 = sub_18BABFBB4();
  sub_18B97DBF0(v6);

  swift_release();
  swift_release();
}

- (id)registrationForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SFTabSnapshotPool *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  SFTabSnapshotPool *v12;
  objc_super v14;

  v4 = sub_18BAC0088();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC0070();
  v8 = self;
  sub_18BABFBB4();
  v9 = sub_18B97CDB0((uint64_t)v7);
  swift_release();
  v10 = (char *)objc_allocWithZone((Class)SFTabSnapshotRegistration);
  v11 = &v10[OBJC_IVAR___SFTabSnapshotRegistration_contentObserver];
  *(_QWORD *)v11 = CGRectMake;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&v10[OBJC_IVAR___SFTabSnapshotRegistration_wrapped] = v9;
  v14.receiver = v10;
  v14.super_class = (Class)SFTabSnapshotRegistration;
  v12 = -[SFTabSnapshotPool init](&v14, sel_init);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (void).cxx_destruct
{
  sub_18BAB5548();
}

@end
