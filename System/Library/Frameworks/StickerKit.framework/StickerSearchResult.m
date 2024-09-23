@implementation StickerSearchResult

- (STKSticker)sticker
{
  return (STKSticker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_sticker));
}

- (void)setSticker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_sticker);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_sticker) = (Class)a3;
  v3 = a3;

}

- (int64_t)index
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_index);
}

- (void)setIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_index) = (Class)a3;
}

- (_TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_sticker) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_index) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[StickerSearchResult init](&v5, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F19StickerSearchResult_sticker));
}

@end
