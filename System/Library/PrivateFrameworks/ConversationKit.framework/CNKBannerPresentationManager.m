@implementation CNKBannerPresentationManager

- (CNKBannerPresentationDelegate)presentationDelegate
{
  CNKBannerPresentationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  CNKBannerPresentationManager.presentationDelegate.getter();
  v4 = v3;

  return (CNKBannerPresentationDelegate *)v4;
}

- (void)setPresentationDelegate:(id)a3
{
  CNKBannerPresentationManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  CNKBannerPresentationManager.presentationDelegate.setter();

}

- (CNKAudioRoutingDelegate)audioRoutingDelegate
{
  CNKBannerPresentationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  CNKBannerPresentationManager.audioRoutingDelegate.getter();
  v4 = v3;

  return (CNKAudioRoutingDelegate *)v4;
}

- (void)setAudioRoutingDelegate:(id)a3
{
  CNKBannerPresentationManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  CNKBannerPresentationManager.audioRoutingDelegate.setter();

}

- (TUCall)handedOffCall
{
  CNKBannerPresentationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  CNKBannerPresentationManager.handedOffCall.getter();
  v4 = v3;

  return (TUCall *)v4;
}

- (void)setHandedOffCall:(id)a3
{
  id v4;
  CNKBannerPresentationManager *v5;

  v4 = a3;
  v5 = self;
  CNKBannerPresentationManager.handedOffCall.setter();

}

- (BOOL)inCallControlsVisible
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.inCallControlsVisible.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isMicIndicatorVisible
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.isMicIndicatorVisible.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)onlyHasPlaceholderCall
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.onlyHasPlaceholderCall.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)conversationIsAVLess
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.conversationIsAVLess.getter();
  v4 = v3;

  return v4 & 1;
}

- (CNKLocalAudioTogglingDelegate)localAudioTogglingDelegate
{
  CNKBannerPresentationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  CNKBannerPresentationManager.localAudioTogglingDelegate.getter();
  v4 = v3;

  return (CNKLocalAudioTogglingDelegate *)v4;
}

- (void)setLocalAudioTogglingDelegate:(id)a3
{
  CNKBannerPresentationManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  CNKBannerPresentationManager.localAudioTogglingDelegate.setter((uint64_t)a3);

}

- (NSUUID)placeholderCallGroupUUID
{
  return (NSUUID *)@objc CNKBannerPresentationManager.placeholderCallGroupUUID.getter(self, (uint64_t)a2, (void (*)(void))CNKBannerPresentationManager.placeholderCallGroupUUID.getter);
}

- (NSUUID)callUUID
{
  return (NSUUID *)@objc CNKBannerPresentationManager.placeholderCallGroupUUID.getter(self, (uint64_t)a2, (void (*)(void))CNKBannerPresentationManager.callUUID.getter);
}

- (BOOL)shouldShowCallDetailsWhenReady
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.shouldShowCallDetailsWhenReady.getter();
  v4 = v3;

  return v4 & 1;
}

- (unint64_t)applicationState
{
  CNKBannerPresentationManager *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  CNKBannerPresentationManager.applicationState.getter();
  v4 = v3;

  return v4;
}

- (void)setApplicationState:(unint64_t)a3
{
  CNKBannerPresentationManager *v4;

  v4 = self;
  CNKBannerPresentationManager.applicationState.setter(a3);

}

- (BOOL)wantsBannerWithoutScene
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.wantsBannerWithoutScene.getter();
  v4 = v3;

  return v4 & 1;
}

- (TUCall)activeCall
{
  CNKBannerPresentationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  CNKBannerPresentationManager.activeCall.getter();
  v4 = v3;

  return (TUCall *)v4;
}

- (BOOL)hasAssociatedCall
{
  CNKBannerPresentationManager *v2;
  char v3;
  char v4;

  v2 = self;
  CNKBannerPresentationManager.hasAssociatedCall.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)presentSystemHUD
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.presentSystemHUD()();

}

- (void)presentHUDForCurrentContext
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.presentHUDForCurrentContext()();

}

- (void)showInCallHUD
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showInCallHUD()();

}

- (void)showGreenTea3PHUD
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showGreenTea3PHUD()();

}

- (void)showPTTHUD
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showPTTHUD()();

}

- (void)showRemoteParticipantNoticeIfNeeded
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showRemoteParticipantNoticeIfNeeded()();

}

- (void)showAccessoryButtonEventsNoticeIfNeeded
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showAccessoryButtonEventsNoticeIfNeeded()();

}

- (void)showHandoffHUD
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showHandoffHUD()();

}

- (void)showLagunaPullConversationHUD
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.showLagunaPullConversationHUD()();

}

- (void)presentReminderNotice
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.presentReminderNotice()();

}

- (void)preloadCallChanges
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.preloadCallChanges()();

}

- (void)bannerDismissedBySpringBoard
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.bannerDismissedBySpringBoard()();

}

- (void)refreshShareableContentWithBundleIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  CNKBannerPresentationManager *v7;
  Swift::String_optional v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  CNKBannerPresentationManager.refreshShareableContentWithBundleIdentifier(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)dismissPresentedBannerForReason:(id)a3 animated:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CNKBannerPresentationManager *v9;
  Swift::String v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CNKBannerPresentationManager.dismissPresentedBanner(forReason:animated:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)invalidatePersistentSystemApertureAlertWithReason:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  CNKBannerPresentationManager *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  CNKBannerPresentationManager.invalidatePersistentSystemApertureAlert(reason:)(v8);

  swift_bridgeObjectRelease();
}

- (void)didUpdatePresentationModeToFullScreen
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.didUpdatePresentationModeToFullScreen()();

}

- (void)didUpdatePresentationModeToDismissed
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.didUpdatePresentationModeToDismissed()();

}

- (id)makeSystemApertureElementProvider
{
  CNKBannerPresentationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  CNKBannerPresentationManager.makeSystemApertureElementProvider()();
  v4 = v3;

  return v4;
}

- (void)handleLockScreenStatusChanged
{
  CNKBannerPresentationManager *v2;

  v2 = self;
  CNKBannerPresentationManager.handleLockScreenStatusChanged()();

}

- (CNKBannerPresentationManager)init
{
  return (CNKBannerPresentationManager *)CNKBannerPresentationManager.init()();
}

- (CNKBannerPresentationManager)initWithDelegate:(id)a3
{
  CNKBannerPresentationManager *result;

  swift_unknownObjectRetain();
  CNKBannerPresentationManager.init(delegate:)((uint64_t)a3);
  return result;
}

- (void).cxx_destruct
{

}

@end
