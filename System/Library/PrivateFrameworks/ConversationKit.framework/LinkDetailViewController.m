@implementation LinkDetailViewController

- (_TtC15ConversationKit24LinkDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  LinkDetailViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit24LinkDetailViewController *v2;

  v2 = self;
  LinkDetailViewController.viewDidLoad()();

}

- (_TtC15ConversationKit24LinkDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  LinkDetailViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___collectionView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___dataSource);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___supplementaryViewProvider);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___cellProvider);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_cellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<LinkDetailParticipantCollectionViewCell, LinkDetailViewController.Item>?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_deleteCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<LinkDetailActionCollectionViewCell, LinkDetailViewController.Item>?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_shareCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<LinkDetailActionCollectionViewCell, LinkDetailViewController.Item>?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_linkDetailHeaderSupplementaryViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<LinkDetailHeaderView>?);
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_cellBackgroundConfiguration;
  v4 = type metadata accessor for UIBackgroundConfiguration();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_linkShareCoordinator);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_avatarController);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_detailControllerFactory);
}

- (void)didTapDeleteLinkButton
{
  _TtC15ConversationKit24LinkDetailViewController *v2;

  v2 = self;
  LinkDetailViewController.didTapDeleteLinkButton()();

}

- (void)didTapJoin
{
  _TtC15ConversationKit24LinkDetailViewController *v2;

  v2 = self;
  LinkDetailViewController.didTapJoin()();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15ConversationKit24LinkDetailViewController *v11;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  LinkDetailViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
