@implementation ConversationControlsManager

- (BOOL)isConfirmLeavePTTChannelAlertPresented
{
  return ConversationControlsManager.isConfirmLeavePTTChannelAlertPresented.getter();
}

- (void)dealloc
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_callCenter));
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_conversationController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_coreAnalyticsReporter);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_noticeCoordinator);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_contentExtractor);
  OUTLINED_FUNCTION_2_22();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_features);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_notificationCenter);
  OUTLINED_FUNCTION_2_22();
  swift_unknownObjectWeakDestroy();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager____lazy_storage___callControlsService, &demangling cache variable for type metadata for CallControlsService??);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_systemBannerPresenter);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_systemConversationControlsDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_systemAudioConversationControlsDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_inCallConversationControlsDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_inCallDetailsViewControllerDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_audioRoutingDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_localAudioTogglingDelegate);
  OUTLINED_FUNCTION_207_0(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_handoffCompletedDelegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_approvalDelegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_conduitLagunaNoticeManager);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_lagunaQueue);
  OUTLINED_FUNCTION_2_22();
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager__shouldOpenMessages;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_515(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager__shouldEnableStartingStagedActivity);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_activityManager);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_bannerActivityManager);
  OUTLINED_FUNCTION_2_22();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<TURoute?>);
  OUTLINED_FUNCTION_75(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<TUCallBluetoothAudioFormat?>);
  OUTLINED_FUNCTION_75(v6);
  OUTLINED_FUNCTION_515(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager__localAudioEnabled);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ControlsActionState>);
  OUTLINED_FUNCTION_16_0(v7);
  OUTLINED_FUNCTION_21_32();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ConversationControlsManager.PushToTalkChannelState>);
  OUTLINED_FUNCTION_16_0(v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<TUCallTransmissionMode>);
  OUTLINED_FUNCTION_16_0(v9);
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<ForegroundApp?>);
  OUTLINED_FUNCTION_16_0(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Cache<String, [ConversationControlsManager.CollaborationPrompt]>);
  OUTLINED_FUNCTION_16_0(v11);
  outlined destroy of AccountUpdateNotice((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_foregroundCollaborationState, type metadata accessor for ForegroundCollaborationState);
  OUTLINED_FUNCTION_2_22();
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<EphemeralAlert?>);
  OUTLINED_FUNCTION_16_0(v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_entitlementsChecker);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_avLessLeaveConfirmationPresentedDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_21_32();
  OUTLINED_FUNCTION_2_22();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ConversationControlsAppLaunchButtonType>);
  OUTLINED_FUNCTION_16_0(v13);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27ConversationControlsManager_screenShareCountdownTimer);
  OUTLINED_FUNCTION_2_19();
}

- (_TtC15ConversationKit27ConversationControlsManager)init
{
  ConversationControlsManager.init()();
}

- (void)joinButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.joinButtonTapped(button:)((UIControl *)v5);

}

- (void)leaveButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.leaveButtonTapped(button:)((UIControl *)v5);

}

- (void)dismissTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.dismissTapped(button:)((UIControl *)v5);

}

- (void)openMessagesButtonTapped
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.openMessagesButtonTapped()();

}

- (void)toggleMicButtonTappedWithButton:(id)a3
{
  UIControl *v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = (UIControl *)a3;
  v5 = self;
  ConversationControlsManager.toggleMicButtonTapped(button:)(v4);

}

- (void)toggleVideoButtonTappedWithButton:(id)a3
{
  UIControl *v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = (UIControl *)a3;
  v5 = self;
  ConversationControlsManager.toggleVideoButtonTapped(button:)(v4);

}

- (void)collaborateButtonTapped
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.collaborateButtonTapped()();

}

- (void)notNowButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.notNowButtonTapped(button:)((UIControl *)v5);

}

- (void)okAndDismissButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.okAndDismissButtonTapped(button:)((UIControl *)v5);

}

- (void)swapButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.swapButtonTapped(button:)((UIControl *)v5);

}

- (void)resumeCallButtonTapped
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.resumeCallButtonTapped()();

}

- (void)shareNameAndPhotoTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.shareNameAndPhotoTapped(button:)((UIControl *)v5);

}

- (void)shareNameTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.shareNameTapped(button:)((UIControl *)v5);

}

- (void)acceptNameTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptNameTapped(button:)((UIControl *)v5);

}

- (void)acceptScreenShareRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptScreenShareRequestTapped(button:)((UIControl *)v5);

}

- (void)cancelScreenShareRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.cancelScreenShareRequestTapped(button:)((UIControl *)v5);

}

- (void)declineScreenShareRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.declineScreenShareRequestTapped(button:)((UIControl *)v5);

}

- (void)acceptRemoteControlRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptRemoteControlRequestTapped(button:)((UIControl *)v5);

}

- (void)declineRemoteControlRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.declineRemoteControlRequestTapped(button:)((UIControl *)v5);

}

- (void)cancelRemoteControlRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.cancelRemoteControlRequestTapped(button:)((UIControl *)v5);

}

- (void)endRemoteControlSessionTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.endRemoteControlSessionTapped(button:)((UIControl *)v5);

}

- (void)learnMoreNotTrustedContactTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.learnMoreNotTrustedContactTapped(button:)((UIControl *)v5);

}

- (void)dismissEnhancedEmergencyRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.dismissEnhancedEmergencyRequestTapped(button:)((UIControl *)v5);

}

- (void)previewEnhancedEmergencyRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.previewEnhancedEmergencyRequestTapped(button:)((UIControl *)v5);

}

- (void)choosePhotoEnhancedEmergencyRequestTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.choosePhotoEnhancedEmergencyRequestTapped(button:)((UIControl *)v5);

}

- (void)pttLeaveButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.pttLeaveButtonTapped(button:)((UIControl *)v5);

}

- (void)dismissConfirmLeavePTTChannelAlert
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.dismissConfirmLeavePTTChannelAlert()();

}

- (void)pttDoneButtonTappedWithRecognizer:(id)a3
{
  UITapGestureRecognizer *v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  ConversationControlsManager.pttDoneButtonTapped(recognizer:)(v4);

}

- (void)pttTalkButtonGestureChangedWithRecognizer:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.pttTalkButtonGestureChanged(recognizer:)(v4);

}

- (void)endGreenTea3PCallButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.endGreenTea3PCallButtonTapped(button:)((UIControl *)v5);

}

- (void)avLessContinueButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.avLessContinueButtonTapped(button:)((UIControl *)v5);

}

- (void)continueHandoffButtonTapped
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.continueHandoffButtonTapped()();

}

- (void)lagunaPullButtonTapped
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.lagunaPullButtonTapped()();

}

- (void)acceptCallButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.acceptCallButtonTapped(button:)((UIControl *)v5);

}

- (void)rejectCallButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.rejectCallButtonTapped(button:)((UIControl *)v5);

}

- (void)callAgainButtonTappedWithButton:(id)a3
{
  id v4;
  _TtC15ConversationKit27ConversationControlsManager *v5;

  v4 = a3;
  v5 = self;
  ConversationControlsManager.callAgainButtonTapped(button:)((UIControl *)v5);

}

- (void)acceptScreenShare
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.acceptScreenShare()();

}

- (void)acceptScreenShareWithDisplayStyle
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.acceptScreenShareWithDisplayStyle()();

}

- (void)declineScreenShare
{
  _TtC15ConversationKit27ConversationControlsManager *v2;

  v2 = self;
  ConversationControlsManager.declineScreenShare()();

}

- (void)handleDidChangeIsWaitingOnFirstRemoteFrame:(id)a3
{
  @objc ConversationControlsManager.handleDidChangeIsWaitingOnFirstRemoteFrame(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ConversationControlsManager.handleDidChangeIsWaitingOnFirstRemoteFrame(_:));
}

- (void)handleIsScreeningChanged:(id)a3
{
  @objc ConversationControlsManager.handleDidChangeIsWaitingOnFirstRemoteFrame(_:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))ConversationControlsManager.handleIsScreeningChanged(_:));
}

- (void)accessibilityDidAddPendingParticipant:(id)a3
{
  uint64_t v3;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  TPNumberPadCharacter.rawValue.getter(v3);
  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end
