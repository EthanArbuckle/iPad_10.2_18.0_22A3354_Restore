@implementation ConversationController

- (NSString)description
{
  _TtC15ConversationKit22ConversationController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ConversationController.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3B72E00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC15ConversationKit22ConversationController *v2;

  v2 = self;
  ConversationController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of AccountUpdateNotice((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_localParticipant, type metadata accessor for Participant);
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22ConversationController_audioFrequencyController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22ConversationController_audioCallbackQueue);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22ConversationController____lazy_storage___momentsController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22ConversationController_lastRegisteredMomentsProvider);
  OUTLINED_FUNCTION_21_32();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit22ConversationController_pendingNoticeWaitingForRemoteScreenShareAttributes, (uint64_t *)&demangling cache variable for type metadata for (activeConversation: Conversation, participant: Participant, notice: TUConversationNotice)?);
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22ConversationController_featureFlags);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit22ConversationController_videoMessageController);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didAddVisibleParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didRemoveVisibleParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didRemoveAllVisibleParticipants);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didFinishMigratingConversations);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateVisibleParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_visibleParticipantDidBecomeActive);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_visibleParticipantDidBecomeInactive);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_visibleParticipantKickableStatusDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didStartVideoForVisibleParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateVisibleParticipantScreenInfo);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantsMediaPrioritiesDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantDidReact);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantDidStopReacting);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantAudioPowerDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_mutedTalkerDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_audioRouteDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraBlurEnabledDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraZoomAvailabiltyDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_localCameraUIDDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraListDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraOrientationUpdateDidGetSnapshot);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraCinematicFramingAvailabilityDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraCinematicFramingEnabledDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraReactionEffectsEnabledDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraStudioLightEnabledDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_carPlayConnectedDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_oneToOneModeDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_isTrackingActiveConversationDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_avModeDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_resolvedAudioVideoModeDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_isWaitingOnFirstRemoteFrameDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_activitiesDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_collaborationNoticePosted);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_screenSharingRequestsChanged);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_audioPausedDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_bluetoothAudioFormatChanged);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalMemberAuthorizedToChangeGroupMembership);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalParticipantCameraPosition);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateRecordingLocalVideo);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didFinishWindowResize);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateLocalScreenSharing);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateHasRingingCalls);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateWantsHoldMusic);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didStartVideoForLocalParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationStateDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationLetMeInRequestStateDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationIgnoreLetMeInRequestsDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationRejectedParticipantsCountDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didAddPendingParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didRemovePendingParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didApprovePendingParticipant);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateParticipantAVMode);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didInviteOtherParticipants);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_cameraPositionDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_groupNameAndPhotoDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_sessionActionNoticePosted);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_appLaunchStateChanged);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_willTakeMoment);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_shouldPauseOnFirstLocalVideoFrame);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationLinkDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didFailToStartCamera);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_callStatusDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_greenTea3PCallStatusChanged);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_pttCallStatusDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_localParticipantRequestedVideoUpgrade);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateCaptions);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didToggleCaptions);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_didUpdateIDSCapabilities);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_videoMessageErrorOccured);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_screenSharingAvailabilityDidChange);
  OUTLINED_FUNCTION_161(OBJC_IVAR____TtC15ConversationKit22ConversationController_isRemoteParticipantEligibleForVideoMessagingBlock);
  OUTLINED_FUNCTION_732(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantMediaProviderCreator);
  OUTLINED_FUNCTION_732(OBJC_IVAR____TtC15ConversationKit22ConversationController_participantCaptionsProviderCreator);
  OUTLINED_FUNCTION_732(OBJC_IVAR____TtC15ConversationKit22ConversationController_callCenter);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_conversationUUID);
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_videoMessageConversationUUID);
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_9_42((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_callUUIDResolvingCroppedAspectRatio);
  swift_bridgeObjectRelease();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22ConversationController_screenSharingSession, &demangling cache variable for type metadata for ScreenSharingSessionProvider?);
  swift_release();
}

- (void)toggleStudioLight
{
  _TtC15ConversationKit22ConversationController *v2;

  v2 = self;
  ConversationController.toggleStudioLight()();

}

- (_TtC15ConversationKit22ConversationController)init
{
  ConversationController.init()();
}

- (void)frequencyController:(id)a3 audioPowerChanged:(float)a4 forParticipantWithStreamToken:(int64_t)a5
{
  id v6;

  v6 = a3;
  self;
  ConversationController.frequencyController(_:audioPowerChanged:forParticipantWithStreamToken:)();
}

- (void)momentsController:(id)a3 didUpdateCapabilities:(id)a4 forProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15ConversationKit22ConversationController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  ConversationController.momentsController(_:didUpdate:for:)((uint64_t)v11, v9, v10);

}

- (void)momentsController:(id)a3 willCaptureRemoteRequestFromIdentifier:(id)a4
{
  id v6;
  _TtC15ConversationKit22ConversationController *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  ConversationController.momentsController(_:willCaptureRemoteRequestFromIdentifier:)();

  swift_bridgeObjectRelease();
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4;

  v4 = a3;
  self;
  ConversationController.remoteVideoClientDidReceiveFirstFrame(_:)();
}

- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  ConversationController.remoteVideoClient(_:videoDidSuspend:)();
}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  ConversationController.remoteVideoClient(_:remoteVideoDidPause:)();
}

- (void)remoteVideoClient:(id)a3 networkQualityDidDegrade:(BOOL)a4 info:(id)a5
{
  id v7;
  _TtC15ConversationKit22ConversationController *v8;

  if (a5)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  ConversationController.remoteVideoClient(_:networkQualityDidDegrade:info:)();

  swift_bridgeObjectRelease();
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  id v5;
  _TtC15ConversationKit22ConversationController *v6;

  v5 = a3;
  v6 = self;
  ConversationController.remoteVideoClient(_:videoDidDegrade:)();

}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  id v5;

  v5 = a3;
  self;
  ConversationController.remoteVideoClient(_:remoteMediaDidStall:)();
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit22ConversationController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ConversationController.remoteVideoClient(_:remoteVideoAttributesDidChange:)();

}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  ConversationController.remoteVideoClient(_:remoteScreenAttributesDidChange:)();
}

- (void)handleCameraZoomBecameAvailable:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handleCameraZoomBecameUnavailable:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handlelocalCameraUIDDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCameraListDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleSystemPreferredCameraChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleAudioUplinkChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCameraCinematicFramingAvailabilityChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCameraCinematicFramingEnabledChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCameraReactionEffectsEnabledChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCameraStudioLightEnabledChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCameraBlurEnabledChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleLocalPreviewChanged:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handleLocalVideoPreviewFirstFrameArrived:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handleLocalVideoAttributesChanged:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handleSendingVideoChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleWindowDidFinishResize:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handleScreenConnectionDidUpdate:(id)a3
{
  @objc ConversationController.handleCameraZoomBecameAvailable(_:)();
}

- (void)handleScreenSharingDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleScreenSharingAttributesChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCallStartedConnecting:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCallConnected:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleVideoCallStatusDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleCallStatusDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleHoldMusicDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handleBluetoothAudioFormatChanged:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

- (void)handlePTTCallStatusDidChange:(id)a3
{
  @objc ConversationController.handlelocalCameraUIDDidChange(_:)();
}

@end
