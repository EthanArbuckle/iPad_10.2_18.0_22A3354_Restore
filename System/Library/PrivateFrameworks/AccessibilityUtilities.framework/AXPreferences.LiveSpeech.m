@implementation AXPreferences.LiveSpeech

- (void)speechVoiceIdentifierForKeyboard:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSString *v16;
  _TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE043980);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_18C711F88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE043E10;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE043998;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18C701780((uint64_t)v10, (uint64_t)&unk_1EE0439A0, (uint64_t)v15);
  swift_release();
}

- (_TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech)init
{
  return (_TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech *)AXPreferences.LiveSpeech.init()();
}

- (void).cxx_destruct
{
  sub_18C6E8B00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech_client), *(_QWORD *)&self->client[OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech_client]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech__keyboardVoiceSelections));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences10LiveSpeech__visionOSLiveSpeechLaunchDistance));
  swift_release();
}

@end
