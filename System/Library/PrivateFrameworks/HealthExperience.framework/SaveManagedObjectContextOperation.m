@implementation SaveManagedObjectContextOperation

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  _TtC16HealthExperience33SaveManagedObjectContextOperation *v6;
  _QWORD v7[6];

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthExperience33SaveManagedObjectContextOperation_context);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = self;
  v7[4] = sub_1BC8BFF84;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1BC892F1C;
  v7[3] = &block_descriptor_7;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_release();
  objc_msgSend(v3, sel_performBlock_, v5);
  _Block_release(v5);

}

- (_TtC16HealthExperience33SaveManagedObjectContextOperation)init
{
  _TtC16HealthExperience33SaveManagedObjectContextOperation *result;

  result = (_TtC16HealthExperience33SaveManagedObjectContextOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthExperience33SaveManagedObjectContextOperation_context));
}

@end
