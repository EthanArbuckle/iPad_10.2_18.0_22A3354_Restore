@implementation EmojiGenerationAddResult

- (STKSticker)sticker
{
  return (STKSticker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_sticker));
}

- (void)setSticker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_sticker);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_sticker) = (Class)a3;
  v3 = a3;

}

- (_TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_sticker) = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_searchString);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_captionText);
  *v5 = 0;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[EmojiGenerationAddResult init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StickerKitP33_05A313237EDA246051A5A9ECF50D6C3A24EmojiGenerationAddResult_sticker));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
