@implementation CoordinationXPC.Server

- (void)graphUpdatedWithSource:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtCC24IntelligencePlatformCore15CoordinationXPC6Server *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = sub_1C106FB14();
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_1C08E0994(v7, (unint64_t)a3, (uint64_t)v9, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)sourceUpdatedWithSourceType:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtCC24IntelligencePlatformCore15CoordinationXPC6Server *v13;

  v6 = _Block_copy(a5);
  v7 = sub_1C106FB14();
  v9 = v8;
  v10 = sub_1C106FB14();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1C08E0F40(v7, v9, v10, v12, (uint64_t)v13, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)streamUpdatedWithStreamName:(id)a3 isDelete:(BOOL)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _TtCC24IntelligencePlatformCore15CoordinationXPC6Server *v11;

  v7 = _Block_copy(a5);
  v8 = sub_1C106FB14();
  v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_1C08E15A4(v8, v10, a4, (uint64_t)v11, v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)streamsChangedWithUpdated:(id)a3 deletes:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtCC24IntelligencePlatformCore15CoordinationXPC6Server *v9;

  v6 = _Block_copy(a5);
  v7 = sub_1C106FF04();
  v8 = sub_1C106FF04();
  _Block_copy(v6);
  v9 = self;
  sub_1C08E1B50(v7, v8, (uint64_t)v9, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)migrateViewDatabasesWithCompletion:(id)a3
{
  void *v4;
  _TtCC24IntelligencePlatformCore15CoordinationXPC6Server *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1C08E2058((uint64_t)v5, v4);
  _Block_release(v4);

}

- (_TtCC24IntelligencePlatformCore15CoordinationXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore15CoordinationXPC6Server *)CoordinationXPC.Server.init()();
}

@end
