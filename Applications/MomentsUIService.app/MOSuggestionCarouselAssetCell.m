@implementation MOSuggestionCarouselAssetCell

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  return -[MOSuggestionCarouselAssetCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  _QWORD *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  v4 = (char *)v8.receiver;
  -[MOSuggestionCarouselAssetCell setSelected:](&v8, "setSelected:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_checkPlatterView];
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isSelected", v8.receiver, v8.super_class);
    (*(void (**)(id))((swift_isaMask & *v6) + 0xA0))(v7);

    v4 = (char *)v6;
  }

}

- (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell *)specialized MOSuggestionCarouselAssetCell.init(frame:)();
}

- (_TtC16MomentsUIService29MOSuggestionCarouselAssetCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCarouselAssetCell.init(coder:)();
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  v2 = (char *)v4.receiver;
  -[MOSuggestionCarouselAssetCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  char *v2;
  _QWORD *v3;
  void (*v4)(_QWORD *, uint64_t);
  _QWORD *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MOSuggestionCarouselAssetCell();
  v2 = (char *)v7.receiver;
  -[MOSuggestionCarouselAssetCell prepareForReuse](&v7, "prepareForReuse");
  v3 = *(_QWORD **)&v2[OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetView];
  v4 = *(void (**)(_QWORD *, uint64_t))((swift_isaMask & *v3) + 0xC8);
  v5 = v3;
  v4(v5, v6);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_checkPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_blurEffectView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_assetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionCarouselAssetCell_keyColor));
}

@end
