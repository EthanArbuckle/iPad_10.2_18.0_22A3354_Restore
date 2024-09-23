@implementation STKImageGlyph

- (NSString)identifier
{
  return (NSString *)sub_2346C6C04(self, (uint64_t)a2, (void (*)(void))sub_2346C3620);
}

- (NSUUID)stickerUUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2345B0CF0((uint64_t)self + OBJC_IVAR___STKImageGlyph_stickerUUID, (uint64_t)v5, (uint64_t *)&unk_2561716C0);
  v6 = sub_234715A98();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_234715A68();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSUUID *)v8;
}

- (unint64_t)stickerEffectType
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_stickerEffectType);
}

- (int64_t)stickerSourceType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_stickerSourceType);
}

- (NSString)avatarIdentifier
{
  return (NSString *)sub_2346C3AD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKImageGlyph_avatarIdentifier);
}

- (NSString)poseIdentifier
{
  return (NSString *)sub_2346C3AD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKImageGlyph_poseIdentifier);
}

- (NSString)emojiString
{
  return (NSString *)sub_2346C3AD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKImageGlyph_emojiString);
}

- (int64_t)type
{
  STKImageGlyph *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2346C3B9C();

  return v3;
}

- (BOOL)isEmpty
{
  STKImageGlyph *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_2346C3CE0();

  return v3;
}

+ (id)imageGlyphForGlyphIdentifier:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  char *v5;

  v3 = sub_234717754();
  v5 = _s10StickerKit10ImageGlyphC05imageD03forACSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)toString
{
  return (NSString *)sub_2346C6224(self, (uint64_t)a2, (void (*)(void))sub_2346C4108);
}

- (void)createUIStickerWithLoadAllRepresentations:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  STKImageGlyph *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25617ACD8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25617ACE0;
  v14[5] = v13;
  v15 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_25617ACE8, (uint64_t)v14);
  swift_release();
}

- (void)createUIStickerWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  STKImageGlyph *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25617ACC8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256179330;
  v12[5] = v11;
  v13 = self;
  sub_2346F6DA0((uint64_t)v7, (uint64_t)&unk_256176470, (uint64_t)v12);
  swift_release();
}

- (id)createStickerWithMetadataOnly
{
  return sub_2346C4C0C(self, (uint64_t)a2, MEMORY[0x24BEB1250]);
}

- (id)createStickerWithAllRepresentations
{
  return sub_2346C4C0C(self, (uint64_t)a2, MEMORY[0x24BEB1248]);
}

- (void)createEmojiImageTextAttachmentWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  STKImageGlyph *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v5 = sub_2347174D8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEB1248], v5);
  v11 = self;
  v12 = sub_2346C4E04((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_2345B5DA8;
    *(_QWORD *)(v13 + 24) = v10;
    v14 = v12;
    swift_retain();
    sub_2345F9B78((uint64_t)sub_2346CB7D8, v13);

    swift_release();
    swift_release();

  }
  else
  {

    swift_release();
  }
}

- (id)searchText
{
  return sub_2346C6224(self, (uint64_t)a2, (void (*)(void))sub_2346C5908);
}

- (id)accessibilityCaption
{
  return sub_2346C6224(self, (uint64_t)a2, (void (*)(void))sub_2346C5DA8);
}

- (NSString)debugDescription
{
  return (NSString *)sub_2346C6C04(self, (uint64_t)a2, (void (*)(void))sub_2346C6298);
}

- (STKImageGlyph)init
{
  STKImageGlyph *result;

  result = (STKImageGlyph *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2345B0988((uint64_t)self + OBJC_IVAR___STKImageGlyph_stickerUUID, (uint64_t *)&unk_2561716C0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2345CA2A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKImageGlyph_emoji), *(_QWORD *)&self->_anon_0[OBJC_IVAR___STKImageGlyph_emoji], *(_QWORD *)&self->stickerEffectType[OBJC_IVAR___STKImageGlyph_emoji], *(_QWORD *)&self->stickerSourceType[OBJC_IVAR___STKImageGlyph_emoji], *(_QWORD *)&self->avatarIdentifier[OBJC_IVAR___STKImageGlyph_emoji], *(_QWORD *)&self->avatarIdentifier[OBJC_IVAR___STKImageGlyph_emoji + 8], self->poseIdentifier[OBJC_IVAR___STKImageGlyph_emoji]);

}

@end
