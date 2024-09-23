@implementation MOSuggestionCollectionViewCell

- (_TtC16MomentsUIService30MOSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionCollectionViewCell *)MOSuggestionCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)handleTraitChange
{
  void *v2;
  id v3;
  id v4;
  _TtC16MomentsUIService30MOSuggestionCollectionViewCell *v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_gridContainerView);
  v5 = self;
  v3 = -[MOSuggestionCollectionViewCell traitCollection](v5, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  specialized static MOSuggestionTheme.Styles.styleViewAsPlatter(view:traitCollection:)(v2, (uint64_t)v4);
}

- (_TtC16MomentsUIService30MOSuggestionCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCollectionViewCell.init(coder:)();
}

- (void)prepareForReuse
{
  _TtC16MomentsUIService30MOSuggestionCollectionViewCell *v2;

  v2 = self;
  MOSuggestionCollectionViewCell.prepareForReuse()();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MomentsUIService30MOSuggestionCollectionViewCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = MOSuggestionCollectionViewCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_assetGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_gridContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_journalButton));
  swift_release(*(_QWORD *)&self->assetGridView[OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_accessoryButtonAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_gridViewHeightAnchor));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_cellViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_photoMemoryBanner));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_bannerHiddenConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionCollectionViewCell_bannerPresentConstraints));
}

@end
