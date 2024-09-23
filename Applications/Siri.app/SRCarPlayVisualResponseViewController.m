@implementation SRCarPlayVisualResponseViewController

- (void)viewDidLoad
{
  _TtC4Siri37SRCarPlayVisualResponseViewController *v2;

  v2 = self;
  sub_10008316C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet));
  sub_1000769B8((uint64_t)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet));
}

- (void)performAceCommand:(id)a3
{
  id v5;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v6;

  swift_getObjectType(a3);
  v5 = a3;
  v6 = self;
  sub_100086E94((uint64_t)v5, 0, (uint64_t)v6);

}

- (void)performShowResponse:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v9;

  v5 = a3;
  v9 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  sub_10008470C();
  sub_10007F3F0(v6, v8);

}

- (void)navigateWithResponseData:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v12;

  v5 = a3;
  v12 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  if (qword_10014ECE0 != -1)
    swift_once(&qword_10014ECE0, sub_100098388);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_1000760E8(v9, (uint64_t)qword_100150068);
  v11 = static os_log_type_t.info.getter(v10);
  sub_10009973C(v11, 0x10uLL, 0xD00000000000001CLL, 0x80000001000E0B50, 0xD00000000000004ELL, 0x80000001000E0A60);
  sub_10008470C();
  sub_10007F3F0(v6, v8);

}

- (void)navigateWithAceCommand:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v9;

  v4 = qword_10014ECE0;
  v5 = a3;
  v9 = self;
  if (v4 != -1)
    swift_once(&qword_10014ECE0, sub_100098388);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_1000760E8(v6, (uint64_t)qword_100150068);
  v8 = static os_log_type_t.info.getter(v7);
  sub_10009973C(v8, 0x10uLL, 0xD00000000000001ALL, 0x80000001000E0A40, 0xD00000000000004ELL, 0x80000001000E0A60);
  swift_getObjectType(v5);
  sub_100086E94((uint64_t)v5, 1, (uint64_t)v9);

}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height;
  double width;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_100084B80(width, height);

}

- (void)informHostOfBackgroundColor:(id)a3
{
  id v5;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100084F30(a3);

}

- (void)informHostOfBackgroundMaterial:(int64_t)a3
{
  _TtC4Siri37SRCarPlayVisualResponseViewController *v4;

  v4 = self;
  sub_100085158(a3);

}

- (void)cancelSpeechSynthesis
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC4Siri37SRCarPlayVisualResponseViewController *v8;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate, a2);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(*(_QWORD *)(v6 + 8) + 16);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)restartSpeechSynthesis
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC4Siri37SRCarPlayVisualResponseViewController *v8;

  v3 = (char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate, a2);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(*(_QWORD *)(v6 + 8) + 48);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)snippetFocusDidChange:(int64_t)a3
{
  _TtC4Siri37SRCarPlayVisualResponseViewController *v4;

  v4 = self;
  sub_10008552C(a3);

}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000856E0(v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC4Siri37SRCarPlayVisualResponseViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10008754C();

}

- (void)hideBackgroundBehindSiri
{
  _TtC4Siri37SRCarPlayVisualResponseViewController *v2;

  v2 = self;
  sub_10008610C();

}

@end
