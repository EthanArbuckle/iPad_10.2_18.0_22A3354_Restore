@implementation MOSuggestionCollectionViewHeader

- (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MomentsUIService32MOSuggestionCollectionViewHeader *v7;
  void *v8;
  _TtC16MomentsUIService32MOSuggestionCollectionViewHeader *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_subTitleLabel) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewHeader();
  v7 = -[MOSuggestionCollectionViewHeader initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  v8 = (void *)objc_opt_self(UIColor);
  v9 = v7;
  v10 = objc_msgSend(v8, "secondarySystemBackgroundColor");
  -[MOSuggestionCollectionViewHeader setBackgroundColor:](v9, "setBackgroundColor:", v10);

  return v9;
}

- (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader)initWithCoder:(id)a3
{
  id v4;
  _TtC16MomentsUIService32MOSuggestionCollectionViewHeader *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_subTitleLabel) = 0;
  v4 = a3;

  result = (_TtC16MomentsUIService32MOSuggestionCollectionViewHeader *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionCollectionViewHeader.swift", 55, 2, 32, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MomentsUIService32MOSuggestionCollectionViewHeader *v2;

  v2 = self;
  MOSuggestionCollectionViewHeader.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionCollectionViewHeader_subTitleLabel));
}

@end
