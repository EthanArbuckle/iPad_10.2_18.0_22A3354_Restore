@implementation InCallControlsCollectionViewController

- (_TtC15ConversationKit38InCallControlsCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsCollectionViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit38InCallControlsCollectionViewController *v2;

  v2 = self;
  InCallControlsCollectionViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)blockStatusDidUpdate
{
  _TtC15ConversationKit38InCallControlsCollectionViewController *v2;

  v2 = self;
  InCallControlsCollectionViewController.blockStatusDidUpdate()();

}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC15ConversationKit38InCallControlsCollectionViewController *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for Notification();
    v9 = 0;
  }
  else
  {
    v8 = type metadata accessor for Notification();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  InCallControlsCollectionViewController.handleContentSizeCategoryDidChange(_:)();

  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)v7, &demangling cache variable for type metadata for Notification?);
}

- (_TtC15ConversationKit38InCallControlsCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  InCallControlsCollectionViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_menuHostViewController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController____lazy_storage___featureFlags);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_activity, &demangling cache variable for type metadata for Activity?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_conversation);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_controlsManager);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_participantsViewControllerDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_inCallControlsCollectionViewControllerDelegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_collectionView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_dataSource);
  swift_release();
  swift_release();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_sectionHeaderViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<InCallControlsSectionHeaderView>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_activityCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsActivityCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_titleCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsTitleCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_statusCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsStatusCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_participantCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsParticipantCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_addParticipantCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsAddParticipantCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_shareLinkCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsShareLinkCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_ignoreLMIRequestsCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsIgnoreLMIRequestsCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_toggleCaptionsCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsToggleCaptionsCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_fallbackCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<UICollectionViewListCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_openMessagesCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsOpenMessagesCell, UUID>?);
  OUTLINED_FUNCTION_9_42((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_blockUnknownCallerCellRegistration);
  OUTLINED_FUNCTION_9_42((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_blockAllUnknownCallersCellRegistration);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_reportUnknownCallerCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsReportCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_pttTitleCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsPTTTitleCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_leavePTTChannelCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsPTTLeaveChannelCell, UUID>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_leaveChannelFooterViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<InCallControlsPTTLeaveChannelFooterView>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_openPTTAppCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsPTTOpenAppCell, UUID>?);
  OUTLINED_FUNCTION_0();
}

- (void)didTapPTTLeaveChannelButton:(id)a3
{
  id v4;
  _TtC15ConversationKit38InCallControlsCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsCollectionViewController.didTapPTTLeaveChannelButton(_:)((uint64_t)v4);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15ConversationKit38InCallControlsCollectionViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  InCallControlsCollectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
