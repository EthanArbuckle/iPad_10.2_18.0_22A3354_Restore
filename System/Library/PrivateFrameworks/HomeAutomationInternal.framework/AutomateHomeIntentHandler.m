@implementation AutomateHomeIntentHandler

- (void)resolveTriggerForAutomateHome:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC22HomeAutomationInternal25AutomateHomeIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_220C5C738(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)resolveAutomatableTaskForAutomateHome:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC22HomeAutomationInternal25AutomateHomeIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_220C5D974(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)confirmAutomateHome:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC22HomeAutomationInternal25AutomateHomeIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_220C5F870((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleAutomateHome:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC22HomeAutomationInternal25AutomateHomeIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_220C567D0(v8, (uint64_t)sub_220B9BD88, v7);

  swift_release();
}

- (_TtC22HomeAutomationInternal25AutomateHomeIntentHandler)init
{
  return (_TtC22HomeAutomationInternal25AutomateHomeIntentHandler *)AutomateHomeIntentHandler.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomeAutomationInternal25AutomateHomeIntentHandler_genericErrorResponse));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomeAutomationInternal25AutomateHomeIntentHandler_failureNoMatchingEntities));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22HomeAutomationInternal25AutomateHomeIntentHandler_homeKitError));
  swift_bridgeObjectRelease();
}

@end
