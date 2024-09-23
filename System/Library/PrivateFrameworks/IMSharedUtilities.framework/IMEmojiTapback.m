@implementation IMEmojiTapback

- (NSString)associatedMessageEmoji
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (IMEmojiTapback)counterpart
{
  IMEmojiTapback *v2;
  unsigned int v3;
  char **v4;
  id v5;

  v2 = self;
  v3 = -[IMTapback isRemoved](v2, sel_isRemoved);
  v4 = &selRef_visibleTapbackCounterpart;
  if (!v3)
    v4 = &selRef_removedTapbackCounterpart;
  v5 = objc_msgSend(v2, *v4);

  return (IMEmojiTapback *)v5;
}

- (IMEmojiTapback)removedTapbackCounterpart
{
  IMEmojiTapback *v2;
  id v3;
  void *v4;
  IMEmojiTapback *v5;

  v2 = self;
  if (!-[IMTapback isRemoved](v2, sel_isRemoved))
  {
    v3 = objc_allocWithZone((Class)IMEmojiTapback);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
    v5 = (IMEmojiTapback *)objc_msgSend(v3, sel_initWithEmoji_isRemoved_, v4, 1);

    v2 = v5;
  }
  return v2;
}

- (IMEmojiTapback)visibleTapbackCounterpart
{
  IMEmojiTapback *v2;
  id v3;
  void *v4;
  IMEmojiTapback *v5;

  v2 = self;
  if (-[IMTapback isRemoved](v2, sel_isRemoved))
  {
    v3 = objc_allocWithZone((Class)IMEmojiTapback);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
    v5 = (IMEmojiTapback *)objc_msgSend(v3, sel_initWithEmoji_isRemoved_, v4, 0);

    v2 = v5;
  }
  return v2;
}

- (IMEmojiTapback)initWithEmoji:(id)a3 isRemoved:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v4 = a4;
  v6 = sub_19E36F888();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___IMEmojiTapback_emoji);
  *v7 = v6;
  v7[1] = v8;
  if (v4)
    v9 = 3006;
  else
    v9 = 2006;
  v11.receiver = self;
  v11.super_class = (Class)IMEmojiTapback;
  return -[IMTapback initWithAssociatedMessageType:](&v11, sel_initWithAssociatedMessageType_, v9);
}

- (IMEmojiTapback)initWithCoder:(id)a3
{
  return (IMEmojiTapback *)IMEmojiTapback.init(coder:)(a3);
}

- (IMEmojiTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_19E36F828();
  else
    v3 = 0;
  return (IMEmojiTapback *)IMEmojiTapback.init(imRemoteObjectSerializedDictionary:)(v3);
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  IMEmojiTapback *v3;
  id v4;

  v3 = self;
  v4 = _sSo14IMEmojiTapbackC17IMSharedUtilitiesE18actionStringFormat31withAdaptiveImageGlyphAvailableSo022IMTapbackSummaryActionfG0CSgSb_tF_0();

  return v4;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3
{
  id v4;
  IMEmojiTapback *v5;
  NSString *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = self;
  v6 = -[IMEmojiTapback associatedMessageEmoji](v5, sel_associatedMessageEmoji);
  sub_19E36F888();

  v7 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v8 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithString_, v8);

  return v9;
}

- (NSString)description
{
  IMEmojiTapback *v2;
  void *v3;

  v2 = self;
  IMEmojiTapback.description.getter();

  v3 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return sub_19E347DA8(a3, (uint64_t)&unk_1E3FB22A8) & 1;
}

- (BOOL)isEqual:(id)a3
{
  IMEmojiTapback *v4;
  IMEmojiTapback *v5;
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
  v6 = IMEmojiTapback.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (IMEmojiTapback)initWithAssociatedMessageType:(int64_t)a3
{
  IMEmojiTapback *result;

  result = (IMEmojiTapback *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
