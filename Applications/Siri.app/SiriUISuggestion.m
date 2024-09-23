@implementation SiriUISuggestion

- (NSString)spokenText
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->spokenText[OBJC_IVAR____TtC4Siri16SiriUISuggestion_spokenText];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setSpokenText:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_spokenText);
  v6 = *(_QWORD *)&self->spokenText[OBJC_IVAR____TtC4Siri16SiriUISuggestion_spokenText];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (NSUUID)suggestionId
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  Class isa;
  _BYTE v11[24];

  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = (char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId;
  swift_beginAccess(v7, v11, 0, 0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)isa;
}

- (void)setSuggestionId:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  void (*v10)(char *, _BYTE *, uint64_t);
  _TtC4Siri16SiriUISuggestion *v11;
  _BYTE v13[24];

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId, v13, 33, 0);
  v10 = *(void (**)(char *, _BYTE *, uint64_t))(v6 + 40);
  v11 = self;
  v10(v9, v8, v5);
  swift_endAccess(v13);

}

- (SAUIAddViews)addViews
{
  return (SAUIAddViews *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC4Siri16SiriUISuggestion_addViews));
}

- (void)setAddViews:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Siri16SiriUISuggestion_addViews);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Siri16SiriUISuggestion_addViews) = (Class)a3;
  v3 = a3;

}

- (void)siriDidSpeakHint
{
  uint64_t v2;
  void (*v3)(uint64_t);
  _TtC4Siri16SiriUISuggestion *v4;
  uint64_t v5;

  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Siri16SiriUISuggestion_exposureCallback);
  v2 = *(_QWORD *)&self->spokenText[OBJC_IVAR____TtC4Siri16SiriUISuggestion_exposureCallback];
  v4 = self;
  v5 = swift_retain(v2);
  v3(v5);

  swift_release(v2);
}

- (_TtC4Siri16SiriUISuggestion)init
{
  _TtC4Siri16SiriUISuggestion *result;

  result = (_TtC4Siri16SiriUISuggestion *)_swift_stdlib_reportUnimplementedInitializer("Siri.SiriUISuggestion", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->spokenText[OBJC_IVAR____TtC4Siri16SiriUISuggestion_spokenText]);
  v3 = (char *)self + OBJC_IVAR____TtC4Siri16SiriUISuggestion_suggestionId;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(_QWORD *)&self->spokenText[OBJC_IVAR____TtC4Siri16SiriUISuggestion_exposureCallback]);
}

@end
