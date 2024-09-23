@implementation NqmlStringGenerator

- (void)parserDidStartDocument:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1D891E6B0();

}

- (void)parserDidEndDocument:(id)a3
{
  char *v5;
  id v6;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v7;

  v5 = (char *)self
     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v5 + 16))
  {
    v6 = a3;
    v7 = self;
    if (!sub_1D891E1EC())
      sub_1D84BC294(*(_QWORD *)(*(_QWORD *)v5 + 16) - 1);
    swift_bridgeObjectRelease();
    swift_endAccess();

  }
  else
  {
    __break(1u);
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1D891E7E8();

}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v10;

  type metadata accessor for NqmlAttributeName(0);
  sub_1D832F170(&qword_1EDA45740, (uint64_t (*)(uint64_t))type metadata accessor for NqmlAttributeName, (uint64_t)&unk_1D893188C);
  v8 = sub_1D892AC88();
  v9 = a3;
  v10 = self;
  sub_1D891E9A0(a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1D891ED8C(a4);

}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v7;

  sub_1D892ADB4();
  v6 = a3;
  v7 = self;
  sub_1D891EE5C();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1D891D4B0();

}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v6;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1D891F03C(a4);

}

- (void)parserDidStartListElement:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1D891F19C();

}

- (void)parserDidEndListElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v9;

  v4 = a3;
  v9 = self;
  sub_1D891D4B0();
  v5 = *(uint64_t *)((char *)&v9->super.isa
                  + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_orderedListTracker);
  if (!v5)
    goto LABEL_4;
  v6 = *(_QWORD *)(v5 + 16);
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (!v7)
  {
    *(_QWORD *)(v5 + 16) = v8;
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)parser:(id)a3 didEndListOfStyle:(unint64_t)a4
{
  id v5;
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *v6;

  v5 = a3;
  v6 = self;
  sub_1D891F3B0();

}

- (_TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator)init
{
  _TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *result;

  result = (_TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration
                                    + 8];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_accumulator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_7BE152A6E9112DDB85E95517955C27A519NqmlStringGenerator_foregroundColor));
}

@end
