@implementation MOSuggestionCollectionViewListCell

- (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell *)specialized MOSuggestionCollectionViewListCell.init(frame:)();
}

- (void)handleTraitChange
{
  uint64_t (*v2)(void);
  _TtC16MomentsUIService34MOSuggestionCollectionViewListCell *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0xD0);
  v3 = self;
  v6 = (id)v2();
  v4 = -[MOSuggestionCollectionViewListCell traitCollection](v3, "traitCollection");
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  specialized static MOSuggestionTheme.Styles.styleViewAsPlatter(view:traitCollection:)(v6, (uint64_t)v5);
}

- (_TtC16MomentsUIService34MOSuggestionCollectionViewListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCollectionViewListCell.init(coder:)();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16MomentsUIService34MOSuggestionCollectionViewListCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  MOSuggestionCollectionViewListCell.updateConfiguration(using:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for MOSuggestionCollectionViewListCell();
  v2 = v15.receiver;
  v3 = -[MOSuggestionCollectionViewListCell layoutSubviews](&v15, "layoutSubviews");
  v4 = (void *)(*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x138))(v3);
  v6 = (void *)(*(uint64_t (**)(void *, uint64_t))((swift_isaMask & *v2) + 0xD0))(v4, v5);
  objc_msgSend(v6, "frame", v15.receiver, v15.super_class);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "setFrame:", v8, v10, v12, v14);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC16MomentsUIService34MOSuggestionCollectionViewListCell *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = MOSuggestionCollectionViewListCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)prepareForReuse
{
  _TtC16MomentsUIService34MOSuggestionCollectionViewListCell *v2;

  v2 = self;
  MOSuggestionCollectionViewListCell.prepareForReuse()();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_assetViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_buttonHolder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_playButton));
  swift_release(*(_QWORD *)&self->assetViewModel[OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_accessoryButtonAction]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_cellViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_assetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_addedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionCollectionViewListCell_assetContainerView));
}

@end
