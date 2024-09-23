@implementation NQMLStringGenerator

- (void)parserDidStartDocument:(id)a3
{
  id v4;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1AC71F788();

}

- (void)parserDidEndDocument:(id)a3
{
  char *v5;
  id v6;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v7;

  v5 = (char *)self + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v5 + 16))
  {
    v6 = a3;
    v7 = self;
    if (!sub_1AC71EE24())
      sub_1AC6BAFC0(*(_QWORD *)(*(_QWORD *)v5 + 16) - 1);
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
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1AC71F874();

}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v10;

  type metadata accessor for NQMLAttributeName(0);
  sub_1AC688D20(&qword_1EEC8A658, (uint64_t (*)(uint64_t))type metadata accessor for NQMLAttributeName, (uint64_t)&unk_1AC7292A0);
  v8 = sub_1AC726184();
  v9 = a3;
  v10 = self;
  sub_1AC71FA2C(a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v6;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1AC71FDC0(a4);

}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v6;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v7;

  sub_1AC72622C();
  v6 = a3;
  v7 = self;
  sub_1AC71FE90();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  id v4;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1AC71DFEC();

}

- (void)parser:(id)a3 didStartListOfStyle:(unint64_t)a4
{
  id v6;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v7;

  v6 = a3;
  v7 = self;
  sub_1AC720070(a4);

}

- (void)parserDidStartListElement:(id)a3
{
  id v4;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v5;

  v4 = a3;
  v5 = self;
  sub_1AC7201D0();

}

- (void)parserDidEndListElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v9;

  v4 = a3;
  v9 = self;
  sub_1AC71DFEC();
  v5 = *(uint64_t *)((char *)&v9->super.isa
                  + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_orderedListTracker);
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
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *v6;

  v5 = a3;
  v6 = self;
  sub_1AC7203A0();

}

- (_TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator)init
{
  _TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *result;

  result = (_TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                                    + 8];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_accumulator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5JetUIP33_F1C4EBA6165AEBFE43471B55508F17DF19NQMLStringGenerator_foregroundColor));
}

@end
