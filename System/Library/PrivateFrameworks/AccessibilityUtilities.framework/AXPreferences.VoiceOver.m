@implementation AXPreferences.VoiceOver

- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 completionHandler:(id)a4
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
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v17;
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
  v14[4] = &unk_1EE043CC8;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE043CD0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18C701780((uint64_t)v10, (uint64_t)&unk_1EE043CD8, (uint64_t)v15);
  swift_release();
}

- (void)setWithVoiceId:(NSString *)a3 forLanguage:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSString *v18;
  NSString *v19;
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE043980);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = v13;
  v14[5] = self;
  v15 = sub_18C711F88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE043CA8;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EE043CB0;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_18C701780((uint64_t)v12, (uint64_t)&unk_1EE043CB8, (uint64_t)v17);
  swift_release();
}

- (void)setWithVoiceId:(id)a3 forLanguage:(id)a4 rate:(float)a5 volume:(float)a6 pitch:(float)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v14;

  if (a3)
  {
    v11 = sub_18C711EA4();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  sub_18C711EA4();
  v14 = self;
  sub_18C6DCDEC(v11, v13, a5, a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)effectiveSpeakingRateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE043980);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_18C711F88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE043C88;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE043C90;
  v13[5] = v12;
  v14 = self;
  sub_18C701780((uint64_t)v8, (uint64_t)&unk_1EE043C98, (uint64_t)v13);
  swift_release();
}

- (void)effectiveSpeakingRateWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 completionHandler:(id)a4
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
  AXVoiceOverVoiceRotorItem *v16;
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v17;
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
  v14[4] = &unk_1EE043C68;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE043C70;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_18C701780((uint64_t)v10, (uint64_t)&unk_1EE043C78, (uint64_t)v15);
  swift_release();
}

- (void)setEffectiveSpeakingRate:(float)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE043980);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = swift_allocObject();
  *(float *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = v11;
  *(_QWORD *)(v12 + 32) = self;
  v13 = sub_18C711F88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE043C48;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE043C50;
  v15[5] = v14;
  v16 = self;
  sub_18C701780((uint64_t)v10, (uint64_t)&unk_1EE043C58, (uint64_t)v15);
  swift_release();
}

- (void)setEffectiveSpeakingRateWithCurrentRotor:(AXVoiceOverVoiceRotorItem *)a3 value:(float)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  AXVoiceOverVoiceRotorItem *v18;
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE043980);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(float *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = self;
  v15 = sub_18C711F88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE043C38;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EE043998;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_18C701780((uint64_t)v12, (uint64_t)&unk_1EE0439A0, (uint64_t)v17);
  swift_release();
}

- (_TtCC22AccessibilityUtilities13AXPreferences9VoiceOver)init
{
  _TtCC22AccessibilityUtilities13AXPreferences9VoiceOver *result;

  AXPreferences.VoiceOver.init()();
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__defaultVoiceSelectionsByLanguage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__voiceRotors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver___oldDomainRotors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__currentRotorVoiceIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__largeCursorEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__contentDescriptionLevel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__useDigitalCrownNavigation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__imageCaptionsEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__useTVToggleStyleNavigation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__continuousPathKeyboardStartTimeout));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__hearingAidRoutingEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__braillePanningAutoTurnsReadingContent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleDisplayOutputMode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleDisplayInputMode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesInputMode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleDisplaySyncInputOutputTables));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleDisplayInputTableIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleDisplayOutputTableIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesInputTableIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesActivationGestureEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesSoundOption));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesUsesHapticFeedback));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesUsesTypingSoundFeedback));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesDisplayEnteredText));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__brailleGesturesAutoActivateOnTextFields));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__defaultPunctuationGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__activities));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__selectedActivityId));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__languageDetectionEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__pitchChangeEnabled));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__selectedLanguage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences9VoiceOver__speakUpEnabled));
}

@end
