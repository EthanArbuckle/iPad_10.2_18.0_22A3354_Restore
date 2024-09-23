@implementation StickerPhotosCreationResult

- (STKSticker)sticker
{
  return (STKSticker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker));
}

- (void)setSticker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker) = (Class)a3;
  v3 = a3;

}

- (NSUUID)stickerUUID
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
     + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID;
  swift_beginAccess();
  sub_2345CCC7C((uint64_t)v6, (uint64_t)v5);
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

- (void)setStickerUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult *v11;
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
      + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID;
  swift_beginAccess();
  v11 = self;
  sub_2345CD468((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (NSArray)representations
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_representations))
  {
    sub_234717598();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2347178A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setRepresentations:(id)a3
{
  objc_class *v4;

  if (a3)
  {
    sub_234717598();
    v4 = (objc_class *)sub_2347178BC();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_representations) = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isLive
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_isLive);
}

- (void)setIsLive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_isLive) = a3;
}

- (_TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID;
  v5 = sub_234715A98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_representations) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_isLive) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[StickerPhotosCreationResult init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_sticker));
  sub_2345B0988((uint64_t)self+ OBJC_IVAR____TtC10StickerKitP33_19FC6B4034B7CA5830119A91FEF116A027StickerPhotosCreationResult_stickerUUID, (uint64_t *)&unk_2561716C0);
  swift_bridgeObjectRelease();
}

@end
