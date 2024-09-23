@implementation BannerPresentationManager

- (_TtC15ConversationKit30SystemBannerHostViewController)presentedBanner
{
  id v2;

  BannerPresentationManager.presentedBanner.getter();
  return (_TtC15ConversationKit30SystemBannerHostViewController *)v2;
}

- (void)setPresentedBanner:(id)a3
{
  id v5;
  _TtC15ConversationKit25BannerPresentationManager *v6;

  v5 = a3;
  v6 = self;
  BannerPresentationManager.presentedBanner.setter(a3);

}

- (BOOL)inCallControlsVisible
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  BannerPresentationManager.inCallControlsVisible.getter();
  v4 = v3;

  return v4 & 1;
}

- (_TtC15ConversationKit25BannerPresentationManager)init
{
  BannerPresentationManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_activityManager));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_bannerActivityManager);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentationDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_audioRoutingDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_inCallConversationControlsDelegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager__conversationControlsManager);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_handedOffCall);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_callCenter);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentedBanner);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentedSystemApertureElement);
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_presentedBannerDismissalTimer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_systemApertureElementDismissalTimer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit25BannerPresentationManager_placeholderCallCenter);
  swift_unknownObjectRelease();

}

- (void)dismissPresentedBannerForReason:(id)a3 animated:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC15ConversationKit25BannerPresentationManager *v9;
  Swift::String v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  BannerPresentationManager.dismissPresentedBanner(forReason:animated:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)invalidatePersistentSystemApertureAlertWithReason:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC15ConversationKit25BannerPresentationManager *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BannerPresentationManager.invalidatePersistentSystemApertureAlert(reason:)(v8);

  swift_bridgeObjectRelease();
}

- (NSString)inCallSceneSessionIdentifier
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  BannerPresentationManager.inCallSceneSessionIdentifier.getter();
  v4 = v3;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1C3B72E00](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (NSSet)backgroundActivitiesToSuppress
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  Class isa;

  v2 = self;
  BannerPresentationManager.backgroundActivitiesToSuppress.getter();

  type metadata accessor for STBackgroundActivityIdentifier(0);
  lazy protocol witness table accessor for type UUID and conformance UUID(&lazy protocol witness table cache variable for type STBackgroundActivityIdentifier and conformance STBackgroundActivityIdentifier, type metadata accessor for STBackgroundActivityIdentifier);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (BOOL)hasPresentedFullScreenCallUI
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  BannerPresentationManager.hasPresentedFullScreenCallUI.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isPresentingFullScreenCallUI
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  BannerPresentationManager.isPresentingFullScreenCallUI.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isAmbient
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  BannerPresentationManager.isAmbient.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isSpringBoardLocked
{
  _TtC15ConversationKit25BannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  BannerPresentationManager.isSpringBoardLocked.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)deepLinkToFullScreenCallUI
{
  _TtC15ConversationKit25BannerPresentationManager *v2;

  v2 = self;
  BannerPresentationManager.presentFullscreenUI()();

}

- (void)deepLinkToFullScreenCallDetailsView
{
  _TtC15ConversationKit25BannerPresentationManager *v2;

  v2 = self;
  BannerPresentationManager.deepLinkToFullScreenCallDetailsView()();

}

- (void)deepLinkToFullScreenPTTCallDetailsView
{
  _TtC15ConversationKit25BannerPresentationManager *v2;

  v2 = self;
  BannerPresentationManager.deepLinkToFullScreenPTTCallDetailsView()();

}

- (void)showDefaultSystemHUD
{
  _TtC15ConversationKit25BannerPresentationManager *v2;

  v2 = self;
  BannerPresentationManager.showDefaultSystemHUD()();

}

- (void)didDismiss:(id)a3 reason:(int64_t)a4
{
  id v6;
  _TtC15ConversationKit25BannerPresentationManager *v7;

  v6 = a3;
  v7 = self;
  BannerPresentationManager.didDismiss(_:reason:)(v6, a4);

}

- (void)handleCallStatusDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15ConversationKit25BannerPresentationManager *v8;
  uint64_t v9;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  BannerPresentationManager.handleCallStatusDidChange(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleAppLaunchWantsHUDDismissal:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15ConversationKit25BannerPresentationManager *v8;
  uint64_t v9;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  BannerPresentationManager.handleAppLaunchWantsHUDDismissal(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didUpdatePresentationModeToDismissed
{
  _TtC15ConversationKit25BannerPresentationManager *v2;

  v2 = self;
  BannerPresentationManager.didUpdatePresentationModeToDismissed()();

}

- (void)didUpdatePresentationModeToFullScreen
{
  _TtC15ConversationKit25BannerPresentationManager *v2;

  v2 = self;
  BannerPresentationManager.didUpdatePresentationModeToFullScreen()();

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit25BannerPresentationManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  BannerPresentationManager.conversationManager(_:removedActiveConversation:)();

}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15ConversationKit25BannerPresentationManager *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  BannerPresentationManager.conversationManager(_:stateChangedFor:fromOldConversation:)();

}

@end
