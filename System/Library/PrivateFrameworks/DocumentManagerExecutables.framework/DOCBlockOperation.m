@implementation DOCBlockOperation

- (void)main
{
  void (*v3)(uint64_t (*)(uint64_t, void *), uint64_t);
  uint64_t v4;
  _TtC26DocumentManagerExecutables17DOCBlockOperation *v5;

  v3 = *(void (**)(uint64_t (*)(uint64_t, void *), uint64_t))((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCBlockOperation_block);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = self;
  v5 = self;
  v3(sub_21EAE1144, v4);

  swift_release();
}

- (_TtC26DocumentManagerExecutables17DOCBlockOperation)init
{
  _TtC26DocumentManagerExecutables17DOCBlockOperation *result;

  result = (_TtC26DocumentManagerExecutables17DOCBlockOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
