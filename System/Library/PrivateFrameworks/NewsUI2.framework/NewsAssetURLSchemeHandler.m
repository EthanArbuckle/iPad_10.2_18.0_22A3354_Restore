@implementation NewsAssetURLSchemeHandler

- (WKURLSchemeTask)task
{
  return (WKURLSchemeTask *)(id)swift_unknownObjectRetain();
}

- (void)start
{
  _TtC7NewsUI225NewsAssetURLSchemeHandler *v2;

  v2 = self;
  sub_1D6D70D68();

}

- (void)cancel
{
  _TtC7NewsUI225NewsAssetURLSchemeHandler *v2;

  v2 = self;
  sub_1D6D713BC();

}

- (void)finish
{
  char *v3;
  _TtC7NewsUI225NewsAssetURLSchemeHandler *v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI225NewsAssetURLSchemeHandler_cancelHandler;
  swift_beginAccess();
  v4 = self;
  sub_1D6D716EC((uint64_t)v5, (uint64_t)v3);
  swift_endAccess();

}

- (_TtC7NewsUI225NewsAssetURLSchemeHandler)init
{
  _TtC7NewsUI225NewsAssetURLSchemeHandler *result;

  result = (_TtC7NewsUI225NewsAssetURLSchemeHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI225NewsAssetURLSchemeHandler_assetFetchService);
  swift_bridgeObjectRelease();
  sub_1D5E82E34((uint64_t)self + OBJC_IVAR____TtC7NewsUI225NewsAssetURLSchemeHandler_cancelHandler, &qword_1F0006518, (void (*)(uint64_t))sub_1D6D71698);
}

@end
