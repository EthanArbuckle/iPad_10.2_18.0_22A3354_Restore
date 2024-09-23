@implementation AXPreferences.SpokenContentSettings

- (void)speechVoiceIdentifierForLanguage:(NSString *)a3 exists:(BOOL *)a4 completionHandler:(id)a5
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
  _TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE043980);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v16[4] = &unk_1EE0439B0;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EE0439B8;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_18C701780((uint64_t)v12, (uint64_t)&unk_1EE0439C0, (uint64_t)v17);
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
  _TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings *v20;
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
  v16[4] = &unk_1EE043990;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EE043998;
  v17[5] = v16;
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_18C701780((uint64_t)v12, (uint64_t)&unk_1EE0439A0, (uint64_t)v17);
  swift_release();
}

- (_TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings)init
{
  uint64_t v3;
  _TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings__voiceSelectionsByLanguage;
  v4 = self;
  v5 = MEMORY[0x1E0DEE9D8];
  v6 = sub_18C6D2750(MEMORY[0x1E0DEE9D8]);
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_18C6D302C(v6, 0xD00000000000002DLL, 0x800000018C734310, &qword_1EE043A10);
  v7 = OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings__macroLanguageDisambiguations;
  v8 = sub_18C6D2908(v5);
  *(Class *)((char *)&v4->super.isa + v7) = (Class)sub_18C6D302C(v8, 0xD000000000000029, 0x800000018C7342E0, &qword_1EE043A00);

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for AXPreferences.SpokenContentSettings();
  return -[AXPreferences.SpokenContentSettings init](&v10, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings__voiceSelectionsByLanguage));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC22AccessibilityUtilities13AXPreferences21SpokenContentSettings__macroLanguageDisambiguations));
}

@end
