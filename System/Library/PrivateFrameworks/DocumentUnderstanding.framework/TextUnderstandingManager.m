@implementation TextUnderstandingManager

+ (_TtC21DocumentUnderstanding24TextUnderstandingManager)shared
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return (_TtC21DocumentUnderstanding24TextUnderstandingManager *)(id)static TextUnderstandingManager.shared;
}

- (_TtC21DocumentUnderstanding24TextUnderstandingManager)init
{
  return (_TtC21DocumentUnderstanding24TextUnderstandingManager *)TextUnderstandingManager.().init()();
}

- (void)pingWithReply:(id)a3
{
  @objc TextUnderstandingManager.ping(withReply:)(self, (int)a2, a3, (void (*)(void *))specialized TextUnderstandingManager.ping(withReply:));
}

- (void)triggerSpotlightFileUpdateNoArgsWithReply:(id)a3
{
  @objc TextUnderstandingManager.ping(withReply:)(self, (int)a2, a3, (void (*)(void *))specialized TextUnderstandingManager.triggerSpotlightFileUpdateNoArgs(withReply:));
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  void *v6;
  _TtC21DocumentUnderstanding24TextUnderstandingManager *v7;

  v6 = _Block_copy(a5);
  _Block_copy(v6);
  v7 = self;
  specialized TextUnderstandingManager.addOrUpdateSearchableItems(_:bundleID:completion:)((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC21DocumentUnderstanding24TextUnderstandingManager *v13;

  v8 = _Block_copy(a5);
  v9 = a3;
  v13 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  _Block_copy(v8);
  specialized TextUnderstandingManager.addSerializedDocument(_:documentType:completion:)(v10, v12, a4, (uint64_t)v13, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  outlined consume of Data._Representation(v10, v12);

}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _TtC21DocumentUnderstanding24TextUnderstandingManager *v14;

  v8 = _Block_copy(a5);
  v9 = a3;
  v14 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v8;
  TextUnderstandingManager.foundInEventResult(withSerializedDocument:documentType:completion:)(v10, v12, a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned DUResponse, @unowned NSError?) -> (), v13);
  swift_release();
  outlined consume of Data._Representation(v10, v12);

}

- (void)onBoardPoem
{
  _TtC21DocumentUnderstanding24TextUnderstandingManager *v2;

  v2 = self;
  TextUnderstandingManager.onBoardPoem()();

}

- (void)incrementallyUpdatePoem
{
  _TtC21DocumentUnderstanding24TextUnderstandingManager *v2;

  v2 = self;
  TextUnderstandingManager.incrementallyUpdatePoem()();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager____lazy_storage___client));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager____lazy_storage___updater));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager____lazy_storage___bulkupdater));
}

@end
