@implementation PHEnhancedEmergencyCoordinator

- (_TtP13InCallService36EnhancedEmergencyCoordinatorDelegate_)delegate
{
  return (_TtP13InCallService36EnhancedEmergencyCoordinatorDelegate_ *)(id)sub_1001373BC();
}

- (void)setDelegate:(id)a3
{
  PHEnhancedEmergencyCoordinator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100137418((uint64_t)a3);

}

- (TUCall)tuCall
{
  id v2;

  sub_10013746C();
  return (TUCall *)v2;
}

- (void)setTuCall:(id)a3
{
  id v5;
  PHEnhancedEmergencyCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1001374DC((uint64_t)a3);

}

- (int64_t)videoStreamingState
{
  return sub_100137550();
}

- (void)setVideoStreamingState:(int64_t)a3
{
  sub_100137584(a3);
}

- (int64_t)eedRTTState
{
  return sub_1001375CC();
}

- (void)setEedRTTState:(int64_t)a3
{
  sub_100137600(a3);
}

- (PHEnhancedEmergencyCoordinator)init
{
  return (PHEnhancedEmergencyCoordinator *)sub_100137610();
}

- (BOOL)videoStreamingIsOnScreen
{
  PHEnhancedEmergencyCoordinator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100137B38();

  return v3 & 1;
}

- (BOOL)mediaUploadIsOnScreen
{
  PHEnhancedEmergencyCoordinator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100137C7C();

  return v3 & 1;
}

- (BOOL)videoStreamingRequestHasBeenAccepted
{
  return sub_100137D50() & 1;
}

- (void)setVideoStreamingRequestHasBeenAccepted:(BOOL)a3
{
  sub_100137D84(a3);
}

- (BOOL)shouldHideVideoStreamingControls
{
  return sub_100137DB8() & 1;
}

- (void)setShouldHideVideoStreamingControls:(BOOL)a3
{
  PHEnhancedEmergencyCoordinator *v4;

  v4 = self;
  sub_100137E08(a3);

}

- (void)handleDeviceLockEvent
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_1001383FC();

}

- (void)handleDismissRequest
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100138CC8();

}

- (void)handleJindoRequestToChoosePhoto
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100138F8C();

}

- (void)handleBannerPreviewRequest
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_1001393B8();

}

- (void)handleBannerUploadRequestDismissDuringStreaming
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100139400();

}

- (void)handleBannerUploadRequestPickerDuringStreaming
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100139684();

}

- (void)handleMediaUploadButtonTapped
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013A16C();

}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self + OBJC_IVAR___PHEnhancedEmergencyCoordinator_delegate);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_tuCall);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_emergencyWebRTCViewController);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_emegencyMediaRequestViewController);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_rttRecentMessageViewController);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_pipCoordinator);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_eedRequestHelper);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_eedRequestQueue);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_videoStreamingRequest);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___PHEnhancedEmergencyCoordinator_mediaSet));
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_mediaUploadRequest);
  sub_100135FA0(OBJC_IVAR___PHEnhancedEmergencyCoordinator_mitigation);

}

- (void)requestToReorderWebView
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013EDC0();

}

- (void)videoStreamingAboutToStart
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013EE6C();

}

- (void)cancelVideoStreamingRequest
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013F02C();

}

- (void)continueVideoStreamingRequest
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013F260();

}

- (void)cameraTurnedOffForRemoteSide
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013F588();

}

- (void)cameraTurnedOnForRemoteSide
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013F650("EnhancedEmergency: emergency coordinator gets notified camera is turned on for remote side, going to remove intermittent label");

}

- (void)runAnimationToFullScreenWebView
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10013F774();

}

- (void)handleFatalErrorWithRetryable:(BOOL)a3
{
  PHEnhancedEmergencyCoordinator *v3;

  v3 = self;
  sub_10013F8F0(0);

}

- (void)videoStreamQuality:(id)a3
{
  id v4;
  PHEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10013FA6C();

}

- (void)zoomLevelChange:(double)a3
{
  sub_10013FAF4();
}

- (void)torchStateChangeTo:(BOOL)a3
{
  PHEnhancedEmergencyCoordinator *v4;

  v4 = self;
  sub_10013FB38(a3);

}

- (void)webRTCstateChange:(id)a3
{
  id v4;
  PHEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_10013FBB8();

}

- (void)cameraFacingChange:(int64_t)a3
{
  PHEnhancedEmergencyCoordinator *v3;

  v3 = self;
  sub_10013FC40();

}

- (void)notifyMitigationNeeded:(id)a3
{
  id v4;
  PHEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100141B24(v4);

}

- (void)handleRTTVideoStreamingButtonTapped
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100143FE0();

}

- (int64_t)getRTTState
{
  return sub_100144068();
}

- (void)updateRTTEnabled:(BOOL)a3
{
  PHEnhancedEmergencyCoordinator *v4;

  v4 = self;
  sub_10014409C(a3);

}

- (void)transitionToRTTState:(int64_t)a3
{
  PHEnhancedEmergencyCoordinator *v4;

  v4 = self;
  sub_10014426C(a3);

}

- (void)appWillResignActive
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100144E60();

}

- (id)getAudioRouteMenu
{
  PHEnhancedEmergencyCoordinator *v2;
  id v3;

  v2 = self;
  v3 = sub_100144F5C();

  return v3;
}

- (void)updateRTTAudioRouteButton
{
  PHEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100144FE8();

}

- (BOOL)isShownAboveCoverSheet
{
  PHEnhancedEmergencyCoordinator *v2;
  char v3;

  v2 = self;
  v3 = sub_100145074();

  return v3 & 1;
}

@end
