@implementation IMBJITAppBundleManager

+ (void)setSharedBundleManager:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1000EBCF0;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_1000EBCF0, sub_100097FB0);
  v5 = (void *)qword_1000F0850;
  qword_1000F0850 = (uint64_t)v4;

}

- (int64_t)bundleState
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState, v4, 0, 0);
  return *v2;
}

- (void)setBundleState:(int64_t)a3
{
  int64_t *v5;
  uint64_t Strong;
  uint64_t v7;
  _TtC8Business22IMBJITAppBundleManager *v8;
  _BYTE v9[24];

  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState, v9, 1, 0);
  *v5 = a3;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = self;
    sub_10006BF88();

    swift_unknownObjectRelease(v7);
  }
}

+ (id)sharedBundleManager
{
  if (qword_1000EBCF0 != -1)
    swift_once(&qword_1000EBCF0, sub_100097FB0);
  return (id)qword_1000F0850;
}

- (_TtC8Business22IMBJITAppBundleManager)init
{
  return (_TtC8Business22IMBJITAppBundleManager *)IMBJITAppBundleManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database));

  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_containerID[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_containerID[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion]);
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_delegate);
}

@end
