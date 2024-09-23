@implementation EmergencyWebRTCViewController

- (void)rttAudioRouteButtonTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10010D2F4();

}

- (void)rttCallControlsButtonTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10010D554(3);

}

- (void)rttVideoButtonTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10010D4D4();

}

- (void)recentMessageViewTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10010D554(4);

}

- (CGSize)preferredContentSize
{
  EmergencyWebRTCViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_10010E020();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (EmergencyWebRTCViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10012AEE8();
}

- (void)viewDidLoad
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10012B554();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  EmergencyWebRTCViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10012B5C0(v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  EmergencyWebRTCViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10012B6E0((uint64_t)a3);

}

- (void)updateCallStatus
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10012BBDC();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)flashButtonTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_10012EA78();

}

- (void)flipCameraButtonTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_100131B68();

}

- (void)zoomButtonTapped
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_100131FFC();

}

- (void)pinch:(id)a3
{
  id v4;
  EmergencyWebRTCViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001325F8(v4);

}

- (EmergencyWebRTCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_1001332E0();
}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self + OBJC_IVAR___EmergencyWebRTCViewController_delegate);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_webViewEventsHelper);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_currentState);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_webRTCView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_videoStreamingRequest);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_actionButtonsWaitingView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_avCaptureDevice);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_avCaptureQueue);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_zoomStateMachine);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonBottomAnchor);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonRTTBottomAnchor);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_webViewRTCViewControllerWaitingStataTopAnchor);
  sub_100135FA0((uint64_t)OBJC_IVAR___EmergencyWebRTCViewController_waitingStateTitlelabel);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_waitingStateSubtitlelabel);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___liveLabel);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___callNumberLabel);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___webRTCQualityLabel);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flashButton);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flashButtonBackdropView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonBackdropView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonBackdropView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_zoomButton);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButton);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___rttAudioRouteButton);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___rttCallControlsButton);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___rttVideoButton);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_cameraStateLabel);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_cameraStateBackgroundView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_webViewPlaceHolderView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_exclamationImageView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_titleLabelScrollView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_titleLabelScrollViewContentView);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_viewControllerWaitingStateHeightConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonWaitingStateTopConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonWaitingStateTrailingConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonSharingStateBottomConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonSharingStateTrailingConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonWidthConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonWidthConstraint);
  sub_100135FA0(OBJC_IVAR___EmergencyWebRTCViewController_flashButtonWidthConstraint);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___EmergencyWebRTCViewController_webViewWaitingStateConstraints));
}

- (void)requestCancel
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_1001335B0("EnhancedEmergency: video streaming request cancelled, request to remove webview", (SEL *)&selRef_cancelVideoStreamingRequest);

}

- (void)requestContinue
{
  EmergencyWebRTCViewController *v2;

  v2 = self;
  sub_1001335B0("EnhancedEmergency: video streaming request continued, request to start streaming video", (SEL *)&selRef_continueVideoStreamingRequest);

}

@end
