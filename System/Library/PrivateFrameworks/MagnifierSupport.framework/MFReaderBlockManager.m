@implementation MFReaderBlockManager

- (_TtC16MagnifierSupport20MFReaderBlockManager)init
{
  _TtC16MagnifierSupport20MFReaderBlockManager *result;

  result = (_TtC16MagnifierSupport20MFReaderBlockManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport20MFReaderBlockManager__blockIndex;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D8BE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport20MFReaderBlockManager__speechState;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D8B68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
