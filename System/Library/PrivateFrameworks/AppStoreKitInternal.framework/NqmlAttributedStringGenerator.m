@implementation NqmlAttributedStringGenerator

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  id v7;
  _TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *v8;

  v7 = a3;
  v8 = self;
  sub_1D858A454((char *)a4);

}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1D858AB74(a4);

}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *v7;

  sub_1D892ADB4();
  v6 = a3;
  v7 = self;
  sub_1D858B308();

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1D858B828();

}

- (void)parserDidEndDocument:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1D858B9E8();

}

- (void)parserDidFindNewline:(void *)a3
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = sub_1D89274C0();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF240];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a1;
  swift_bridgeObjectRetain();
  sub_1D89273F4();
  swift_beginAccess();
  sub_1D832F170(&qword_1F0175EB0, v6, MEMORY[0x1E0CAF230]);
  sub_1D8927484();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  swift_endAccess();

}

- (_TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator)init
{
  _TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *result;

  result = (_TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration
                                    + 8];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (char *)self
     + OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_accumulator;
  v7 = sub_1D89274C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v8 = (char *)self
     + OBJC_IVAR____TtC19AppStoreKitInternalP33_99C75C19F989C0B7BF00D5167FBC286B29NqmlAttributedStringGenerator_lastElementIndex;
  v9 = sub_1D8927478();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

@end
