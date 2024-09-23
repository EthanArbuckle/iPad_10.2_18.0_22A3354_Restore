@implementation ConversationNoticeViewController

- (_TtC15ConversationKit32ConversationNoticeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationNoticeViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit32ConversationNoticeViewController *v2;

  v2 = self;
  ConversationNoticeViewController.viewDidLoad()();

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC15ConversationKit32ConversationNoticeViewController *v5;
  id v6;
  UITraitCollection_optional v7;

  v6 = a3;
  v5 = self;
  v7.value.super.isa = (Class)a3;
  ConversationNoticeViewController.traitCollectionDidChange(_:)(v7);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC15ConversationKit32ConversationNoticeViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  ConversationNoticeViewController.viewWillTransition(to:with:)(a4);

  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleTapGesture
{
  _TtC15ConversationKit32ConversationNoticeViewController *v2;

  v2 = self;
  ConversationNoticeViewController.handleTapGesture()();

}

- (void)handleSystemApertureTapGesture
{
  _TtC15ConversationKit32ConversationNoticeViewController *v2;

  v2 = self;
  ConversationNoticeViewController.handleSystemApertureTapGesture()();

}

- (_TtC15ConversationKit32ConversationNoticeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  ConversationNoticeViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_controlsManager));
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_recipe, (uint64_t *)&demangling cache variable for type metadata for ConversationControlsRecipe?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_noticeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController____lazy_storage___systemApertureLeadingAccessoryTapGesture));
}

@end
