@implementation FTRecentsListViewController

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  FTRecentsListViewController *v14;
  uint64_t v15;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a4;
  v14 = self;
  RecentsListViewController.collectionView(_:willDisplay:forItemAt:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)viewDidAppear:(BOOL)a3
{
  FTRecentsListViewController *v4;

  v4 = self;
  RecentsListViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.viewWillLayoutSubviews()();

}

- (void)willEnterForegroundNotification:(id)a3
{
  @objc RecentsListViewController.deleteAllRecents(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))RecentsListViewController.willEnterForegroundNotification(_:));
}

- (void)viewDidLoad
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  FTRecentsListViewController *v4;

  v4 = self;
  RecentsListViewController.viewWillAppear(_:)(a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  FTRecentsListViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  RecentsListViewController.scrollViewDidScroll(_:)(v4);

}

- (FTRecentsListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  RecentsListViewController.init(coder:)();
}

- (void)viewWillDisappear:(BOOL)a3
{
  FTRecentsListViewController *v4;

  v4 = self;
  RecentsListViewController.viewWillDisappear(_:)(a3);

}

- (FTRecentsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  RecentsListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_macCatalystDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_recentCallProvider);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_detailControllerFactory, &demangling cache variable for type metadata for RecentCallDetailControllerFactoryProtocol?);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_avatarViewControllerSettings);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_conversationManager);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_indexPathForMenu);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_meCardSharingSettingsViewControllerObserver);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_callItemBlockContactsDelegate);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_linkCoordinator);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_161(OBJC_IVAR___FTRecentsListViewController_presentScreenTimeShield);
  OUTLINED_FUNCTION_301();
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_headerView);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_featureFlags);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_161(OBJC_IVAR___FTRecentsListViewController____lazy_storage___supplementaryViewProvider);
  OUTLINED_FUNCTION_161(OBJC_IVAR___FTRecentsListViewController____lazy_storage___cellProvider);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController____lazy_storage___collectionView);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController____lazy_storage___cellBackgroundConfiguration, &demangling cache variable for type metadata for UIBackgroundConfiguration?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsCallItemCalls, &demangling cache variable for type metadata for UICollectionView.CellRegistration<RecentsCollectionViewCell, RecentsCallItem>?);
  OUTLINED_FUNCTION_160(OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsSensitveCallItemCalls);
  OUTLINED_FUNCTION_160(OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsCallItemOngoingCalls);
  OUTLINED_FUNCTION_160(OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsCallItemLinks);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_sectionHeaderViewRegistrationForSupplementalView, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<UICollectionViewListCell>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_headerButtonsViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<RecentsHeaderButtonsView>?);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController____lazy_storage___deleteButtonItem);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController____lazy_storage___flexibleSpaceButtonItem);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController____lazy_storage___collectionLayoutConfiguration, &demangling cache variable for type metadata for UICollectionLayoutListConfiguration?);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController____lazy_storage___editMenu);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController____lazy_storage___avatarViewControllerDelegate);
  swift_bridgeObjectRelease();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_messageUUIDForDeferredPresentation, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  OUTLINED_FUNCTION_31(OBJC_IVAR___FTRecentsListViewController_onboardingController);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_joinCallThrottlingIndexPath);
  OUTLINED_FUNCTION_18();
}

- (void)deleteAllRecents:(id)a3
{
  @objc RecentsListViewController.deleteAllRecents(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))RecentsListViewController.deleteAllRecents(_:));
}

- (void)didEnterBackgroundNotification:(id)a3
{
  @objc RecentsListViewController.deleteAllRecents(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))RecentsListViewController.didEnterBackgroundNotification(_:));
}

- (void)didSelectAccessoryViewForOngoingCallWithSender:(id)a3
{
  UIButton *v4;
  FTRecentsListViewController *v5;

  v4 = (UIButton *)a3;
  v5 = self;
  RecentsListViewController.didSelectAccessoryViewForOngoingCall(sender:)(v4);

}

- (void)didSelectAccessoryViewForRecentCallWithSender:(id)a3
{
  UIButton *v4;
  FTRecentsListViewController *v5;

  v4 = (UIButton *)a3;
  v5 = self;
  RecentsListViewController.didSelectAccessoryViewForRecentCall(sender:)(v4);

}

- (void)didSelectAccessoryViewForLinkWithSender:(id)a3
{
  UIButton *v4;
  FTRecentsListViewController *v5;

  v4 = (UIButton *)a3;
  v5 = self;
  RecentsListViewController.didSelectAccessoryViewForLink(sender:)(v4);

}

- (void)didTapNewCallButton
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.didTapNewCallButton()();

}

- (void)didTapNewLinkButtonFrom:(id)a3
{
  id v4;
  FTRecentsListViewController *v5;

  v4 = a3;
  v5 = self;
  RecentsListViewController.didTapNewLinkButton(from:)((uint64_t)v4);

}

- (void)presentOnboardingViewController
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.presentOnboardingViewController()();

}

- (void)beginEditing
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.beginEditing()();

}

- (void)endEditing
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.endEditing()();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  FTRecentsListViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  RecentsListViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  FTRecentsListViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  RecentsListViewController.collectionView(_:didDeselectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  FTRecentsListViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a3;
  v12 = self;
  RecentsListViewController.collectionView(_:contextMenuConfigurationForItemAt:point:)();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  UICollectionView *v6;
  id v7;
  FTRecentsListViewController *v8;
  UIContextMenuConfiguration v9;
  void *v10;

  v6 = (UICollectionView *)a3;
  v7 = a4;
  v8 = self;
  v10 = (void *)RecentsListViewController.collectionView(_:previewForHighlightingContextMenuWithConfiguration:)(v6, v9);

  return v10;
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  @objc RecentsListViewController.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)RecentsListViewController.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:), v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17,
    v18);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  @objc RecentsListViewController.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)RecentsListViewController.collectionView(_:willDisplaySupplementaryView:forElementKind:at:), v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17,
    v18);
}

- (void)didConfirmForInterventionViewController:(id)a3
{
  @objc RecentsListViewController.didConfirm(forInterventionViewController:)();
}

- (void)didRejectForInterventionViewController:(id)a3
{
  @objc RecentsListViewController.didConfirm(forInterventionViewController:)();
}

- (void)dismissMoreHelp
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.dismissMoreHelp()();

}

- (void)contactStoreDidChange:(id)a3
{
  @objc RecentsListViewController.deleteAllRecents(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))RecentsListViewController.contactStoreDidChange(_:));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  FTRecentsListViewController *v6;

  v6 = self;
  RecentsListViewController.setEditing(_:animated:)(a3, a4);

}

- (void)deleteButtonAction:(id)a3
{
  id v4;
  FTRecentsListViewController *v5;

  v4 = a3;
  v5 = self;
  RecentsListViewController.deleteButtonAction(_:)();

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  FTRecentsListViewController *v5;

  v4 = a3;
  v5 = self;
  RecentsListViewController.scrollViewWillBeginDragging(_:)((UIScrollView *)v5);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  FTRecentsListViewController *v5;

  v4 = a3;
  v5 = self;
  RecentsListViewController.scrollViewDidEndDecelerating(_:)((UIScrollView *)v5);

}

- (void)dismissContactsModal
{
  FTRecentsListViewController *v2;

  v2 = self;
  RecentsListViewController.dismissContactsModal()();

}

@end
