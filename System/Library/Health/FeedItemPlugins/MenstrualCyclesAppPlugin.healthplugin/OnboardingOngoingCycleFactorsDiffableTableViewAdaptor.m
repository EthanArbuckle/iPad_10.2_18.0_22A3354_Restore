@implementation OnboardingOngoingCycleFactorsDiffableTableViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  sub_231996240(0, (unint64_t *)&qword_255F410C8, (uint64_t (*)(_QWORD, _QWORD *))MEMORY[0x24BEBC748]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v10 - v8;
  sub_231C9FDB4();
  swift_retain();
  sub_2319962A4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
