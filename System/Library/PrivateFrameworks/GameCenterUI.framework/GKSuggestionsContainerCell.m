@implementation GKSuggestionsContainerCell

+ (NSString)reuseIdentifier
{
  void *v2;

  static GKSuggestionsContainerCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (double)defaultCellHeight
{
  return static GKSuggestionsContainerCell.defaultCellHeight.getter();
}

- (UICollectionView)suggestionsCollectionView
{
  sub_1AB644D80();
}

- (void)setSuggestionsCollectionView:(id)a3
{
  id v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB644DD4();

}

- (UIView)containerView
{
  sub_1AB644E1C();
}

- (void)setContainerView:(id)a3
{
  id v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB644E70();

}

- (UIViewController)presentationViewController
{
  GKSuggestionsContainerCell.presentationViewController.getter();
}

- (void)setPresentationViewController:(id)a3
{
  id v5;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v6;

  v5 = a3;
  v6 = self;
  GKSuggestionsContainerCell.presentationViewController.setter(a3);

}

- (GKDashboardMultiplayerPickerDataSource)multiplayerPickerDataSource
{
  GKSuggestionsContainerCell.multiplayerPickerDataSource.getter();
}

- (void)setMultiplayerPickerDataSource:(id)a3
{
  id v5;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v6;

  v5 = a3;
  v6 = self;
  GKSuggestionsContainerCell.multiplayerPickerDataSource.setter(a3);

}

- (NSLayoutConstraint)containerViewLeadingConstraint
{
  sub_1AB6451C8();
}

- (void)setContainerViewLeadingConstraint:(id)a3
{
  id v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB64521C();

}

- (NSLayoutConstraint)containerViewTrailingConstraint
{
  sub_1AB645264();
}

- (void)setContainerViewTrailingConstraint:(id)a3
{
  id v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6452B8();

}

- (void)awakeFromNib
{
  self;
  GKSuggestionsContainerCell.awakeFromNib()();
}

- (void)configureWithDelegate:(id)a3 nearbyPlayers:(id)a4
{
  unint64_t v6;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v7;

  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  v6 = sub_1AB7DB0EC();
  swift_unknownObjectRetain();
  v7 = self;
  GKSuggestionsContainerCell.configure(delegate:nearbyPlayers:)(a3, v6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateNearbyPlayers:(id)a3
{
  uint64_t v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  v4 = sub_1AB7DB0EC();
  v5 = self;
  GKSuggestionsContainerCell.updateNearbyPlayers(_:)((Swift::OpaquePointer)v4);
}

- (id)nearbyIconTapHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = GKSuggestionsContainerCell.nearbyIconTapHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_45_0;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setNearbyIconTapHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB4E3E6C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  GKSuggestionsContainerCell.nearbyIconTapHandler.setter((uint64_t)v4, v5);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v2;

  v2 = self;
  GKSuggestionsContainerCell.layoutSubviews()();

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v7;
  Swift::Int v8;

  v6 = a3;
  v7 = self;
  v8 = GKSuggestionsContainerCell.collectionView(_:numberOfItemsInSection:)((UICollectionView *)v7, a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  v12 = GKSuggestionsContainerCell.collectionView(_:cellForItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v11;
  uint64_t v13;

  v6 = sub_1AB7D7D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = GKSuggestionsContainerCell.collectionView(_:shouldSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_1AB648F5C(self, (uint64_t)a2, a3, (uint64_t)a4, GKSuggestionsContainerCell.collectionView(_:didSelectItemAt:));
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_1AB648F5C(self, (uint64_t)a2, a3, (uint64_t)a4, GKSuggestionsContainerCell.collectionView(_:didDeselectItemAt:));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGSize result;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v12 = a3;
  v13 = a4;
  v14 = self;
  GKSuggestionsContainerCell.collectionView(_:layout:sizeForItemAt:)();
  v16 = v15;
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateVisibleItemsWithPlayers:(id)a3 excludedIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC01980);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  sub_1AB7DB0EC();
  if (a4)
  {
    sub_1AB7D7D14();
    v9 = sub_1AB7D7D68();
    v10 = 0;
  }
  else
  {
    v9 = sub_1AB7D7D68();
    v10 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v8, v10, 1, v9);
  v11 = self;
  GKSuggestionsContainerCell.updateVisibleItems(players:excludedIndexPath:)();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)handleLongPressGesture:(id)a3
{
  UILongPressGestureRecognizer *v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  GKSuggestionsContainerCell.handleLongPressGesture(_:)(v4);

}

- (int64_t)getSelectedPlayerCount
{
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v2;

  v2 = self;
  GKSuggestionsContainerCell.getSelectedPlayerCount()();
}

- (int64_t)getMaxPlayerCount
{
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v2;

  v2 = self;
  GKSuggestionsContainerCell.getMaxPlayerCount()();
}

- (void)didSelectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v19;
  uint64_t v20;

  v9 = sub_1AB7D7D68();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  sub_1AB7D7D14();
  v14 = sub_1AB7DAF90();
  v16 = v15;
  if (v13)
  {
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v13;
    v13 = sub_1AB4E3E6C;
  }
  else
  {
    v17 = 0;
  }
  v18 = a3;
  v19 = self;
  GKSuggestionsContainerCell.didSelectPlayerGroup(_:indexPath:dataSourceIdentifier:completion:)(v18, (uint64_t)v12, v14, v16, (uint64_t)v13, v17);
  sub_1AB46A9C4((uint64_t)v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didSelectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v18;
  uint64_t v19;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  v13 = sub_1AB7DB0EC();
  sub_1AB7D7D14();
  v14 = sub_1AB7DAF90();
  v16 = v15;
  if (v12)
  {
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v12;
    v12 = sub_1AB4E3E6C;
  }
  else
  {
    v17 = 0;
  }
  v18 = self;
  GKSuggestionsContainerCell.didSelectPlayers(_:indexPath:dataSourceIdentifier:completion:)(v13, (uint64_t)v11, v14, v16, (uint64_t)v12, v17);
  sub_1AB46A9C4((uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didDeselectPlayerGroup:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v19;
  uint64_t v20;

  v9 = sub_1AB7D7D68();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  sub_1AB7D7D14();
  v14 = sub_1AB7DAF90();
  v16 = v15;
  if (v13)
  {
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v13;
    v13 = sub_1AB4E3E6C;
  }
  else
  {
    v17 = 0;
  }
  v18 = a3;
  v19 = self;
  GKSuggestionsContainerCell.didDeselectPlayerGroup(_:indexPath:dataSourceIdentifier:completion:)(v18, (uint64_t)v12, v14, v16, (uint64_t)v13, v17);
  sub_1AB46A9C4((uint64_t)v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didDeselectPlayers:(id)a3 indexPath:(id)a4 dataSourceIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v18;
  uint64_t v19;

  v8 = sub_1AB7D7D68();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a6);
  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  v13 = sub_1AB7DB0EC();
  sub_1AB7D7D14();
  v14 = sub_1AB7DAF90();
  v16 = v15;
  if (v12)
  {
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v12;
    v12 = sub_1AB48638C;
  }
  else
  {
    v17 = 0;
  }
  v18 = self;
  GKSuggestionsContainerCell.didDeselectPlayers(_:indexPath:dataSourceIdentifier:completion:)(v13, (uint64_t)v11, v14, v16, (uint64_t)v12, v17);
  sub_1AB46A9C4((uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didExceedAvailablePlayers
{
  self;
  GKSuggestionsContainerCell.didExceedAvailablePlayers()();
}

- (id)getSuggestedPlayerGroups
{
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v2;

  v2 = self;
  GKSuggestionsContainerCell.getSuggestedPlayerGroups()();
}

- (BOOL)playerIsSelectable:(id)a3
{
  id v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = a3;
  v5 = self;
  GKSuggestionsContainerCell.playerIsSelectable(_:)((GKPlayer)v4);
}

- (BOOL)playerIsSelected:(id)a3
{
  id v4;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v5;

  v4 = a3;
  v5 = self;
  GKSuggestionsContainerCell.playerIsSelected(_:)((GKPlayer)v4);
}

- (void)donateGroupToPeopleSuggester:(id)a3
{
  id v4;

  v4 = a3;
  self;
  GKSuggestionsContainerCell.donateGroupToPeopleSuggester(_:)();
}

- (void)didAttemptSelectingAlreadySelectedPlayers:(id)a3 inGroup:(id)a4
{
  id v6;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *v7;

  sub_1AB476E40(0, (unint64_t *)&qword_1EEBFC5B8);
  sub_1AB7DB0EC();
  v6 = a4;
  v7 = self;
  GKSuggestionsContainerCell.didAttemptSelectingAlreadySelectedPlayers(_:inGroup:)();
}

- (_TtC12GameCenterUI26GKSuggestionsContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26GKSuggestionsContainerCell *)GKSuggestionsContainerCell.init(frame:)();
}

- (_TtC12GameCenterUI26GKSuggestionsContainerCell)initWithCoder:(id)a3
{
  id v3;
  _TtC12GameCenterUI26GKSuggestionsContainerCell *result;

  v3 = a3;
  GKSuggestionsContainerCell.init(coder:)();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  OUTLINED_FUNCTION_7_28();
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI26GKSuggestionsContainerCell_suggestionsDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI26GKSuggestionsContainerCell_nearbyIconTapHandler));
}

@end
