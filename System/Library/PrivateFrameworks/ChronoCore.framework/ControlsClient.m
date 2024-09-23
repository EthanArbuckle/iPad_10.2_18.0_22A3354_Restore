@implementation ControlsClient

- (_TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient)init
{
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *result;

  result = (_TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__processHandle));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__queue_connection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)sendPushToken:(id)a3 completion:(id)a4
{
  sub_1D2853E58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1D292BF44);
}

- (void)sendPushUpdate:(id)a3 completion:(id)a4
{
  void (**v6)(void *, _QWORD);
  id v7;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v8;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = a3;
  v8 = self;
  BSDispatchQueueAssert();
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)((char *)&v8->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__services)+ 37, (*(_QWORD **)((char *)&v8->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient__services))[40]);
  sub_1D273496C(v7);
  v6[2](v6, 0);
  _Block_release(v6);

}

- (void)unsubscribeToPushes:(id)a3 completion:(id)a4
{
  sub_1D2853E58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1D292C600);
}

- (void)reloadControlsForExtension:(id)a3 kind:(id)a4 reason:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v15;

  v7 = sub_1D29C59E8();
  v9 = v8;
  if (a4)
  {
    v10 = sub_1D29C59E8();
    a4 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = sub_1D29C59E8();
  v14 = v13;
  v15 = self;
  sub_1D2926868(v7, v9, v10, (uint64_t)a4, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateControlHost:(id)a3 configuration:(id)a4 activationState:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v13;

  v8 = sub_1D29C59E8();
  v10 = v9;
  v11 = a4;
  v12 = a5;
  v13 = self;
  sub_1D2926B0C(v8, v10, (uint64_t)a4, v12);

  swift_bridgeObjectRelease();
}

- (void)updateControlHost:(id)a3 activationState:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v10;

  v6 = sub_1D29C59E8();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_1D292717C(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)invalidateControlHost:(id)a3
{
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v4;

  sub_1D29C59E8();
  v4 = self;
  sub_1D2927724();

  swift_bridgeObjectRelease();
}

- (void)subscribeToSessionWithRequest:(id)a3 completion:(id)a4
{
  sub_1D2929480(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1D292C914);
}

- (void)unsubscribeFromSession:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_1D29C1668();
  v7 = v6;

  sub_1D2927CA4();
  sub_1D273BE68(v5, v7);

}

- (void)setTaskPriority:(id)a3 forSession:(id)a4
{
  sub_1D2928BAC(self, (uint64_t)a2, a3, a4, (void (*)(id, uint64_t, unint64_t))sub_1D29281D0);
}

- (void)setVisibility:(id)a3 forSession:(id)a4
{
  sub_1D2928BAC(self, (uint64_t)a2, a3, a4, (void (*)(id, uint64_t, unint64_t))sub_1D2928894);
}

- (void)setEnvironmentModifiers:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v14;

  v6 = a3;
  v7 = a4;
  v14 = self;
  v8 = sub_1D29C1668();
  v10 = v9;

  v11 = sub_1D29C1668();
  v13 = v12;

  sub_1D2928C3C(v8, v10);
  sub_1D273BE68(v11, v13);
  sub_1D273BE68(v8, v10);

}

- (void)performControlAction:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = sub_1D29C1668();
  v10 = v9;

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v6;
  sub_1D29290B8(v8, v10, (uint64_t)sub_1D27B3278, v11);
  swift_release();
  sub_1D273BE68(v8, v10);

}

- (void)setControlState:(id)a3 completion:(id)a4
{
  sub_1D2929480(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1D292DF44);
}

- (void)fetchControlDescriptorsForExtensionBundleIdentifier:(id)a3 userInitiated:(id)a4 reason:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v17;

  v8 = _Block_copy(a6);
  v9 = sub_1D29C59E8();
  v11 = v10;
  v12 = sub_1D29C59E8();
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v8;
  v16 = a4;
  v17 = self;
  sub_1D2929528(v9, v11, v16, v12, v14, (uint64_t)sub_1D27CD1C4, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)controlDescriptorMatching:(id)a3 completion:(id)a4
{
  sub_1D2853E58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1D292E2A4);
}

- (void)allControlConfigurationsByHostWithCompletion:(id)a3
{
  void *v4;
  _TtC10ChronoCoreP33_EA538E35880E8FB207AEB42F397305AE14ControlsClient *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1D292E3AC((uint64_t)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

@end
