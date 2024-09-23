@implementation ClarityUIEnhancedEmergencyCoordinator

- (_TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator)init
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *result;

  sub_10017FA78();
  return result;
}

- (void)dealloc
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10017FC5C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator_coordinator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator__viewControllers));
  v3 = (char *)self + OBJC_IVAR____TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)addWebRTCViewController:(id)a3
{
  id v4;
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100180144();

}

- (void)addMediaRequestViewController:(id)a3
{
  id v4;
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1001804AC();

}

- (void)removeMediaRequestViewController:(id)a3
{
  id v4;
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1001807D8((uint64_t)v4);

}

- (void)insertWebViewUnderButtonControls:(id)a3
{
  id v4;
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100180980(v4);

}

- (void)hideWebRTCViewController:(id)a3
{
  id v4;
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100180D38((uint64_t)v4);

}

- (void)requestToEnableVideoStreamingButton
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_1001813AC();

}

- (void)requestToDisableVideoStreamingButton
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_1001813EC();

}

- (void)requestToEnableMediaUploadButton
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100181430();

}

- (void)requestToDisableMediaUploadButton
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100181474();

}

- (void)requestHapticForRequest
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_10018157C();

}

- (void)requestToAddResumeCameraLabel
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_100181698();

}

- (void)requestToAddLiveCameraLabel
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;

  v2 = self;
  sub_1001816DC();

}

- (id)getCurrentCall
{
  _TtC13InCallService37ClarityUIEnhancedEmergencyCoordinator *v2;
  id v3;

  v2 = self;
  v3 = sub_1001817F4();

  return v3;
}

- (id)getAudioRouteMenu
{
  return 0;
}

@end
