@implementation TapbackAttributionViewModel

- (_TtC7ChatKit27TapbackAttributionViewModel)init
{
  _TtC7ChatKit27TapbackAttributionViewModel *result;

  result = (_TtC7ChatKit27TapbackAttributionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_18E00FA98((uint64_t)self + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__selectedItem, &qword_1EE10AB10);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel_messagePartChatItem));
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel___observationRegistrar;
  v4 = sub_18E766494();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
