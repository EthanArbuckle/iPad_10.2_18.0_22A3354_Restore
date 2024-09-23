@implementation IMDBatchMessageSimulator

- (NSArray)messages
{
  void *v2;

  sub_1D15FD3C0(0, &qword_1EFC62BD8);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D166DBD4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (IMDBatchMessageSimulator)initWithMessages:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  sub_1D15FD3C0(0, &qword_1EFC62BD8);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDBatchMessageSimulator_messages) = (Class)sub_1D166DBEC();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___IMDBatchMessageSimulator_batch);
  *v4 = 0;
  v4[1] = 0;
  v4[2] = MEMORY[0x1E0DEE9D8];
  v6.receiver = self;
  v6.super_class = (Class)IMDBatchMessageSimulator;
  return -[IMDBatchMessageSimulator init](&v6, sel_init);
}

- (BOOL)runWithError:(id *)a3
{
  IMDBatchMessageSimulator *v3;

  v3 = self;
  sub_1D1617F00();

  return 1;
}

- (IMDBatchMessageSimulator)init
{
  IMDBatchMessageSimulator *result;

  result = (IMDBatchMessageSimulator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  id v5;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___IMDBatchMessageSimulator_batch;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDBatchMessageSimulator_batch);
  v5 = (id)*((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease();

}

@end
