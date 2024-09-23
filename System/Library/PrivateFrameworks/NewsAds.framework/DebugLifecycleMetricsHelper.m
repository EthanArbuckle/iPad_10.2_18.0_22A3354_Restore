@implementation DebugLifecycleMetricsHelper

- (void)trackImpressionWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t);
  uint64_t v12;

  v4 = sub_1BA2C1424();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v12 - v9;
  sub_1BA2C140C();
  sub_1BA2C140C();
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  v11(v10, v4);
}

@end
