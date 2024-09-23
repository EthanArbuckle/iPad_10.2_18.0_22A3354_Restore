@implementation MOSuggestionCollectionViewSingleAssetCell

- (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell *)MOSuggestionCollectionViewSingleAssetCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)handleTraitChange
{
  void *v2;
  _TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_platterView);
  v3 = self;
  v6 = v2;
  v4 = -[MOSuggestionCollectionViewSingleAssetCell traitCollection](v3, "traitCollection");
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  specialized static MOSuggestionTheme.Styles.styleViewAsPlatter(view:traitCollection:)(v6, (uint64_t)v5);
}

- (_TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCollectionViewSingleAssetCell.init(coder:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = MOSuggestionCollectionViewSingleAssetCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)prepareForReuse
{
  _TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell *v2;

  v2 = self;
  MOSuggestionCollectionViewSingleAssetCell.prepareForReuse()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_assetGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_journalButton));
  swift_release(*(_QWORD *)&self->assetGridView[OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_accessoryButtonAction]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_cellViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService41MOSuggestionCollectionViewSingleAssetCell_platterView));
}

@end
