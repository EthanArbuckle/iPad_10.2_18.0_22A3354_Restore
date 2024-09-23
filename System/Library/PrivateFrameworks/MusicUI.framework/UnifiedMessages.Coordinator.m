@implementation UnifiedMessages.Coordinator

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v9;
  id v10;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v11;

  sub_21D7C50F4();
  sub_21D7C50F4();
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21D1DCA5C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  void *v10;
  id v11;
  id v12;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v13;

  v10 = _Block_copy(a7);
  sub_21D7C50F4();
  sub_21D7C50F4();
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_21D1D7A14();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21D1DD2CC((uint64_t)v11, a4);

  swift_release();
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21D1DD4E4();

  swift_release();
}

- (_TtCO7MusicUI15UnifiedMessages11Coordinator)init
{
  sub_21D046218();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_35();
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator_bag);
  OUTLINED_FUNCTION_8_35();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  v3 = (char *)self + OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator__impressionsTracker;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255339CF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator_engagement);
  OUTLINED_FUNCTION_94_9();
  OUTLINED_FUNCTION_94_9();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator_userDefaults);
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_94_9();
  sub_21CE3C2B4((uint64_t)self + OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator_jsStackWillReloadObserver, (uint64_t *)&unk_253F675A8);
  OUTLINED_FUNCTION_94_9();
  v5 = (char *)self + OBJC_IVAR____TtCO7MusicUI15UnifiedMessages11Coordinator__pageMetrics;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F5E2A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (BOOL)engagementTaskViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v11;
  BOOL v12;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = sub_21D207FF4(v9, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

  return v12;
}

- (void)engagementViewControllerShouldDismiss:(id)a3
{
  id v4;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_21D2F6D28();

}

- (void)engagementViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_21D2F6EA0((uint64_t)v10, v9);

}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtCO7MusicUI15UnifiedMessages11Coordinator *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21D2F7178();

  swift_release();
  return 1;
}

@end
