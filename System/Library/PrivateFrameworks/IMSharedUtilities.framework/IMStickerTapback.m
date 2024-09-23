@implementation IMStickerTapback

- (NSString)transferGUID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (IMStickerTapback)counterpart
{
  IMStickerTapback *v2;
  unsigned int v3;
  char **v4;
  id v5;

  v2 = self;
  v3 = -[IMTapback isRemoved](v2, sel_isRemoved);
  v4 = &selRef_visibleTapbackCounterpart;
  if (!v3)
    v4 = &selRef_removedTapbackCounterpart;
  v5 = objc_msgSend(v2, *v4);

  return (IMStickerTapback *)v5;
}

- (IMStickerTapback)removedTapbackCounterpart
{
  IMStickerTapback *v2;
  NSString *v3;
  id v4;
  void *v5;
  IMStickerTapback *v6;

  v2 = self;
  if (!-[IMTapback isRemoved](v2, sel_isRemoved))
  {
    v3 = -[IMStickerTapback transferGUID](v2, sel_transferGUID);
    sub_19E36F888();

    v4 = objc_allocWithZone((Class)IMStickerTapback);
    v5 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
    v6 = (IMStickerTapback *)objc_msgSend(v4, sel_initWithTransferGUID_isRemoved_, v5, 1);

    v2 = v6;
  }
  return v2;
}

- (IMStickerTapback)visibleTapbackCounterpart
{
  IMStickerTapback *v2;
  NSString *v3;
  id v4;
  void *v5;
  IMStickerTapback *v6;

  v2 = self;
  if (-[IMTapback isRemoved](v2, sel_isRemoved))
  {
    v3 = -[IMStickerTapback transferGUID](v2, sel_transferGUID);
    sub_19E36F888();

    v4 = objc_allocWithZone((Class)IMStickerTapback);
    v5 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
    v6 = (IMStickerTapback *)objc_msgSend(v4, sel_initWithTransferGUID_isRemoved_, v5, 0);

    v2 = v6;
  }
  return v2;
}

- (IMStickerTapback)initWithTransferGUID:(id)a3 isRemoved:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v4 = a4;
  v6 = sub_19E36F888();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___IMStickerTapback__transferGuid);
  *v7 = v6;
  v7[1] = v8;
  if (v4)
    v9 = 3007;
  else
    v9 = 2007;
  v11.receiver = self;
  v11.super_class = (Class)IMStickerTapback;
  return -[IMTapback initWithAssociatedMessageType:](&v11, sel_initWithAssociatedMessageType_, v9);
}

- (IMStickerTapback)initWithCoder:(id)a3
{
  id v3;
  IMStickerTapback *result;

  v3 = a3;
  sub_19E36FC84();
  swift_bridgeObjectRelease();
  result = (IMStickerTapback *)sub_19E36FCF0();
  __break(1u);
  return result;
}

- (IMStickerTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  IMStickerTapback *result;

  sub_19E36FC84();
  swift_bridgeObjectRelease();
  result = (IMStickerTapback *)sub_19E36FCF0();
  __break(1u);
  return result;
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  IMStickerTapback *v4;
  void *v5;

  v4 = self;
  v5 = (void *)IMStickerTapback.actionStringFormat(withAdaptiveImageGlyphAvailable:)(a3);

  return v5;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3
{
  id v4;
  IMStickerTapback *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    v5 = self;
    sub_19E32DE04(MEMORY[0x1E0DEE9D8]);
    type metadata accessor for Key(0);
    sub_19E329BA8();
    v6 = (void *)sub_19E36F81C();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend((id)objc_opt_self(), sel_attributedStringWithAdaptiveImageGlyph_attributes_, v4, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:(id)a3
{
  uint64_t (**v4)(void *, void *);
  IMStickerTapback *v5;
  NSString *v6;
  void *v7;
  id v8;

  v4 = (uint64_t (**)(void *, void *))_Block_copy(a3);
  v5 = self;
  v6 = -[IMStickerTapback transferGUID](v5, sel_transferGUID);
  sub_19E36F888();

  v7 = (void *)sub_19E36F864();
  v8 = (id)v4[2](v4, v7);
  swift_bridgeObjectRelease();

  _Block_release(v4);
  return v8;
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return sub_19E347DA8(a3, (uint64_t)&unk_1E3FB2308) & 1;
}

- (BOOL)isEqual:(id)a3
{
  IMStickerTapback *v4;
  IMStickerTapback *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IMStickerTapback.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (IMStickerTapback)initWithAssociatedMessageType:(int64_t)a3
{
  IMStickerTapback *result;

  result = (IMStickerTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
