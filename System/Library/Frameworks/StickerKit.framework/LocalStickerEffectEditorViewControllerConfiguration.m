@implementation LocalStickerEffectEditorViewControllerConfiguration

- (NSUUID)stickerIdentifier
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self
     + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier;
  swift_beginAccess();
  sub_2345B0CF0((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_2561716C0);
  v7 = sub_234715A98();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_234715A68();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (void)setStickerIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_234715A80();
    v8 = sub_234715A98();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_234715A98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self
      + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier;
  swift_beginAccess();
  v11 = self;
  sub_2345CD468((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self
     + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier;
  v5 = sub_234715A98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[LocalStickerEffectEditorViewControllerConfiguration init](&v7, sel_init);
}

- (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration)initWithBSXPCCoder:(id)a3
{
  _TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *v4;

  swift_unknownObjectRetain();
  v4 = (_TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *)sub_2346975A0(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  _TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_2346935D0(a3);
  swift_unknownObjectRelease();

}

- (BOOL)isEqual:(id)a3
{
  _TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *v4;
  _TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_234717ED4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_234693764((uint64_t)v8);

  sub_2345B0988((uint64_t)v8, &qword_256176510);
  return v6 & 1;
}

- (void).cxx_destruct
{
  sub_2345B0988((uint64_t)self + OBJC_IVAR____TtC10StickerKit51LocalStickerEffectEditorViewControllerConfiguration_stickerIdentifier, (uint64_t *)&unk_2561716C0);
}

@end
