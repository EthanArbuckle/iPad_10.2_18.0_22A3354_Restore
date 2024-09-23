@implementation VoiceSynthPlayer

- (void)dealloc
{
  _TtC19ContactlessReaderUI16VoiceSynthPlayer *v2;

  v2 = self;
  sub_22F8B1048();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22F8847A8((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI16VoiceSynthPlayer_audioPlayerDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI16VoiceSynthPlayer_voiceSynthesizer));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI16VoiceSynthPlayer_locale;
  v4 = sub_22F98D4B0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC19ContactlessReaderUI16VoiceSynthPlayer)init
{
  _TtC19ContactlessReaderUI16VoiceSynthPlayer *result;

  result = (_TtC19ContactlessReaderUI16VoiceSynthPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  id v6;
  id v7;
  _TtC19ContactlessReaderUI16VoiceSynthPlayer *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22F8B2C00();

}

- (uint64_t)speechSynthesizer:(void *)a3 didFinishSpeechUtterance:(void *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_msgSend(v7, sel_speechString);
  v10 = sub_22F98EDB8();
  v12 = v11;

  sub_22F8B1CFC(v10, v12);
  return swift_bridgeObjectRelease();
}

@end
