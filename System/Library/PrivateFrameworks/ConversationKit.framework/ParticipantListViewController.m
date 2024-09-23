@implementation ParticipantListViewController

- (_TtC15ConversationKit29ParticipantListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantListViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit29ParticipantListViewController *v2;

  v2 = self;
  ParticipantListViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15ConversationKit29ParticipantListViewController *v4;

  v4 = self;
  ParticipantListViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit29ParticipantListViewController *v2;

  v2 = self;
  ParticipantListViewController.viewDidLayoutSubviews()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  _TtC15ConversationKit29ParticipantListViewController *v2;

  v2 = self;
  ParticipantListViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_collectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_participantListLayout));
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_viewContent), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_viewContent));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_participantsViewControllerDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_participantListViewControllerDelegate);
}

- (id)accessibilityParticipantCollectionView
{
  return ParticipantListViewController.accessibilityParticipantCollectionView()();
}

- (_TtC15ConversationKit29ParticipantListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ParticipantListViewController.init(nibName:bundle:)();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15ConversationKit29ParticipantListViewController *v14;
  uint64_t v15;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a4;
  v14 = self;
  ParticipantListViewController.collectionView(_:willDisplay:forItemAt:)((uint64_t)v14, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15ConversationKit29ParticipantListViewController *v14;
  uint64_t v15;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = a3;
  v13 = a4;
  v14 = self;
  ParticipantListViewController.collectionView(_:didEndDisplaying:forItemAt:)((uint64_t)v14, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end
