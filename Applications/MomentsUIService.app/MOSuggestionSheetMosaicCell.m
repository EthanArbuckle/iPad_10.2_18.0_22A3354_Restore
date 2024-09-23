@implementation MOSuggestionSheetMosaicCell

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionSheetMosaicCell();
  return -[MOSuggestionSheetMosaicCell isSelected](&v3, "isSelected");
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
  v8.super_class = (Class)type metadata accessor for MOSuggestionSheetMosaicCell();
  v4 = (char *)v8.receiver;
  -[MOSuggestionSheetMosaicCell setSelected:](&v8, "setSelected:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC16MomentsUIService27MOSuggestionSheetMosaicCell_checkPlatterView];
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isSelected", v8.receiver, v8.super_class);
    (*(void (**)(id))((swift_isaMask & *v6) + 0xA0))(v7);

  }
  MOSuggestionSheetMosaicCell.updateUnselectedBlur()();

}

- (_TtC16MomentsUIService27MOSuggestionSheetMosaicCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService27MOSuggestionSheetMosaicCell *)MOSuggestionSheetMosaicCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService27MOSuggestionSheetMosaicCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetMosaicCell.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC16MomentsUIService27MOSuggestionSheetMosaicCell *v2;

  v2 = self;
  MOSuggestionSheetMosaicCell.layoutSubviews()();

}

- (void)prepareForReuse
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionSheetMosaicCell();
  v2 = v4.receiver;
  v3 = -[MOSuggestionSheetMosaicCell prepareForReuse](&v4, "prepareForReuse");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x170))(v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionSheetMosaicCell_assetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionSheetMosaicCell_checkPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionSheetMosaicCell_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionSheetMosaicCell_overflowView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionSheetMosaicCell_assetViewModel));
}

@end
