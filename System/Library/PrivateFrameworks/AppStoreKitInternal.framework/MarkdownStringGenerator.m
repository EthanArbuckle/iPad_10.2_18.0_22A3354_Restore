@implementation MarkdownStringGenerator

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1D85F23F0();

}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  id v7;
  _TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *v8;

  swift_beginAccess();
  v7 = a3;
  v8 = self;
  sub_1D892AEB0();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *v7;

  swift_beginAccess();
  v6 = a3;
  v7 = self;
  sub_1D892AEB0();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *v7;

  sub_1D892ADB4();
  v6 = a3;
  v7 = self;
  sub_1D85F25A8();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *v6;

  swift_beginAccess();
  v5 = a3;
  v6 = self;
  sub_1D892AEB0();
  swift_endAccess();

}

- (_TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator)init
{
  _TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *result;

  result = (_TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration
                                    + 8];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_B4B7001B821E0CE6B7ABCB22A63E48C723MarkdownStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
