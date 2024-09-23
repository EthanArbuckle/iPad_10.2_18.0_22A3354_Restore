@implementation PeoplePickerViewController

- (_TtC15ConversationKit26PeoplePickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PeoplePickerViewController.init(coder:)();
}

- (_TtC15ConversationKit26PeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  PeoplePickerViewController.init(nibName:bundle:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit26PeoplePickerViewController *v2;

  v2 = self;
  PeoplePickerViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15ConversationKit26PeoplePickerViewController *v4;

  v4 = self;
  PeoplePickerViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  PeoplePickerViewController.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC15ConversationKit26PeoplePickerViewController *v4;

  v4 = self;
  PeoplePickerViewController.viewDidDisappear(_:)(a3);

}

- (void)willDismissViewAnimated:(BOOL)a3
{
  _TtC15ConversationKit26PeoplePickerViewController *v4;

  v4 = self;
  PeoplePickerViewController.willDismissViewAnimated(_:)(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_availableRecipientTintColor));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_unavailableRecipientTintColor);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_gondolaRecipientTintColor);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_restrictedRecipientTintColor);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_callProviderManager);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_senderIdentityPillView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_searchController);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_reporter);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_videoButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_audioButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_addPeopleButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_stackView);
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_selectedSenderIdentity);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_actionBar);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_currentConversation);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_currentConversationLink);
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController____lazy_storage___smsAccount));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_delegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_stagedActivity);
  OUTLINED_FUNCTION_21_32();
  swift_release();
  swift_unknownObjectRelease();
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_linkShareCoordinator, (uint64_t *)&demangling cache variable for type metadata for LinkShareCoordinatorProtocol?);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  swift_release();
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  id v4;
  _TtC15ConversationKit26PeoplePickerViewController *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerViewController.keyboardWillShow(notification:)(v4);

}

- (void)handleIDSStatusChangedWithNotification:(id)a3
{
  id v4;
  _TtC15ConversationKit26PeoplePickerViewController *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerViewController.handleIDSStatusChanged(notification:)();

}

- (void)cancelButtonTapped
{
  _TtC15ConversationKit26PeoplePickerViewController *v2;

  v2 = self;
  PeoplePickerViewController.cancelButtonTapped()();

}

- (id)menuForPillView:(id)a3
{
  id v4;
  _TtC15ConversationKit26PeoplePickerViewController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  PeoplePickerViewController.menu(for:)();
  v7 = v6;

  return v7;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4;
  _TtC15ConversationKit26PeoplePickerViewController *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerViewController.providersChanged(for:)((uint64_t)v4);

}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  id v6;
  _TtC15ConversationKit26PeoplePickerViewController *v7;
  void *v8;
  void *v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  PeoplePickerViewController.searchController(_:composeRecipientForAddress:)();
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:didAdd:)((uint64_t)v8, v7);

}

- (void)searchController:(id)a3 didRemoveRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:didRemove:)((uint64_t)v8, v7);

}

- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:willDisplayRowFor:)((uint64_t)v8, v7);

}

- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:didEndDisplayingRowFor:)((uint64_t)v8, v7);

}

- (id)searchController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;
  char **v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = PeoplePickerViewController.searchController(_:preferredRecipientFor:)((uint64_t)v8, v7);

  return v9;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:tintColorFor:)((uint64_t)v8, v7);
  v10 = v9;

  return v10;
}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;
  unint64_t v9;
  unint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:presentationOptionsFor:)((uint64_t)v8, v7);
  v10 = v9;

  return v10;
}

- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.searchController(_:didTapTableAccessoryFor:)((uint64_t)v8, v7);

}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26PeoplePickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PeoplePickerViewController.didTapTextViewAccessoryButton(for:anchoredTo:)((uint64_t)v8, v7);

}

- (id)searchController:(id)a3 contextMenuConfigurationForRecipient:(id)a4
{
  return 0;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  MFMessageComposeViewController *v6;
  _TtC15ConversationKit26PeoplePickerViewController *v7;

  v6 = (MFMessageComposeViewController *)a3;
  v7 = self;
  PeoplePickerViewController.messageComposeViewController(_:didFinishWith:)(v6, (MessageComposeResult)a4);

}

@end
