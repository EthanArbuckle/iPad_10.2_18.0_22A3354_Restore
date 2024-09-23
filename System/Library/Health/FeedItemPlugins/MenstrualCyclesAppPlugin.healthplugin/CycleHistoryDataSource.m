@implementation CycleHistoryDataSource

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = *(void **)self->analysis;
  *(_QWORD *)self->analysis = a4;
  v6 = a3;
  v7 = a4;
  swift_retain();

  v8 = v7;
  sub_231C7E664(v8);

  swift_release();
}

- (void)significantTimeChangeDidOccur:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_231C9CB68();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9CB44();
  swift_retain();
  sub_231C7EF40((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
