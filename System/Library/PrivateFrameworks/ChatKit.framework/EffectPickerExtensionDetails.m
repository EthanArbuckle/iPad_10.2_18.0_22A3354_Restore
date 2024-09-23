@implementation EffectPickerExtensionDetails

- (void)createView
{
  _TtC7ChatKit28EffectPickerExtensionDetails *v2;

  v2 = self;
  sub_18E66FE14();

}

- (void)clearCurrentEffect
{
  _TtC7ChatKit28EffectPickerExtensionDetails *v3;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18E766B9C();
}

- (_TtC7ChatKit28EffectPickerExtensionDetails)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  _TtC7ChatKit28EffectPickerExtensionDetails *v8;
  objc_class *v9;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10E8C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC7ChatKit28EffectPickerExtensionDetails__currentEffect;
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v8 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10D6D0);
  sub_18E766B6C();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC7ChatKit28EffectPickerExtensionDetails_effectData) = (Class)MEMORY[0x1E0DEE9D8];

  v9 = (objc_class *)type metadata accessor for EffectPickerExtensionDetails();
  v11.receiver = v8;
  v11.super_class = v9;
  return -[EffectPickerExtensionDetails init](&v11, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit28EffectPickerExtensionDetails__currentEffect;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10E8C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
