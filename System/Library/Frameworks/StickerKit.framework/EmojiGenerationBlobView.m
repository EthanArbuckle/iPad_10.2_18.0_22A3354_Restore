@implementation EmojiGenerationBlobView

- (_TtC10StickerKit23EmojiGenerationBlobView)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit23EmojiGenerationBlobView *)EmojiGenerationBlobView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)alpha
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiGenerationBlobView();
  -[EmojiGenerationBlobView alpha](&v3, sel_alpha);
  return result;
}

- (void)setAlpha:(double)a3
{
  _TtC10StickerKit23EmojiGenerationBlobView *v4;

  v4 = self;
  sub_2346766D4(a3);

}

- (_TtC10StickerKit23EmojiGenerationBlobView)initWithCoder:(id)a3
{
  return (_TtC10StickerKit23EmojiGenerationBlobView *)EmojiGenerationBlobView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_gpController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_imageView));
  swift_release();
  swift_release();
  sub_2345B08A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_generationResult), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_generationResult), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_generationResult), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_generationResult), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_generationResult));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_contextMenuInteraction));
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_delegate);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7;
  id v8;
  _TtC10StickerKit23EmojiGenerationBlobView *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = _s10StickerKit23EmojiGenerationBlobViewC22contextMenuInteraction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedL0CSgSo09UIContexthI0C_So0rH13ConfigurationCSo9NSCopying_ptF_0(v7);

  swift_unknownObjectRelease();
  return v10;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC10StickerKit23EmojiGenerationBlobView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = _s10StickerKit23EmojiGenerationBlobViewC22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

- (void)addCaption
{
  _TtC10StickerKit23EmojiGenerationBlobView *v2;

  v2 = self;
  sub_234678D70();

}

- (void)saveToStickers
{
  _TtC10StickerKit23EmojiGenerationBlobView *v2;

  v2 = self;
  sub_234678E38();

}

- (void)copyAction
{
  _TtC10StickerKit23EmojiGenerationBlobView *v2;

  v2 = self;
  sub_234678F90();

}

- (void)shareAction
{
  _TtC10StickerKit23EmojiGenerationBlobView *v2;

  v2 = self;
  sub_2346790E8();

}

- (void)reportConcern
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC10StickerKit23EmojiGenerationBlobView *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_23471797C();
  v7 = self;
  v8 = sub_234717970();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_23460CCF0((uint64_t)v5, (uint64_t)&unk_2561784D0, (uint64_t)v9);

  swift_release();
}

@end
