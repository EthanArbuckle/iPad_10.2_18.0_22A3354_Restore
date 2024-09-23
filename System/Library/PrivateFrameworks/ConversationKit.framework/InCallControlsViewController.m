@implementation InCallControlsViewController

- (BOOL)isExpanded
{
  char v2;

  InCallControlsViewController.isExpanded.getter();
  return v2 & 1;
}

- (void)setIsExpanded:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.isExpanded.setter(a3);

}

- (BOOL)audioIsEnabled
{
  char v2;

  InCallControlsViewController.audioIsEnabled.getter();
  return v2 & 1;
}

- (void)setAudioIsEnabled:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.audioIsEnabled.setter(a3);

}

- (BOOL)videoIsEnabled
{
  char v2;

  InCallControlsViewController.videoIsEnabled.getter();
  return v2 & 1;
}

- (void)setVideoIsEnabled:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.videoIsEnabled.setter(a3);

}

- (BOOL)isScreenSharing
{
  char v2;

  InCallControlsViewController.isScreenSharing.getter();
  return v2 & 1;
}

- (void)setIsScreenSharing:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.isScreenSharing.setter(a3);

}

- (BOOL)cinematicFramingIsAvailable
{
  char v2;

  InCallControlsViewController.cinematicFramingIsAvailable.getter();
  return v2 & 1;
}

- (void)setCinematicFramingIsAvailable:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.cinematicFramingIsAvailable.setter(a3);

}

- (BOOL)cinematicFramingIsEnabled
{
  char v2;

  InCallControlsViewController.cinematicFramingIsEnabled.getter();
  return v2 & 1;
}

- (void)setCinematicFramingIsEnabled:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.cinematicFramingIsEnabled.setter(a3);

}

- (BOOL)effectsAreAvailable
{
  char v2;

  InCallControlsViewController.effectsAreAvailable.getter();
  return v2 & 1;
}

- (void)setEffectsAreAvailable:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.effectsAreAvailable.setter(a3);

}

- (BOOL)effectsAreEnabled
{
  char v2;

  InCallControlsViewController.effectsAreEnabled.getter();
  return v2 & 1;
}

- (void)setEffectsAreEnabled:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.effectsAreEnabled.setter(a3);

}

- (BOOL)shouldShowLeaveButton
{
  char v2;

  InCallControlsViewController.shouldShowLeaveButton.getter();
  return v2 & 1;
}

- (void)setShouldShowLeaveButton:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.shouldShowLeaveButton.setter(a3);

}

- (UIView)audioButton
{
  id v2;

  InCallControlsViewController.audioButton.getter();
  return (UIView *)v2;
}

- (NSString)description
{
  _TtC15ConversationKit28InCallControlsViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = InCallControlsViewController.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3B72E00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC15ConversationKit28InCallControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsViewController.init(coder:)();
}

- (void)embedEffectsBrowserViewController:(id)a3
{
  UIViewController *v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = (UIViewController *)a3;
  v5 = self;
  InCallControlsViewController.embedEffectsBrowserViewController(_:)(v4);

}

- (void)loadView
{
  _TtC15ConversationKit28InCallControlsViewController *v2;

  v2 = self;
  InCallControlsViewController.loadView()();

}

- (void)viewDidLoad
{
  self;
  InCallControlsViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.viewDidAppear(_:)(a3);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC15ConversationKit28InCallControlsViewController *v6;

  v5 = a3;
  v6 = self;
  InCallControlsViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC15ConversationKit28InCallControlsViewController *v6;

  v5 = a3;
  v6 = self;
  InCallControlsViewController.didMove(toParent:)((UIViewController_optional *)a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit28InCallControlsViewController *v6;
  _TtC15ConversationKit28InCallControlsViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  InCallControlsViewController.traitCollectionDidChange(_:)(v8);

}

- (void)updateViewConstraints
{
  _TtC15ConversationKit28InCallControlsViewController *v2;

  v2 = self;
  InCallControlsViewController.updateViewConstraints()();

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit28InCallControlsViewController *v2;

  v2 = self;
  InCallControlsViewController.viewDidLayoutSubviews()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didTapEffectsButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapEffectsButton(_:)(v4);

}

- (void)didTapFlipCameraButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped flip camera button in in-call controls", 50, 4uLL);

}

- (void)didTapJoinLeaveButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapJoinLeaveButton(_:)(v4);

}

- (void)didTapToggleCameraButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped toggle video button in in-call controls", 51, 6uLL);

}

- (void)didTapScreenShareButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped toggle screen share in in-call controls", 51, 0xFuLL);

}

- (void)didTapToggleCinematicFramingButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped toggle center stage button in in-call controls", 58, 7uLL);

}

- (void)didTapMuteButton:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped mute audio toggle button in in-call controls", 56, 5uLL);

}

- (void)updateControlsVisibilityForExpandedState:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.updateControlsVisibility(forExpandedState:)(a3);

}

- (void)updateAudioRouteButtonFor:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.updateAudioRouteButton(for:)();

}

- (void)updateToRepresentLegacyCall:(id)a3
{
  id v4;
  _TtC15ConversationKit28InCallControlsViewController *v5;

  v4 = a3;
  v5 = self;
  InCallControlsViewController.updateToRepresentLegacyCall(_:)();

}

- (id)accessibilityHotdog
{
  return InCallControlsViewController.accessibilityHotdog()();
}

- (id)accessibilityJoinLeaveButton
{
  id v2;

  InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_joinLeaveButton);
  return v2;
}

- (id)accessibilityEffectsButton
{
  id v2;

  InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_effectsButton);
  return v2;
}

- (id)accessibilityEffectsLabel
{
  id v2;

  InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_effectsButton);
  return v2;
}

- (id)accessibilityCameraButton
{
  id v2;

  InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_flipCameraButton);
  return v2;
}

- (id)accessibilityCameraLabel
{
  id v2;

  InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_flipCameraButton);
  return v2;
}

- (id)accessibilityMuteAudioButton
{
  id v2;

  InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_muteButton);
  return v2;
}

- (id)accessibilityMuteAudioLabel
{
  id v2;

  InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_muteButton);
  return v2;
}

- (id)accessibilityRouteButton
{
  id v2;

  InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_audioRouteButton);
  return v2;
}

- (id)accessibilityRouteLabel
{
  id v2;

  InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_audioRouteButton);
  return v2;
}

- (id)accessibilityDisableVideoButton
{
  id v2;

  InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_toggleCameraButton);
  return v2;
}

- (id)accessibilityDisableVideoLabel
{
  id v2;

  InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_toggleCameraButton);
  return v2;
}

- (_TtC15ConversationKit28InCallControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  InCallControlsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_tableViewSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_collectionViewController));
  outlined destroy of AccountUpdateNotice((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_localParticipant, type metadata accessor for Participant);
  outlined consume of InCallControlsViewController.ViewContent?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super._tab + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent));
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_delegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_participantDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_participantsViewControllerDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_menuHostViewController);
}

- (void)handleLegacyCallStatusDidChangeNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC15ConversationKit28InCallControlsViewController *v8;
  uint64_t v9;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  InCallControlsViewController.handleLegacyCallStatusDidChangeNotification(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)videoButtonIsEnabled
{
  _TtC15ConversationKit28InCallControlsViewController *v2;
  char v3;
  char v4;

  v2 = self;
  InCallControlsViewController.videoButtonIsEnabled.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)setVideoButtonIsEnabled:(BOOL)a3
{
  _TtC15ConversationKit28InCallControlsViewController *v4;

  v4 = self;
  InCallControlsViewController.videoButtonIsEnabled.setter(a3);

}

@end
