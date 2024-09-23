@implementation LocationDetectionManager

- (BOOL)authorized
{
  uint64_t v2;
  _TtC8NewsFeed24LocationDetectionManager *v3;
  id v4;
  uint64_t v5;

  v2 = qword_1ED3C2638;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (id)qword_1ED476978;
  v5 = sub_1BB8732F4();
  sub_1BB86EF44("WARNING! You can calling a synchronous API that can hang on macOS rdar://125515627. Need to move to async call", 110, 2, &dword_1BA493000, v4, v5, MEMORY[0x1E0DEE9D8]);

  LODWORD(v4) = objc_msgSend(*(id *)((char *)&v3->super.isa+ OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_locationManager), sel__authorizationStatus);
  return ((_DWORD)v4 - 3) < 2;
}

- (id)observableMostFrequentLocation
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observableMostFrequentLocation);
  swift_beginAccess();
  return *v2;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC8NewsFeed24LocationDetectionManager *v5;

  v4 = a3;
  v5 = self;
  _s8NewsFeed24LocationDetectionManagerC08locationE22DidChangeAuthorizationyySo010CLLocationE0CF_0();

}

- (CLLocation)mostFrequentLocation
{
  _TtC8NewsFeed24LocationDetectionManager *v2;
  id v4;

  v2 = self;
  swift_retain();
  sub_1BB86E878();

  swift_release();
  return (CLLocation *)v4;
}

- (void)addObserver:(id)a3
{
  _TtC8NewsFeed24LocationDetectionManager *v4;

  swift_unknownObjectRetain();
  v4 = self;
  LocationDetectionManager.addObserver(_:)();
  swift_unknownObjectRelease();

}

- (_TtC8NewsFeed24LocationDetectionManager)init
{
  return (_TtC8NewsFeed24LocationDetectionManager *)LocationDetectionManager.init()();
}

- (void)setObservableMostFrequentLocation:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observableMostFrequentLocation);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setMostFrequentLocation:(id)a3
{
  id v4;
  _TtC8NewsFeed24LocationDetectionManager *v5;

  v4 = a3;
  v5 = self;
  swift_retain();
  sub_1BB86E884();

  swift_release();
}

- (BOOL)locationServicesEnabled
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_locationManager), sel_locationServicesAvailable);
}

- (void)removeObserver:(id)a3
{
  uint64_t *v5;
  _TtC8NewsFeed24LocationDetectionManager *v6;
  unint64_t v7;
  uint64_t v8;

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = swift_bridgeObjectRetain();
  v8 = sub_1BB247C54(v7, (uint64_t)a3);
  swift_bridgeObjectRelease();
  *v5 = v8;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)isAuthorizedWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8NewsFeed24LocationDetectionManager *v13;
  uint64_t v14;

  sub_1BA4B07F0(0, &qword_1ED3C1DE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - v6;
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1BB872F94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF2BF000;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF2BF010;
  v12[5] = v11;
  v13 = self;
  sub_1BB247A4C((uint64_t)v7, (uint64_t)&unk_1EF2BF020, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_observableMostFrequentLocation));
  swift_release();
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8NewsFeed24LocationDetectionManager_onUserInteractedWithLocationAuthorizationTCC));
}

@end
