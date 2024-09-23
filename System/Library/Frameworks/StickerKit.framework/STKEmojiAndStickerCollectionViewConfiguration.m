@implementation STKEmojiAndStickerCollectionViewConfiguration

- (int64_t)userInterfaceIdiom
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_userInterfaceIdiom);
  swift_beginAccess();
  return *v2;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_userInterfaceIdiom);
  swift_beginAccess();
  *v4 = a3;
}

- (double)keyboardWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_keyboardWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setKeyboardWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_keyboardWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isKeyboardMinorEdgeWidth
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMinorEdgeWidth:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isKeyboardMinorEdgeWidth;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isInPopover
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isInPopover;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInPopover:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isInPopover;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)doesSupportImageGlyph
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportImageGlyph:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportImageGlyph;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)doesSupportGenmoji
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportGenmoji;
  swift_beginAccess();
  return *v2;
}

- (void)setDoesSupportGenmoji:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportGenmoji;
  swift_beginAccess();
  *v4 = a3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (STKEmojiAndStickerCollectionViewConfiguration)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_userInterfaceIdiom) = (Class)-1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_keyboardWidth) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isKeyboardMinorEdgeWidth) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_isInPopover) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportImageGlyph) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewConfiguration_doesSupportGenmoji) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[STKEmojiAndStickerCollectionViewConfiguration init](&v5, sel_init);
}

- (STKEmojiAndStickerCollectionViewConfiguration)initWithBSXPCCoder:(id)a3
{
  STKEmojiAndStickerCollectionViewConfiguration *v4;

  swift_unknownObjectRetain();
  v4 = (STKEmojiAndStickerCollectionViewConfiguration *)sub_234630D74(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  STKEmojiAndStickerCollectionViewConfiguration *v5;

  swift_unknownObjectRetain();
  v5 = self;
  EmojiAndStickerCollectionViewConfiguration.encode(withBSXPCCoder:)(a3);
  swift_unknownObjectRelease();

}

- (BOOL)isEqual:(id)a3
{
  STKEmojiAndStickerCollectionViewConfiguration *v4;
  STKEmojiAndStickerCollectionViewConfiguration *v5;
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
  v6 = EmojiAndStickerCollectionViewConfiguration.isEqual(_:)((uint64_t)v8);

  sub_2345B0988((uint64_t)v8, &qword_256176510);
  return v6 & 1;
}

@end
