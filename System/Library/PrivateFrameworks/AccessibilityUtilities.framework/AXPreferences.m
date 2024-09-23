@implementation AXPreferences

+ (_TtC22AccessibilityUtilities13AXPreferences)shared
{
  if (qword_1EE042CD8 != -1)
    swift_once();
  return (_TtC22AccessibilityUtilities13AXPreferences *)(id)qword_1EE042CD0;
}

- (_TtCC22AccessibilityUtilities13AXPreferences9VoiceOver)voiceover
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_voiceover);
  swift_beginAccess();
  return (_TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *)*v2;
}

- (void)setVoiceover:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_voiceover);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtCC22AccessibilityUtilities13AXPreferences9Magnifier)magnifier
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_magnifier);
  swift_beginAccess();
  return (_TtCC22AccessibilityUtilities13AXPreferences9Magnifier *)*v2;
}

- (void)setMagnifier:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_magnifier);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtCC22AccessibilityUtilities13AXPreferences6Speech)speech
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_speech);
  swift_beginAccess();
  return (_TtCC22AccessibilityUtilities13AXPreferences6Speech *)*v2;
}

- (void)setSpeech:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_speech);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings)spokenContent
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_spokenContent);
  swift_beginAccess();
  return (_TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings *)*v2;
}

- (void)setSpokenContent:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_spokenContent);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtCC22AccessibilityUtilities13AXPreferences14AssistiveTouch)assistiveTouch
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_assistiveTouch);
  swift_beginAccess();
  return (_TtCC22AccessibilityUtilities13AXPreferences14AssistiveTouch *)*v2;
}

- (void)setAssistiveTouch:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_assistiveTouch);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech)liveSpeech
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_liveSpeech);
  swift_beginAccess();
  return (_TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech *)*v2;
}

- (void)setLiveSpeech:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22AccessibilityUtilities13AXPreferences_liveSpeech);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)observeWithSelector:(SEL)a3 listener:(id)a4 block:(id)a5
{
  void *v7;
  uint64_t v8;
  _TtC22AccessibilityUtilities13AXPreferences *v9;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(a3) = sub_18C709070((uint64_t)a3, (uint64_t)sub_18C7095D4, v8);
  swift_unknownObjectRelease();

  swift_release();
  return a3 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _TtC22AccessibilityUtilities13AXPreferences *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = self;
  sub_18C708CBC((uint64_t)a3, v5, (uint64_t)v13);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v7, v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_18C712258();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

- (_TtC22AccessibilityUtilities13AXPreferences)init
{
  return (_TtC22AccessibilityUtilities13AXPreferences *)AXPreferences.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
