@implementation MultiwayViewController

- (void)testing_didFinishLocalPreviewRotationAnimation
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.testing_didFinishLocalPreviewRotationAnimation()();

}

- (void)didTapChangeLayoutButton
{
  self;
  MultiwayViewController.didTapChangeLayoutButton()();
}

- (void)didTapDeskViewButton
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.didTapDeskViewButton()();

}

- (BOOL)isInCallEndedBlockAndReportFlow
{
  char v2;

  MultiwayViewController.isInCallEndedBlockAndReportFlow.getter();
  return v2 & 1;
}

- (void)setIsInCallEndedBlockAndReportFlow:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.isInCallEndedBlockAndReportFlow.setter(a3);

}

- (CNKBannerPresentationManager)bannerPresentationManager
{
  id v2;

  MultiwayViewController.bannerPresentationManagerBox.getter();
  return (CNKBannerPresentationManager *)v2;
}

- (void)setBannerPresentationManager:(id)a3
{
  id v5;
  _TtC15ConversationKit22MultiwayViewController *v6;

  v5 = a3;
  v6 = self;
  MultiwayViewController.bannerPresentationManagerBox.setter(a3);

}

- (BOOL)isShowingReactions
{
  return MultiwayViewController.isShowingReactions.getter() & 1;
}

- (BOOL)didExpandIncomingCallBanner
{
  char v2;

  MultiwayViewController.didExpandIncomingCallBanner.getter();
  return v2 & 1;
}

- (void)setDidExpandIncomingCallBanner:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.didExpandIncomingCallBanner.setter(a3);

}

- (NSTimer)inCallControlsDismissTimer
{
  return (NSTimer *)MultiwayViewController.inCallControlsDismissTimer.getter();
}

- (void)setInCallControlsDismissTimer:(id)a3
{
  id v5;
  _TtC15ConversationKit22MultiwayViewController *v6;

  v5 = a3;
  v6 = self;
  MultiwayViewController.inCallControlsDismissTimer.setter((uint64_t)a3);

}

- (TUCall)call
{
  id v2;

  MultiwayViewController.call.getter();
  return (TUCall *)v2;
}

- (BOOL)wantsApplicationDismissalStyle
{
  return 1;
}

- (int64_t)deviceOrientation
{
  int64_t result;

  MultiwayViewController.deviceOrientation.getter();
  return result;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.deviceOrientation.setter(a3);

}

- (int64_t)frontBoardInterfaceOrientation
{
  int64_t result;

  MultiwayViewController.frontBoardInterfaceOrientation.getter();
  return result;
}

- (void)setFrontBoardInterfaceOrientation:(int64_t)a3
{
  MultiwayViewController.frontBoardInterfaceOrientation.setter(a3);
}

- (BOOL)wantsPIPRotationForLocalPreview
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.wantsPIPRotationForLocalPreview.getter();
  v4 = v3;

  return v4 & 1;
}

- (int64_t)supportedDeviceOrientations
{
  int64_t result;

  MultiwayViewController.supportedDeviceOrientations.getter();
  return result;
}

- (void)setSupportedDeviceOrientations:(int64_t)a3
{
  MultiwayViewController.supportedDeviceOrientations.setter(a3);
}

- (BOOL)isOnScreen
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;

  v2 = self;
  v3 = MultiwayViewController.isOnScreen.getter();

  return v3 & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v3;

  v3 = self;
  MultiwayViewController.isOnScreen.setter();

}

- (BOOL)hasParticipantVideo
{
  char v2;

  MultiwayViewController.hasParticipantVideo.getter();
  return v2 & 1;
}

- (void)setHasParticipantVideo:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  SharedContentViewController.isPipped.setter(a3, &OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_hasParticipantVideo, (void (*)(uint64_t))MultiwayViewController.hasParticipantVideo.didset);

}

- (BOOL)isDisplayedInBanner
{
  char v2;

  MultiwayViewController.isDisplayedInBanner.getter();
  return v2 & 1;
}

- (void)setIsDisplayedInBanner:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.isDisplayedInBanner.setter(a3);

}

- (BOOL)isInVideoMessageFlow
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.isInVideoMessageFlow.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isShowingHUD
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.isShowingHUD.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isFullScreen
{
  char v2;

  MultiwayViewController.isFullScreen.getter();
  return v2 & 1;
}

- (void)setIsFullScreen:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.isFullScreen.setter(a3);

}

- (BOOL)isAmbient
{
  char v2;

  MultiwayViewController.isAmbient.getter();
  return v2 & 1;
}

- (void)setIsAmbient:(BOOL)a3
{
  MultiwayViewController.isAmbient.setter(a3);
}

- (BOOL)isShownAboveCoverSheet
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.isShownAboveCoverSheet.getter();
}

- (BOOL)isPipStashed
{
  char v2;

  MultiwayViewController.isPipStashed.getter();
  return v2 & 1;
}

- (void)setIsPipStashed:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.isPipStashed.setter(a3);

}

- (int64_t)pipState
{
  int64_t result;

  MultiwayViewController.pipState.getter();
  return result;
}

- (void)setPipState:(int64_t)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.pipState.setter(a3);

}

- (BOOL)isCaptioningEnabled
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.isCaptioningEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)setIsCaptioningEnabled:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.isCaptioningEnabled.setter(a3);

}

- (BOOL)isPipped
{
  char v2;

  MultiwayViewController.isPipped.getter();
  return v2 & 1;
}

- (UIView)localParticipantView
{
  id v2;

  MultiwayViewController.localParticipantView.getter();
  return (UIView *)v2;
}

- (_TtC15ConversationKit33VideoReactionPickerViewController)reactionsViewController
{
  return (_TtC15ConversationKit33VideoReactionPickerViewController *)MultiwayViewController.reactionsViewController.getter();
}

- (CNKFaceTimeMultiwayConversationViewControllerDelegate)delegate
{
  MultiwayViewController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  MultiwayViewController.delegate.setter();

}

- (CNKFaceTimeMultiwayViewControllerIOSDelegate)iOSDelegate
{
  MultiwayViewController.iOSDelegate.getter();
}

- (void)setIOSDelegate:(id)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  MultiwayViewController.iOSDelegate.setter();

}

- (BOOL)effectsEnabled
{
  char v2;

  MultiwayViewController.effectsEnabled.getter();
  return v2 & 1;
}

- (void)setEffectsEnabled:(BOOL)a3
{
  MultiwayViewController.effectsEnabled.setter(a3);
}

- (UIViewController)pipViewController
{
  return (UIViewController *)(id)MultiwayViewController.pipViewController.getter();
}

- (CGSize)preferredPIPContentAspectRatio
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = MultiwayViewController.preferredPIPContentAspectRatio.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)fullScreenFocusedParticipantOrientation
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = MultiwayViewController.fullScreenFocusedParticipantOrientation.getter();

  return v3;
}

- (BOOL)isOneToOneModeEnabled
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.isOneToOneModeEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)shouldDisconnectOnDismissal
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.shouldDisconnectOnDismissal.getter();
  v4 = v3;

  return v4 & 1;
}

- (CGRect)mediaPipFrameInWindowScene
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = MultiwayViewController.mediaPipFrameInWindowScene.getter();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setMediaPipFrameInWindowScene:(CGRect)a3
{
  _TtC15ConversationKit22MultiwayViewController *v3;

  v3 = self;
  MultiwayViewController.mediaPipFrameInWindowScene.setter();

}

- (BOOL)isScreenSharingFullScreen
{
  char v2;

  MultiwayViewController.isScreenSharingFullScreen.getter();
  return v2 & 1;
}

- (void)setIsScreenSharingFullScreen:(BOOL)a3
{
  MultiwayViewController.isScreenSharingFullScreen.setter(a3);
}

- (_TtC15ConversationKit22MultiwayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  MultiwayViewController.init(coder:)();
}

- (void)dealloc
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3;
  _BYTE v4[216];

  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_queryForSuggestedBannerStartTime, (uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_remoteControlAccessoryEventsAgent);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_featureFlags);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_conversationController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_bannerPresentationManagerBox);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_showReactionPickerTimer);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_reactionPickerTip, (uint64_t *)&demangling cache variable for type metadata for VideoReactionPickerTip?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_avcEffects);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_effectsCaptureInfo);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_linkShareCoordinator, (uint64_t *)&demangling cache variable for type metadata for LinkShareCoordinatorProtocol?);
  outlined init with take of MultiwayViewController.ViewContent?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_viewContent, (uint64_t)v4, (uint64_t *)&demangling cache variable for type metadata for MultiwayViewController.ViewContent?);
  _s15ConversationKit22MultiwayViewControllerC0D7ContentVSgWOrTm_0((uint64_t)v4);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_callDetailsCoordinator);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_inCallControlsDismissTimer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_effectsLayoutController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_pipZoomControl);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_hideOneToOneLivePhotoAlertViewTimer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_mutedBannerViewController);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_features);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  OUTLINED_FUNCTION_60_11(*(_QWORD *)(v3 - 8));
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_deskViewTapHandler);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_windowAspectRatioHandler);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_captionsLayoutChangeHandler);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_unansweredCallDismissalHandler);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_delegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_iOSDelegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_lastUpdatedMostActiveParticipantViewForPiP);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController____lazy_storage___flashView);
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC15ConversationKit22MultiwayViewController____lazy_storage___insulatingView));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22MultiwayViewController_tonePlayer);
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.viewDidDisappear(_:)(a3);

}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.viewSafeAreaInsetsDidChange()();

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.viewDidLayoutSubviews()();

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC15ConversationKit22MultiwayViewController *v6;

  v5 = a3;
  v6 = self;
  MultiwayViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateViewConstraints
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.updateViewConstraints()();

}

- (BOOL)axShouldDisableAutoHidingControls
{
  return OUTLINED_FUNCTION_3_13() & 1;
}

- (void)toggleAudioMute
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.toggleAudioMute()();

}

- (void)toggleVideoMuteWithShouldPauseIfStopped:(BOOL)a3
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.toggleVideoMute(shouldPauseIfStopped:)(a3);

}

- (void)toggleCinematicFraming
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.toggleCinematicFraming()();

}

- (void)muteVideo
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.muteVideo()();

}

- (void)openMessagesConversation
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.openMessagesConversation()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC15ConversationKit22MultiwayViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  MultiwayViewController.viewWillTransition(to:with:)(a4);

  swift_unknownObjectRelease();
}

- (void)hideEffectsBrowser
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.hideEffectsBrowser()();

}

- (void)updateVideoState
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.updateVideoState()();

}

- (id)accessibilityConstraintController
{
  return MultiwayViewController.accessibilityConstraintController()();
}

- (_TtC15ConversationKit22MultiwayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  MultiwayViewController.init(nibName:bundle:)();
}

- (BOOL)isReadyToShowCallDetails
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.isReadyToShowCallDetails.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  _TtC15ConversationKit22MultiwayViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  MultiwayViewController.screenSharingInteractionController(_:didUpdateRemoteControlStatus:)((uint64_t)v6, a4);
  swift_unknownObjectRelease();

}

- (void)toggleLocalOrientation
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.toggleLocalOrientation()();

}

- (void)pipDidRotate
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.pipDidRotate()();

}

- (void)toggleReactionsView
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.toggleReactionsView()();

}

- (void)didTapOneToOneShutterButton
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.didTapOneToOneShutterButton()();

}

- (BOOL)isPresentingEffectsBrowser
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  char v3;
  char v4;

  v2 = self;
  MultiwayViewController.isPresentingEffectsBrowser.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)resetEffectsState
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.resetEffectsState()();

}

- (id)audioRouteMenu
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.audioRouteMenu()();
}

- (id)audioRouteGlyphFor:(id)a3
{
  id v4;
  _TtC15ConversationKit22MultiwayViewController *v5;

  v4 = a3;
  v5 = self;
  MultiwayViewController.audioRouteGlyph(for:)();
}

- (UIImage)audioRouteGlyphForDevice
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.audioRouteGlyphForDevice.getter();
}

- (void)cameraViewController:(id)a3 didRenderFrame:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit22MultiwayViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  MultiwayViewController.cameraViewController(_:didRenderFrame:)(v6, v7);

}

- (void)cameraViewControllerPresentationRectWasDoubleTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit22MultiwayViewController *v5;

  v4 = a3;
  v5 = self;
  MultiwayViewController.cameraViewControllerPresentationRectWasDoubleTapped(_:)((CFXCameraViewController *)v5);

}

- (void)cameraViewController:(id)a3 presentationRectWasPinchedWithState:(int64_t)a4 scale:(double)a5 velocity:(double)a6
{
  id v8;
  _TtC15ConversationKit22MultiwayViewController *v9;

  v8 = a3;
  v9 = self;
  MultiwayViewController.cameraViewController(_:presentationRectWasPinchedWith:scale:velocity:)(a5);

}

- (void)cameraViewController:(id)a3 didChangeEffectsState:(int64_t)a4
{
  id v5;
  _TtC15ConversationKit22MultiwayViewController *v6;

  v5 = a3;
  v6 = self;
  MultiwayViewController.cameraViewController(_:didChange:)();

}

- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3
{
  id v4;
  _TtC15ConversationKit22MultiwayViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  MultiwayViewController.shouldAlwaysPresentExpandedApps(for:)();
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t (*v9)();
  id v10;
  id v11;
  _TtC15ConversationKit22MultiwayViewController *v12;

  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v9;
    v9 = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  MultiwayViewController.effectBrowserViewController(_:presentExpandedAppViewController:animated:completion:)();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v9);

}

- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v9;
  id v10;
  id v11;
  _TtC15ConversationKit22MultiwayViewController *v12;

  v9 = _Block_copy(a6);
  if (v9)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v9;
    v9 = _sIeyB_Ieg_TRTA_0;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  MultiwayViewController.effectBrowserViewController(_:dismissExpandedAppViewController:animated:completion:)();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v9);

}

- (CGSize)expandedAppViewControllerSizeForEffectBrowserViewController:(id)a3
{
  id v4;
  _TtC15ConversationKit22MultiwayViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  v5 = self;
  MultiwayViewController.expandedAppViewControllerSize(for:)();
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4
{
  id v6;
  _TtC15ConversationKit22MultiwayViewController *v7;

  v6 = a3;
  v7 = self;
  MultiwayViewController.effectBrowserViewController(_:willChangeDockHeight:)(a4);

}

- (void)didCaptureVideoFrame:(id)a3
{
  id v4;
  _TtC15ConversationKit22MultiwayViewController *v5;

  v4 = a3;
  v5 = self;
  MultiwayViewController.didCapture(_:)(v4);

}

- (void)serverDidTimeout:(id)a3
{
  id v4;
  _TtC15ConversationKit22MultiwayViewController *v5;

  v4 = a3;
  v5 = self;
  MultiwayViewController.serverDidTimeout(_:)();

}

- (void)setControlsState:(int64_t)a3 animated:(BOOL)a4
{
  _TtC15ConversationKit22MultiwayViewController *v4;

  v4 = self;
  MultiwayViewController.setControlsState(_:animated:)();

}

- (void)bannerDidGetTap
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.bannerDidGetTap()();

}

- (CGRect)frameForRestoreAnimation
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  __C::CGRect v11;
  CGRect result;

  v2 = self;
  v11 = MultiwayViewController.frameForRestoreAnimation()();
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;

  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGSize)preferredPiPContentAspectRatio
{
  _TtC15ConversationKit22MultiwayViewController *v2;
  CGSize v3;
  double width;
  double height;
  CGSize result;

  v2 = self;
  v3 = MultiwayViewController.preferredPiPContentAspectRatio()();

  width = v3.width;
  height = v3.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)restoreViewControllerHierarchyWhenExitingPiP
{
  return 0;
}

- (void)prepareForAppSwitcher
{
  _TtC15ConversationKit22MultiwayViewController *v2;

  v2 = self;
  MultiwayViewController.prepareForAppSwitcher()();

}

- (void)cancelVideoRecordingWithCompletion:(id)a3
{
  void *v4;
  uint64_t (*v5)(char);
  _TtC15ConversationKit22MultiwayViewController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Bool) -> ();
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  MultiwayViewController.cancelVideoRecording(completion:)();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?((uint64_t)v5);

}

- (void)didConfirmForInterventionViewController:(id)a3
{
  @objc MultiwayViewController.didConfirm(forInterventionViewController:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))MultiwayViewController.didConfirm(forInterventionViewController:));
}

- (void)didRejectForInterventionViewController:(id)a3
{
  @objc MultiwayViewController.didConfirm(forInterventionViewController:)(self, (uint64_t)a2, (uint64_t)a3, MultiwayViewController.didReject(forInterventionViewController:));
}

@end
