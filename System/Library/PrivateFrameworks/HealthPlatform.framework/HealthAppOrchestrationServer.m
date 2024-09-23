@implementation HealthAppOrchestrationServer

- (void)remote_fireOnceWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1BC7BB040;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 8);
  v10 = self;
  swift_retain();
  v9(sub_1BC6F7CBC, v6, ObjectType, v7);

  swift_release();
  swift_release();
}

- (void)remote_resetAndFireWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1BC7BB040;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 16);
  v10 = self;
  swift_retain();
  v9(sub_1BC6F7CBC, v6, ObjectType, v7);

  swift_release();
  swift_release();
}

- (void)remote_fetchOrchestrationStatusWithCompletion:(id)a3
{
  void (**v4)(void *, void *);
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v9;

  v4 = (void (**)(void *, void *))_Block_copy(a3);
  v5 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 24);
  v9 = self;
  v7(ObjectType, v5);
  v8 = (void *)sub_1BC817AC4();
  v4[2](v4, v8);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)remote_fetchOrchestrationGraphWithCompletion:(id)a3
{
  void (**v4)(void *, void *);
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v9;

  v4 = (void (**)(void *, void *))_Block_copy(a3);
  v5 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v9 = self;
  v7(ObjectType, v5);
  v8 = (void *)sub_1BC817C50();
  v4[2](v4, v8);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)remote_deleteCacheAndTerminateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1BC7539F8;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 40);
  v10 = self;
  swift_retain();
  v9(sub_1BC6F7CBC, v6, ObjectType, v7);

  swift_release();
  swift_release();
}

- (void)remote_cancelAllGenerationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v8;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 48);
  v8 = self;
  v7(ObjectType, v5);
  v4[2](v4);
  _Block_release(v4);

}

- (id)remote_runForegroundGenerationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v10;
  void *v11;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1BC7C8828;
  *(_QWORD *)(v8 + 24) = v5;
  v9 = *(uint64_t (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v6 + 56);
  v10 = self;
  swift_retain();
  v11 = (void *)v9(sub_1BC7C8880, v8, ObjectType, v6);

  swift_release();
  swift_release();
  return v11;
}

- (void)remote_runBackgroundGenerationWithPlugins:(id)a3 commitAsUrgent:(BOOL)a4 generationType:(unint64_t)a5 completion:(id)a6
{
  _BOOL8 v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  void (*v15)(id, _BOOL8, unint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v16;

  v6 = a4;
  v9 = _Block_copy(a6);
  if (a3)
    a3 = (id)sub_1BC817C5C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_1BC753AD0;
  *(_QWORD *)(v11 + 24) = v10;
  v12 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_1BC6F7CBC;
  *(_QWORD *)(v14 + 24) = v11;
  v15 = *(void (**)(id, _BOOL8, unint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v12 + 64);
  v16 = self;
  swift_retain();
  swift_retain();
  v15(a3, v6, a5, sub_1BC7C8880, v14, ObjectType, v12);

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)remote_requestBackgroundGenerationForFeedItemsAfterUnlockWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v8;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 72);
  v8 = self;
  v7(ObjectType, v5);
  v4[2](v4);
  _Block_release(v4);

}

- (void)remote_requestBackgroundGenerationForAllModelsAfterUnlockWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v8;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  v8 = self;
  v7(ObjectType, v5);
  v4[2](v4);
  _Block_release(v4);

}

- (void)remote_runOrRequestBackgroundGenerationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC14HealthPlatform28HealthAppOrchestrationServer *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1BC7BB040;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = *(_QWORD *)&self->protectedState[OBJC_IVAR____TtC14HealthPlatform28HealthAppOrchestrationServer_coordinator];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 88);
  v10 = self;
  swift_retain();
  v9(sub_1BC6F7CBC, v6, ObjectType, v7);

  swift_release();
  swift_release();
}

- (_TtC14HealthPlatform28HealthAppOrchestrationServer)init
{
  _TtC14HealthPlatform28HealthAppOrchestrationServer *result;

  result = (_TtC14HealthPlatform28HealthAppOrchestrationServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
