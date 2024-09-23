@implementation RemoteWidgetExtensionSession

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  _QWORD *v3;
  void (*v4)(_QWORD *, _QWORD, _QWORD, _QWORD);

  v3 = _Block_copy(a3);
  v4 = (void (*)(_QWORD *, _QWORD, _QWORD, _QWORD))v3[2];
  swift_retain();
  v4(v3, 0, 0, 0);
  _Block_release(v3);
  swift_release();
}

- (void)getCurrentDescriptorsWithCompletion:(id)a3
{
  sub_1D25B3934((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1D25B4750);
}

- (void)getAllCurrentDescriptorsWithCompletion:(id)a3
{
  sub_1D25B3934((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1D25B4834);
}

- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5
{
  _QWORD *v5;
  void (*v6)(_QWORD *, _QWORD, _QWORD);

  v5 = _Block_copy(a5);
  v6 = (void (*)(_QWORD *, _QWORD, _QWORD))v5[2];
  swift_unknownObjectRetain();
  swift_retain();
  v6(v5, 0, 0);
  _Block_release(v5);
  swift_unknownObjectRelease();
  swift_release();
}

- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5
{
  _QWORD *v5;
  void (*v6)(_QWORD *, _QWORD);

  v5 = _Block_copy(a5);
  v6 = (void (*)(_QWORD *, _QWORD))v5[2];
  swift_retain();
  v6(v5, 0);
  _Block_release(v5);
  swift_release();
}

- (uint64_t)handleURLSessionEventsFor:(int)a3 completion:(void *)aBlock
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD);

  v4 = _Block_copy(aBlock);
  v5 = (void (*)(_QWORD *, _QWORD))v4[2];
  swift_retain();
  v5(v4, 0);
  _Block_release(v4);
  return swift_release();
}

- (void)invalidate
{
  swift_retain();
  RemoteWidgetExtensionSession.invalidate()();
  swift_release();
}

- (void)getDescriptorsWithCompletion:(id)a3
{
  void (**v3)(void *, void *, _QWORD);
  void *v4;

  v3 = (void (**)(void *, void *, _QWORD))_Block_copy(a3);
  sub_1D2539514(0, (unint64_t *)&unk_1ED9620D0);
  swift_retain();
  v4 = (void *)sub_1D26CDADC();
  v3[2](v3, v4, 0);

  _Block_release(v3);
  swift_release();
}

- (void)getPlaceholdersWithEnvironment:(id)a3 for:(id)a4 completion:(id)a5
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD);
  id v8;

  v6 = _Block_copy(a5);
  v7 = (void (*)(_QWORD *, _QWORD))v6[2];
  v8 = a3;
  swift_retain();
  v7(v6, 0);
  _Block_release(v6);

  swift_release();
}

- (void)getPlaceholdersForRequests:(id)a3 inEnvironment:(id)a4 completion:(id)a5
{
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD);
  id v8;

  v6 = _Block_copy(a5);
  v7 = (void (*)(_QWORD *, _QWORD))v6[2];
  v8 = a4;
  swift_retain();
  v7(v6, 0);
  _Block_release(v6);

  swift_release();
}

- (void)getTimelineFor:(id)a3 into:(id)a4 environment:(id)a5 isPreview:(BOOL)a6 completion:(id)a7
{
  _QWORD *v10;
  void (*v11)(_QWORD *, _QWORD);
  id v12;
  id v13;
  id v14;

  v10 = _Block_copy(a7);
  v11 = (void (*)(_QWORD *, _QWORD))v10[2];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  swift_retain();
  v11(v10, 0);
  _Block_release(v10);

  swift_release();
}

- (uint64_t)pushTokensDidChange:(void *)a3 completion:(void *)aBlock
{
  _QWORD *v5;
  void (*v6)(_QWORD *, _QWORD);
  id v7;

  v5 = _Block_copy(aBlock);
  v6 = (void (*)(_QWORD *, _QWORD))v5[2];
  v7 = a3;
  swift_retain();
  v6(v5, 0);
  _Block_release(v5);

  return swift_release();
}

@end
