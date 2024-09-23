@implementation LoadFailureContext

- (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext)init
{
  _TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext *result;

  result = (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext_startDate;
  v4 = sub_1BB86C8B0();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext_endDate, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext_error));
}

@end
