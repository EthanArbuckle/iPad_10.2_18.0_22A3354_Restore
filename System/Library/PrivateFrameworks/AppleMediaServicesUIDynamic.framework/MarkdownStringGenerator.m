@implementation MarkdownStringGenerator

- (_TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator)init
{
  sub_1B9DB260C();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_accumulator));
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->attributeStack[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                    + 24];
  v6 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                    + 72];
  v7 = *(void **)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                    + 88];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_configuration
                                         + 80]);

  OUTLINED_FUNCTION_100_0();
  swift_release();
  OUTLINED_FUNCTION_16_0();

  OUTLINED_FUNCTION_0_20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator_parser));
  swift_bridgeObjectRelease();
}

- (void)parserDidStartDocument:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DB2838();

}

- (void)parserDidEndDocument:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DB2994();

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1B9DB2A04();

}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  void *v8;
  id v9;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v10;

  type metadata accessor for MarkdownAttributeName(0);
  sub_1B9D479DC((unint64_t *)&unk_1ED5CD7B0, (uint64_t (*)(uint64_t))type metadata accessor for MarkdownAttributeName, (uint64_t)&unk_1B9DEFA88);
  v8 = (void *)sub_1B9DE20A0();
  v9 = a3;
  v10 = self;
  sub_1B9DB2CAC((uint64_t)v10, a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1B9DB3510((uint64_t)v7, a4);

}

- (void)parser:(id)a3 didFindArtworkWithIdentifier:(id)a4
{
  sub_1B9DB39EC(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1B9DB3694);
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_1B9DB39EC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_1B9DB38A4);
}

- (void)parserDidFindNewline:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DB3A4C();

}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v6;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1B9DB3AAC((uint64_t)v7, a4);

}

- (void)parserDidStartListElement:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DB3C5C();

}

- (void)parserDidEndListElement:(id)a3
{
  id v4;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1B9DB3E54();

}

- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4
{
  id v5;
  _TtC27AppleMediaServicesUIDynamic23MarkdownStringGenerator *v6;

  v5 = a3;
  v6 = self;
  sub_1B9DB3EF8();

}

@end
