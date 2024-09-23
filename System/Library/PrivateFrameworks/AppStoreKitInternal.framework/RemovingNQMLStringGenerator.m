@implementation RemovingNQMLStringGenerator

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration
                                    + 8];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator *v7;

  sub_1D892ADB4();
  v6 = a3;
  v7 = self;
  sub_1D839DEC0();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1D8453F7C();

}

- (void)parserDidFindNewline:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator *v6;

  swift_beginAccess();
  v5 = a3;
  v6 = self;
  sub_1D892AEB0();
  swift_endAccess();

}

- (_TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator)init
{
  _TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator *result;

  result = (_TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
